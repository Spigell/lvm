debug=$(config debug)

[[ $debug ]] && set -x 

volume_group=$(config vg)
logical_volume=$(config lv)
use_force=$(story_var force)

remove_opts+="-y "

if [[ $use_force == true ]]; then
  remove_opts+="-f "
  umount "/dev/mapper/$volume_group-$logical_volume" 2>/dev/null
fi

check_lvs

if [[ `echo $lvs | grep -w $logical_volume` ]]; then
  lvremove $remove_opts $volume_group/$logical_volume 
fi

check_lvs

if [[ ! $lvs ]] ; then
  echo "No logical volume left. Try to remove a volume group."
  vgremove $remove_opts $volume_group 
fi
