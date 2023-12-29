# Lab - Chapter 11

## Lab 11 Objectives

* Creating virtual disks in VirtualBox
* Creating new partitions in fdisk
* Creating new filesystems with mkfs
* Creating new filesystems in ZFS and Btrfs
* Mounting new filesystems
* Editing `/etc/fstab` and using systemd .mount files to make our mounts permanent

## Lab 11 Outcomes

At the conclusion of this lab you will have successfully created a new virtual disk in VirtualBox, created new partitions using fdisk, formatted those partitions using mkfs, XFS, and ZFS, and mounted all those partitions manually and automatically using the `/etc/fstab`.

## Lab 11 Activities

1. Create 2 virtual drives in VirtualBox (10 GB each):

!["2 virtual drives"](./Week-12-Images/qn1_ubuntu_created_disks.PNG "created drives")

   a. Use LVM to create 2 Physical Volumes

   !["Two physical volumes"](./Week-12-Images/qn1_ubuntu_pv_create.PNG "pv create")

   !["Pv display"](./Week-12-Images/qn1_ubuntu_pv_display.PNG "pv display")

   b. Create 1 Volume Group

   !["volume group"](./Week-12-Images/qn1_ubuntu_vg_create.PNG "vg create")

   c. Create 3 Logical Volumes of 5 GB each
   !["lv create"](./Week-12-Images/qn1_ubuntu_lv_create.PNG "lv create")

   !["lv display"](./Week-12-Images/qn1_ubuntu_lv_display.PNG "lv display")

   d. Format each LV using ext4

   !["ext4"](./Week-12-Images/qn1_ubuntu_make_fs.PNG "ext4")

2. Using Fedora Linux, create 2 virtual drives in VirtualBox (10 GB each):

!["vitual disks"](./Week-12-Images/qn2_fedora_creating_two_physical_disks.PNG "physical disks")

   a. Use LVM to create 2 Physical Volumes

   !["physical volumes"](./Week-12-Images/qn2_fedora_creating_two_physical_disks_pv_create.PNG "pv create")

   b. Create 1 Volume Group

   !["volume group"](./Week-12-Images/qn2_fedora_creating_volume_group.PNG "vg create")

   c. Create 3 Logical Volumes of 5 GB each

   !["lv create"](./Week-12-Images/qn2_fedora_creating_three_logical_volumes.PNG "lv create")

   d. Format one LV using ext4, xfs, and then btrfs

   !["formating lv's"](./Week-12-Images/qn2_fedora_formating_lvs.PNG "formating lvs")


3. Using the same Fedora Linux from questions two extend the ext4 partition to be 7 GB

Size Before Extending
!["mounting fs"](./Week-12-Images/qn2_fedora_mounting_the_logical_volumes.PNG "mounting lvs")

   a. Use the `lvextend` command to extend the LV 

   !["lv extend"](./Week-12-Images/qn3_fedora_lvextend.PNG "lv extend")

   b. Use the `resize2fs` command to extend the filesystem size

   !["resize2fs"](./Week-12-Images/qn3_fedora_resize2fs.PNG "resize2fs")

4. Using the same Fedora Linux from questions two extend the xfs partition to be 7 GB

   a. Use the `lvextend` command to extend the LV 

   !["lv extend"](./Week-12-Images/qn4_fedora_lv_extend.PNG "lv extend")

   b. Use the `grow_xfs` command to extend the filesystem size

   !["xfs_growfs"](./Week-12-Images/qn4_fedora_xfs_growfs.PNG "xfs_growfs")

5. Using Fedora Linux create 4 additional virtual disks (can be of 5-10 GB)

   a. Using Btrfs create a stripped mirror named `datastorage`

   !["making btrfs"](./Week-12-Images/qn5_making_btrfs.PNG "making btrfs")

   !["datastorage"](./Week-12-Images/qn5_create-datastorage.PNG "data-storage")

   b. Use Btrfs to print out status of Btrfs disks: `btrfs filesystem show`

   !["btrfs filesystem show"](./Week-12-Images/qn5_btrfs-filesystem-show.PNG "btrfs filesystem show")

   c. use the command: `btrfs filesystem df` to show filesystem use compare the results to `df -H`

   !["btrfs filesystem df"](./Week-12-Images/qn5_btrfs-filesystem-df.PNG "btrfs filesystem df")

   !["df -H"](./Week-12-Images/qn5_df-H-_mnt_datastorage.PNG "de -h ")

