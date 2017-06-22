debug=$(config debug)

[[ $debug ]] && set -x 

partition=$(config partition)
volume_group=$(config vg)
logical_volume=$(config lv)
size=$(config size)

vgcreate $volume_group $partition
lvcreate -L $size -n $logical_volume $volume_group
