#!/bin/bash

echo "🔧 Đang sửa lỗi YUM update cho CentOS 7.9.2009..."

mkdir -p /etc/yum.repos.d/backup/
mv /etc/yum.repos.d/CentOS-* /etc/yum.repos.d/backup/ 2>/dev/null

cat > /etc/yum.repos.d/CentOS-Vault.repo <<EOF
[base]
name=CentOS-7.9.2009 - Base Vault
baseurl=http://vault.centos.org/7.9.2009/os/x86_64/
gpgcheck=1
enabled=1
gpgkey=http://vault.centos.org/7.9.2009/os/x86_64/RPM-GPG-KEY-CentOS-7

[updates]
name=CentOS-7.9.2009 - Updates Vault
baseurl=http://vault.centos.org/7.9.2009/updates/x86_64/
gpgcheck=1
enabled=1
gpgkey=http://vault.centos.org/7.9.2009/os/x86_64/RPM-GPG-KEY-CentOS-7

[extras]
name=CentOS-7.9.2009 - Extras Vault
baseurl=http://vault.centos.org/7.9.2009/extras/x86_64/
gpgcheck=1
enabled=1
gpgkey=http://vault.centos.org/7.9.2009/os/x86_64/RPM-GPG-KEY-CentOS-7
EOF

yum install -y epel-release

yum clean all
yum makecache

echo "✅ Sửa thành công. Bạn có thể chạy lại: yum update"
