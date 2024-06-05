
import sys
import os
utils_path = os.path.abspath(os.path.join(os.path.dirname(__file__), '../../utils'))
sys.path.append(utils_path)

from utils.git_operations import pull_latest_changes

pull_latest_changes
