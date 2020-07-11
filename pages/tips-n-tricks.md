## ZSH on OSX ##
- Install homebrew > /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
- Install> $ brew install zsh
- Adding oh-my-zsh > sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
- Favourite shell -> ZSH_THEME="jonathan"

## Multiple git Accounts ##

Step 1: Add multiple ssh keys to your local folder i.e
  - ~/.ssh/personal_ssh.pub
  - ~/.ssh/work_ssh.pub

Step 2: Create new file name config into your .ssh folder as below:

```
# Work Account
Host github.com-work_git_name
	HostName github.com
	PreferredAuthentications publickey
	User git
	IdentityFile ~/.ssh/work_ssh


# Personal Account
Host github.com-personal_git_name
	HostName github.com
	PreferredAuthentications publickey
	User git
	IdentityFile ~/.ssh/personal_ssh
```

Step Accessing repos:
- Public Repo
  - $ git clone git@github.com-personal_git_name:Avkash/mldl.git

- Work Repo
  - $ git clone git@github.com-work_git_name:WorkGit/repo_name.git

Note: Make sure to match the "Host" value from .ssh/config file while cloning the work vs personal repo. 
  
