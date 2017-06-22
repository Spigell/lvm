# SYNOPSIS

Outthentic plugin.

Manage your logical volume and volume group via sparrow/sparrowdo.

# INSTALL

    $ sparrow plg install lvm

# USAGE

## manually

    $ sparrow plg run lvm --param partition=/dev/sda1 --param size=7G

## via Sparrowdo

    $ cat sparrowfile

    task-run "create main lv", "lvm", %(
      action    => 'create',
      partition => '/dev/sda1',
      vg        => 'vg_main',
      lv        => 'slashroot',
      size      => '7GB'
    );
 
    task-run "remove main lv", "lvm", %(
      action  => 'remove',
      vg      => 'vg_main',
      lv      => 'slashroot',
      force   => 'yes'
    );

# Parameters

## action

one of two: (create|remove). Default is `create`.

## partition

Your partiton on disk.

## vg

Your desired vg.

## lv

Your desired lv.

## size

Size of lvm. Only in `create` action.

## force

flag for forced operation. Only in `remove` action.
