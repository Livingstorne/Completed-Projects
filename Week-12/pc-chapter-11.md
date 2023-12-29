# Podcast Questions - Chapter 11

Watch this video, *What Is ZFS?: A Brief Primer by Wendell at Level1techs* at [https://www.youtube.com/watch?v=lsFDp-W1Ks0](https://www.youtube.com/watch?v=lsFDp-W1Ks0 "youtube for what is ZFS primer") and answer the following questions.

* ~1:10 Which company was the original developers of the ZFS filesystem?
  * Sun microsystems were the original deveolopers of ZFS filesystem.

* ~1:45-2:15 What was Sun's problem with their advanced technology?
  *Sun carried out research and developed advanced technology but they didn't have the means and resources to commecialize it. 
* ~3:00-3:10 What is ZFS "all about"?
  * ZFS is all about storing files and having maximum data integrity, building it with basically commodity hardware. 

* ~4:45 How is a Mechanical Harddrive described?
  * A mechanical harddrive is a spinning platter of rust that is writting impossibly small 1's and 0's with a physical read write head with a magntic ceramic head on top.

* ~5:30-5:455 What formulaic way does ZFS detect data corruption?
  * ZFS runs the data through some type of computional alogarithm, it gives you a number and depending on the alogarithm, that number is used to detect that somthing has changed. i.e checksuming process

* ~6:40-7:15 What is the comparison of the increase the CPU power to the increase of disk throughput?
  * Disk storage increased from 100GB to 18TB and transfer speed from 100mb/s to 200mb/s. Transfer speed only doubled while the amount of data stored increased exponentially. 

* ~8:00 What did Sun discover was available while waiting for slower disks?
  * Alot of computational power was available while a computer was waiting for a slower disk. 

* ~8:30 What do most filesystems design have in mind?
  * Most file systems are designed having one mecahnical harddrive to work with.

* ~9:01 How is a ZFS designed to operate?
  * ZFS is designed to operate with multiple physical pieces of hardware in way that it exploits that one of them might be faulty. 

* ~11:00 How was the original Google Hardware described?
  * Google hardware was originally descriped as garbage. 

* ~12:11 The filesystem doesn't know how to deal with multiple physical whats?
  * Ans devices

* ~12:30 What is a PCI-e RAID card?
  * A PCI-e RAID card is a computer that's doing some extra calcumllations and computations and storing extra information on the drives that are being written to.

* ~14:50-16:00 What is a RAID 6 configuration and what does it do for you in regards to disk corruption?
  * In a RAID 6 confiuration, you have two sets of extra redundacy information. The file is broken down into chunks and it is spread accross all the drives and if one of the drives is lying, it's possible to use the information on the other three drives to find out which drive has the corrupted data.

* ~17:45 Describe how ZFS is philosophically different from RAID controllers (as mentioned in the previous 2-3 minutes)?
  * ZFS doesn't trust the hard-drives to operate correctly inform of self diagnosing, it mananges the volumes where the data is stored. 

* ~18:28 How is a ZFS volume defined?
  * ZFS volume is the volume where your data is stored accross a bunch of disks.

* ~19:25 What does ZFS store with its mirrored data?
  * ZFS stores extra checksum information with it's mirrored data.

* ~21:57 What are the three attributes of ZFS listed?
  * Filesystem, volume management and device management.

* ~22:16 Where does ZFS work best?
  * ZFS works best when more than one disk is being used to store data.

* ~23:18 How is bit rot defined?
  * Bit rot is file corruption in the storage media.

* ~24:25 How does ZFS compare to Btrfs?
  * ZFS is more well developed than Btrfs. Btrfs is less overhead than ZFS and Btrfs is much faster than ZFS in some instances.Altough, ZFS ensures much more data integrity as compared to Btrfs

* ~28:45 What are the host's list of 4 features that ZFS has?
  * File system management, volume management, device management and data management.

* ~29:48 What is the host's conclusion about the reliability of ZFS?
  * The host's conclusion is that ZFS is reliable because it had so much engineering time due to  developer love put into it as a commercial product, making it hardened and hence it can be trusted with any data.
  