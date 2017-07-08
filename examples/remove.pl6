set_spl %( 'dev-lvm' => 'https://github.com/Spigell/lvm.git' );
task-run "remove main lv", "dev-lvm", %(
  action  => 'remove',
  vg      => 'vg_test',
  lv      => 'lv_test',
  force   => 'yes',
);
