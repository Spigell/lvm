check_lvs () {
  lvs=$(lvs $volume_group | awk '{print $1}') 2>&1>/dev/null
}
check_vgs () {
  vgs=$(vgs $volume_group ) 2>&1>/dev/null
}
