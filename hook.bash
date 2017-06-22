action=$(config action)

if [[ $action == create ]]; then
  run_story create
elif [[ $action == remove ]];then
  run_story remove
fi
