import git
from git.exc import GitCommandError, NoSuchPathError, InvalidGitRepositoryError

import os

# Define the repository URL and local directory
repo_url = 'git@github.com:Green-Hive/dbt_hive.git'
local_dir = os.path.dirname(os.path.realpath(__file__))

try:
    repo = git.Repo(local_dir)
except NoSuchPathError:
    print(f"Local directory {local_dir} does not exist. Cloning the repository.")
    repo = git.Repo.clone_from(repo_url, local_dir)
except InvalidGitRepositoryError:
    print(f"{local_dir} is not a valid git repository. Cloning the repository.")
    repo = git.Repo.clone_from(repo_url, local_dir)

try:
    # Check for uncommitted changes
    if repo.is_dirty(untracked_files=True):
        print("The local repository has uncommitted changes or untracked files. Please commit or stash them before pulling.")
    else:
        origin = repo.remotes.origin
        print("Pulling latest changes from the remote repository...")
        result = origin.pull()
        print("Pull successful. Changes pulled:")
        for info in result:
            print(info.summary)
except GitCommandError as e:
    print(f"Failed to pull from the remote repository: {e}")
    print("Command output:")
    print(e.stdout)  # Print standard output from the failed command
    print(e.stderr)  # Print standard error from the failed command
except Exception as e:
    print(f"An unexpected error occurred: {e}")