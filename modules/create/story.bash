debug=$(config debug)

[[ $debug ]] && set -x 

partition=$(config partition)
volume_group=$(config vg)
logical_volume=$(config lv)
size=$(config size)

create_opts=' -y'

check_vgs

if [[ $vgs ]]; then
  echo "A volume group $volume_group already created. Moving further."
else
  vgcreate $create_opts $volume_group $partition
fi

check_lvs

if [[ `echo $lvs | grep -w $logical_volume` ]]; then
  echo "A logical volume $logical volume already created. Nothing to do."
else
  lvcreate $create_opts -L $size -n $logical_volume $volume_group
fi
