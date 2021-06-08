if [ -z "$1" ]
then
  printf "Required process keyword as argument.\n"
  exit 1
else
  found=true
  firstCheck=true
  manualCommand="ps aux | grep -i $1 | grep -v grep | grep -v -i omnisharp | grep -v -i .sh"
  while [ $found = true ]; do
    pid="$(ps aux | grep -i $1 | grep -v grep | grep -v -i omnisharp | grep -v -i .sh | grep -o -e "[0-9]+" | head -1)"
    if [ -z "$pid" ]
    then
      if [ $firstCheck = true ]
      then
        printf "\nINFO: No pid found. Manually run command:\n$manualCommand\n\n"
        exit 0
      else
        found=false
      fi
    else
      # -9 parameter means you aren't asking politely.
      kill -9 "$pid"
      printf "Process $pid killed.\n"
      firstCheck=false
    fi
  done
  exit 0
fi