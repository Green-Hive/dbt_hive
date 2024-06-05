from airflow import DAG 
from airflow.operators.python_operator import PythonOperator 
from airflow.operators.bash_operator import BashOperator 
from datetime import datetime, timedelta
import sys
sys.path.append('utils')
from git_operations import pull_latest_changes
import os


CURRENT_PATH = os.path.dirname(os.path.realpath(__file__))
DBT_BASE_PATH = os.path.join(CURRENT_PATH,os.pardir)

# Default arguments for the DAG
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2023, 6, 1),
    'retries': 1,
    'retry_delay': timedelta(minutes=2),
}

# Define the DAG
dag = DAG(
    'git_dbt_pipeline',
    default_args=default_args,
    description='A DAG to pull latest changes from GitHub and run dbt',
    schedule_interval=timedelta(days=1),
)

def pull_changes():
    repo_url = 'git@github.com:Green-Hive/dbt_hive.git'
    local_dir = os.path.dirname(os.path.realpath(__file__))
    result = pull_latest_changes(repo_url, local_dir)
    print(result)

# Define the Git pull task
git_pull_task = PythonOperator(
    task_id='pull_latest_changes',
    python_callable=pull_changes,
    dag=dag,
)

# Define the dbt run command
dbt_run_command = f"""
cd {DBT_BASE_PATH} && \
dbt run --profiles-dir {DBT_BASE_PATH}
"""

# Define the dbt run task
dbt_run_task = BashOperator(
    task_id='dbt_run',
    bash_command=dbt_run_command,
    dag=dag,
)

# Set task dependencies
git_pull_task >> dbt_run_task