6. Create a `.mount` file to mount the Btrfs disk created in previous question

!["creating mount file"](./Week-12-Images/qn6_creating-mount-file.PNG "mount file")

   a. Run the `df -H` before creating the `.mount` file and after reboot to show the disk has been mounted

   Before reboot

   !["df -H before"](./Week-12-Images/qn6_df-H-before.PNG "df -H before")

   After reboot

   ![df -H after](./Week-12-Images/qn6_df-H-after-reboot.PNG "df -H after")

   b. You will need the UUID from the `lsblk -fs` command

   !["lsblk -fs"](./Week-12-Images/qn6_b_getting_uuid.PNG "getting uuid")

   b. Remember like systemd, you will have to enable and start the `.mount` file

   !["enable and start .mount"](./Week-12-Images/qn6_b_starting_moutfile.PNG "starting mount file")

   c. Change ownership of the mount directory to your user

   !["changing ownership"](./Week-12-Images/qn6_c_changing_ownership.PNG "changing ownership")

   d. Write a file named `helloworld.txt` to the newly mounted directory

   !["writing helloworld.txt"](./Week-12-Images/qn6_d_creating_helloworld.txt "wrriting helloworld.txt")

7. Using Ubuntu Server, enable an additional host-only network interface and SSH from your Host OS into this system
!["ssh"](./Week-12-Images/qn9_a_ssh_into_server.PNG "ssh")

   a. Create 3 virtual disks to attach to the virtual machine in VirtualBox

   !["3 disks"](./Week-12-Images/qn7_a_attaching_disks.PNG "attaching disks")

   b. Install the `zfsutils-linux` package for the zfs tools

   !["installing zfsutils-linux"](./Week-12-Images/qn7_b.PNG "installing zfs-utils")

   c. Create a 3 disk zfs stripe named: `datadisk`

   !["datadisk"](./Week-12-Images/qn7_c_datadisk.PNG "datadisk")

   d. Change ownership of the mountpoint to your user

   !["changing ownership"](./Week-12-Images/qn8_d_changing_mount_point_ownership.PNG "changing ownership")

   e. Write a file named: `helloworld.txt` to the new mountpoint

   !["helloworld.txt"](./Week-12-Images/qn7_e_creating_helloworld.txt "helloworld.txt")

8. Using Ubuntu Server, SSH from your Host OS into this system

!["ssh"](./Week-12-Images/qn9_a_ssh_into_server.PNG "ssh")

   b. Attach 4 additional virtual disks to the virtual machine in VirtualBox

   !["4 virtual disks"](./Week-12-Images/qn8_attaching_disks.PNG "attaching disks")

   c. Create a 4 disk RaidZ named: `customers`

   !["customers"](./Week-12-Images/qn8_c_creating_customers.PNG "customers")

   d. Change ownership of the mountpoint to your user

   !["ownership"](./Week-12-Images/qn8_d_changing_mount_point_ownership.PNG "mountpoint ownership")

   e. Write a file named: `helloworld.txt` to the new mountpoint

   !["helloworld.txt"](./Week-12-Images/qn8_e_creating_hello_world.txt "creating helloworld.txt")

   f. Display the `zpool status` and take a screenshot of the output

   !["zpool status"](./Week-12-Images/qn8_f_zpool_status_output.PNG "zpool status")
 
9. Using Ubuntu Server, SSH from your Host OS into this system

