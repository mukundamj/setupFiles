function s256()
{
  read -s P
  echo -n $P | shasum -a 256 | tr -d ' -\n' | pbcopy
  history -c
  exit
}
