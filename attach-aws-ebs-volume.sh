# Step-by-Step Guide to Attaching an EBS Volume via AWS Management Console
: <<'STEP1'
Step 1: Create an EBS Volume
1) Log into the AWS Management Console and navigate to the EC2 dashboard.
2) In the navigation pane, click on Volumes under the "Elastic Block Store" section.
3) Click Create Volume.
4) Specify the volume type (e.g., General Purpose SSD, Provisioned IOPS SSD), size, and Availability Zone. The Availability Zone should be the same as that of the EC2 instance to which you'll attach the volume.
5) Click Create to create your new EBS volume.
STEP1
: <<'STEP2'
Step 2: Attach the EBS Volume to an EC2 Instance
1) Once the volume is created, select it in the Volumes list.
2) Click on the Actions button, then select Attach Volume.
3) In the instance text box, you can type the instance ID or name tag to find your instance.
4) Specify the device name (e.g., /dev/sdf on Linux). AWS may suggest a device name.
5) Click Attach.
STEP2
: <<'STEP3'
Step 3: Connect to Your EC2 Instance
Use SSH to connect to your EC2 instance. For Amazon Linux instances, the default user name is ec2-user. You would typically use a command like:
ssh -i /path/to/your-key.pem ec2-user@instance-public-ip
STEP3
: <<'STEP4'
Step 4: Verify the Volume Attachment
Once logged in, you can use the lsblk command to list the block devices attached to the instance.
This command shows all the block devices and allows you to identify the newly attached volume by its size and the device name you specified.
STEP4
lsblk
: <<'STEP5_1'
Step 5: Format and Mount the Volume
If the volume is new and has no data (check using sudo file -s /dev/xvdf), you'll need to format it. For example, to format with the ext4 file system:
STEP5_1
sudo mkfs.ext4 /dev/xvdf
: <<'STEP5_2'
Create a mount point (e.g., /mnt/myvolume):
STEP5_2
# sudo mkdir /mnt/myvolume # only create the mount point if you're not creating the RAID
: <<'STEP5_3'
Mount the volume:
STEP5_3
: <<'STEP5_4'
To ensure the volume is mounted automatically after a reboot, edit the /etc/fstab file and add the following line:
Make sure to replace /dev/xvdf with your device name if it's different.
# /dev/xvdf /mnt/myvolume ext4 defaults,nofail 0 2 # only mount this volume if you're not creating the RAID
# Following these steps, you'll have successfully attached and configured a new EBS volume on your EC2 instance running Amazon Linux.

