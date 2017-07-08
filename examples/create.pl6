set_spl %( 'dev-lvm' => 'https://github.com/Spigell/lvm.git' );
task-run "create test lv", "dev-lvm", %(
  action  => 'create',
  partition => "/dev/sdb1",
  vg      => 'vg_test',
  lv      => 'lv_test',
  size    => '1GB',
);
