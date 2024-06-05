import git
from git.exc import GitCommandError, NoSuchPathError, InvalidGitRepositoryError


# Define the repository URL and local directory


def pull_latest_changes(repo_url, local_dir):
    """
    Pull the latest changes from a GitHub repository.

    Parameters:
    repo_url (str): The URL of the remote repository.
    local_dir (str): The local directory where the repository is cloned.

    Returns:
    str: A message indicating the result of the operation.
    """
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
            status = repo.git.status()
            return (f"The local repository has uncommitted changes or untracked files:\n{status}\n"
                    "Please commit or stash your changes before pulling.")
        else:
            origin = repo.remotes.origin
            print("Pulling latest changes from the remote repository...")
            result = origin.pull()
            messages = [f"Ref: {fetch_info.ref} - New commit: {fetch_info.commit}" for fetch_info in result]
            return "Pull successful. Changes pulled:\n" + "\n".join(messages)
    except GitCommandError as e:
        return (f"Failed to pull from the remote repository: {e}\n"
                f"Command output:\n{e.stdout}\n{e.stderr}")
    except Exception as e:
        return f"An unexpected error occurred: {e}"