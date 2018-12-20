###############################################################################
#                              Settings
###############################################################################

# Shows time and date for history command
export HISTTIMEFORMAT="%d/%m/%y %T "

###############################################################################
#                              Common aliases
###############################################################################

alias srbr='source ~/.bashrc'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Command to find linux version
alias lnxver='lsb_release -a'

###############################################################################
#                              Utility functions
###############################################################################

# Function to delete files recursively which has a wildcard pattern
# $1 = path, $2 = Wildcard, for example \*.o. note: * has to be escaped
function delrec()
{
  find $1 -type f -name "$2" -delete
}

# Function to replace words recursively
# $1 = path, $2 = string to be replaced, $3 = replacing string
function reprec()
{
  find $1 -type f -exec sed -i "s/$2/$3/g" {} \;
}

function s256() #for linux
{
  read -s P
  echo -n $P | sha256sum | tr -d '\n -' | xclip -selection clipboard
  history -c
  exit
}

###############################################################################
#                              git related
###############################################################################

# Function to add email to git
function git_email_conf()
{
  if [ -z "$1" ]
  then
    echo "email id is empty, please enter a valid email ID"
    return
  fi
  git config --global user.email "$1"
}