!["ssh"](./Week-12-Images/qn9_a_ssh_into_server.PNG "ssh")

   b. Inside of zfspool named `customers`, create 2 `datasets` named: `customers/joseph` and `customers/evelyn`

   !["creating joseph and evelyn"](./Week-12-Images/qn9_b_creating_datasets.PNG "creating datasets")

   c. List the `datasets`

   !["list datasets"](./Week-12-Images/qn9_c_list_datasets.PNG "list datsets")

   d. Issue the command: `truncate -s 500m accounts.csv` to create a 500 mb file named accounts.csv in each dataset

   !["truncate"](./Week-12-Images/qn9_d_trancate.PNG "truncate")

   e. Create a ZFS snapshot of the volume named `customers/joseph` naming it: `customer-snap1`

   !["snapshot"](./Week-12-Images/qn9_e_creating_snapshot.PNG "creating snapshot")

   f. Using the `truncate` command create two more files: `ubuntu-distros.csv` and `fedora-distros.csv` of 100 mb on the `customers/joseph` volume

   !["two more files"](./Week-12-Images/qn9_f_trancate.PNG "ubuntu and fedora trancate")

   g. Issue the `ls -lh` command on the `customers/joseph` volume to show that the new files have been created

   !["ls -h"](./Week-12-Images/qn9_g_ls-h.PNG "ls -h")

   h. Using the `zfs list` command list the current snapshots

   ![zfs list](./Week-12-Images/qn9_h_zfs_list.PNG "zfs list")

   i. Using the `zfs rollback` command the `customer-snap1` snapshot

   !["zfs rollback"](./Week-12-Images/qn9_i_rollback.PNG "zfs rollback")

   j. Issue the `ls -lh` command on the `customers/joseph` volume to show that the snapshot has been rolled back

   !["ls -lh"](./Week-12-Images/qn9_j_rollback.PNG "ls -lh")

10. Using Ubuntu Server, SSH from your Host OS

!["ssh"](./Week-12-Images/qn9_a_ssh_into_server.PNG "ssh")

   a. Execute a `zpool status customers/evelyn` command

   !["zpool"](./Week-12-Images/qn10_a_zpool_status.PNG "zpool")

   b. Enable LZ4 compression on the zpool datapool

   !["LZ4 compression"](./Week-12-Images/qn10_b_enabling_compression.PNG "enabling compression")

   c. Execute a `zfs get all | grep compression` command to display that compression is enabled

   !["grep"](./Week-12-Images/qn10_c_grep_compression.PNG "grep")

11. Execute any of the commands listed in the text to print out the disk serial numbers

!["disk serial number"](./Week-12-Images/qn11_list_disk_serial_numbers.PNG "disk serial number")

12. Attach an additional 2 GB virtual disk and format it with Btrfs and we will mount is in read-only mode. Using the command `lsblk --fs /dev/sdX` determine the UUID of the newest virtual disk you just created. Add an entry for this disk to the `/etc/fstab` file with the following values:

!["btrfs"](./Week-12-Images/qn12_formating_with_btrfs.PNG "formating with btrfs")

   a. file system is UUID=

   !["uuid"](./Week-12-Images/qn12_determining_uuid.PNG "determining uuid")

   b. mount point is `/mnt/disk100` (create this partition if it doesn't exist)

   !["disk100"](./Week-12-Images/qn12_b.PNG "disk100")

   c. type is btrfs

   d. options: defaults,ro  (ro for read-only)

   e. dump and pass fields can be 0

   !["file"](./Week-12-Images/qn12_etc-tstab.PNG "etc-fstab")

   f. Change owner and group to your username for `/mnt/disk100` (using `chmod`)

   !["change ownership"](./Week-12-Images/qn12_b.PNG "change ownsership")

   g. Reboot your system. Change directory to `/mnt/disk100` and take a screenshot to demonstrate that the disk is in read-only mode by trying to create a file via this command:  `touch demo.txt`

   !["create demo.txt"](./Week-12-Images/qn12_g_readonly_screenshot.PNG "readonly screenshot")

13. Using `wget`, retrieve this URL: https://mirrors.edge.kernel.org/pub/linux/kernel/v5.x/linux-5.11.19.tar.xz

   a. Untar/uncompress this archive.

   !["untar"](./Week-12-Images/qn13_a.PNG "untar")

   b. Tar the directory and compress it using bzip2, make sure to keep the original input

   !["bzip2"](./Week-12-Images/qn13_b.PNG "bzip2")

   c. Tar the directory and compress it using gzip, make sure to keep the original input

   !["gzip"](./Week-12-Images/qn13_c.PNG "gzip")

   d. Tar the directory and compress it using ztd, make sure to keep the original input

   !["ztd"](./Week-12-Images/qn13_d.PNG "ztd")

   e. Tar the directory and compress it using xz, make sure to keep the original input
   
   !["xz"](./Week-12-Images/qn13_e.PNG "xz")