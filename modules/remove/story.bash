debug=$(config debug)

[[ $debug ]] && set -x 

volume_group=$(config vg)
logical_volume=$(config lv)
use_force=$(config force)

if [[ $use_force == yes ]]; then
  remove_opts+=" -f"
fi

lvremove $remove_opts $volume_group/$logical_volume 
vgremove $remove_opts $volume_group 
