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

" Shows time and date for history command
export HISTTIMEFORMAT="%d/%m/%y %T "

" Command to find linux version
alias lnxver='lsb_release -a'


