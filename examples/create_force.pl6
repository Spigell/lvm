set_spl %( 'dev-lvm' => 'https://github.com/Spigell/lvm.git' );


#bash 'umount /mnt2 ; mkfs.ext4 /dev/mapper/vg_test-lv_test ; mount /dev/mapper/vg_test-lv_test /mnt';

task-run "create test lv", "dev-lvm", %(
  action  => 'create',
  recreate  => 'true',
  partition => "/dev/sdb1",
  vg        => 'vg_test',
  lv        => 'lv_test',
  size      => '2GB',
);
