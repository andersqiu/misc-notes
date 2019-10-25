# Introduction
Add media repo from DVD iso

## How to add repo
* Insert the DVD iso file
* Run command
```
# mkdir -pv /mnt/iso
# mount -o loop /opt/os/CentOS-8-x86_64-1905-dvd1.iso /mnt/iso
# cp -v /mnt/iso/media.repo /etc/yum.repos.d/centos8.repo
# cat /etc/yum.repos.d/centos8.repo
[InstallMedia]
name=CentOS Linux 8
mediaid=None
metadata_expire=-1
gpgcheck=0
cost=500
# vi /etc/yum.repos.d/centos8.repo
[InstallMedia-BaseOS]
name=CentOS 8 - BaseOS
metadata_expire=-1
gpgcheck=1
enabled=1
baseurl=file:///mnt/iso/BaseOS/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial

[InstallMedia-AppStream]
name=CentOS 8 - AppStream
metadata_expire=-1
gpgcheck=1
enabled=1
baseurl=file:///mnt/iso/AppStream/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial
# dnf config-manager --disable "AppStream"
# dnf config-manager --disable "BaseOS"
# dnf config-manager --disable "extras"
# dnf clean all
```

* Check the added repo
```
$ sudo dnf repolist
Last metadata expiration check: 0:01:01 ago on Tue 22 Oct 2019 03:52:20 PM CST.
repo id                               repo name                           status
InstallMedia-AppStream                CentOS 8 - AppStream                4,681
InstallMedia-BaseOS                   CentOS 8 - BaseOS                   1,655
```

* Mount the iso automatically after reboot
```
$ su -
# vi /etc/fstab
```

Append this line to the file **/etc/fstab**
```
/opt/os/CentOS-8-x86_64-1905-dvd1.iso	/mnt/iso	iso9660 loop    0 0 
```

And then run this command to mount iso this time:
```
# mount -a
```

