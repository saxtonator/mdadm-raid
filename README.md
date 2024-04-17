# mdadm-raid
Creating a RAID 0 array on an Amazon EC2 instance running Amazon Linux 2023 involves several steps. RAID 0 (striping) can improve the performance of your system by spreading data across multiple disks, but keep in mind it does not offer redundancy. If one disk fails, data on all disks in the array is likely lost.
Here's how to create an an EBS Volume and how you configure RAID 0 on your EC2 instance using two or more newly attached EBS volumes.
