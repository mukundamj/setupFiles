function s256() #for macos
{
  read -s P
  echo -n $P | shasum -a 256 | tr -d ' -\n' | pbcopy
  history -c
  exit
}

function s256() #for linux
{
  read -s P
  echo -n $P | sha256sum | tr -d '\n -' | xclip -selection clipboard
  history -c
  exit
}

# Shows time and date for history command
export HISTTIMEFORMAT="%d/%m/%y %T "

# Command to find linux version
alias lnxver='lsb_release -a'

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
