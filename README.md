# Docker docs

## installing docker in centos 7.x

### 
1.  check kernel name and version 

```
[centos@ip-172-31-36-148 ~]$ uname 
Linux
[centos@ip-172-31-36-148 ~]$ uname  -r
3.10.0-862.14.4.el7.x86_64
```

### Note:  we need to have 3.10 kernel atleast in case of linux 
### : we need root access to install docker

## link for centos 7
==
https://docs.docker.com/engine/install/centos/
-==

### installation steps:

1. [root@ip-172-31-36-148 ~]# sudo yum install -y yum-utils
2. sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
    
3. sudo yum install docker-ce docker-ce-cli containerd.io -y

## shor steps to install docker
---
```
  8  sudo yum install -y yum-utils
    9  sudo yum-config-manager     --add-repo     https://download.docker.com/linux/centos/docker-ce.repo
   10  sudo yum install docker-ce docker-ce-cli containerd.io
```

## starting docker engine 

```
[root@ip-172-31-36-148 ~]# systemctl start  docker 
[root@ip-172-31-36-148 ~]# systemctl enable  docker 
Created symlink from /etc/systemd/system/multi-user.target.wants/docker.service to /usr/lib/systemd/system/docker.service.

```

### adding non root users into docker group

```
[root@ip-172-31-36-148 ~]# usermod  -a  -G docker  centos

```

### adding all the users into docker group
```
[root@ip-172-31-36-148 ~]# for  i  in  `ls /home`
> do
> usermod -aG docker  $i
> done

```

## Logout and login then check again
```
[centos@ip-172-31-36-148 ~]$ docker  version 
Client: Docker Engine - Community
 Version:           19.03.12
 API version:       1.40
 Go version:        go1.13.10
 Git commit:        48a66213fe
 Built:             Mon Jun 22 15:46:54 2020
 OS/Arch:           linux/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          19.03.12
  API version:      1.40 (minimum version 1.12)
  Go version:       go1.13.10
  Git commit:       48a66213fe
  Built:            Mon Jun 22 15:45:28 2020
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.2.13
  GitCommit:        7ad184331fa3e55e52b890ea95e65ba581ae3429
 runc:
  Version:          1.0.0-rc10
  GitCommit:        dc9208a3303feef5b3839f4323d9beb36df0a9dd
 docker-init:
  Version:          0.18.0
  GitCommit:        fec3683

```


# docker images :

## Docker Hub 

--- https://hub.docker.com/

## Quay by redhat 

0---- https://quay.io/
## fedora registry 

--- https://registry.fedoraproject.org/

### docker image search

```
[centos@ip-172-31-36-148 ~]$ docker  search  mysql 
NAME                              DESCRIPTION                                     STARS               OFFICIAL            AUTOMATED
mysql                             MySQL is a widely used, open-source relation…   9822                [OK]                
mariadb                           MariaDB is a community-developed fork of MyS…   3585                [OK]                
mysql/mysql-server                Optimized MySQL Server Docker images. Create…   719                                     [OK]
percona                           Percona Server is a fork of the MySQL relati…   499                 [OK]                
centos/mysql-57-centos7           MySQL 5.7 SQL database server                   80                                      

```

===
```
  19  docker  search  oracle
   20  docker  search  java
   21  docker  search  mysql 
   22  history 
   23  docker  search  dockerashu
   24  docker  search  ashutoshh

```

## Docker basic command related to images

```
 23  docker  search  dockerashu
   24  docker  search  ashutoshh
   25  history 
   26  docker  pull  java
   27  docker  images
   28  docker  pull  mysql
   29  docker  images
   30  docker  pull  centos 
   31  docker  images
   32  docker  pull  oraclelinux
   33  docker pull oraclelinux
   34  docker pull oraclelinux:8.2
   35  docker  images
   36  docker pull  alpine  
   37  docker  images
   38  docker pull  busybox 
   39  docker  images

```

### docker internal info
```
[centos@ip-172-31-36-148 ~]$ docker  info 
Client:
 Debug Mode: false

Server:
 Containers: 1
  Running: 0
  Paused: 0
  Stopped: 1
 Images: 7
 Server Version: 19.03.12
 Storage Driver: devicemapper
  Pool Name: docker-253:0-25195331-pool
  Pool Blocksize: 65.54kB
  Base Device Size: 10.74GB
  Backing Filesystem: xfs
  Udev Sync Supported: true
  Data file: /dev/loop0
  Metadata file: /dev/loop1
  Data loop file: /var/lib/docker/devicemapper/devicemapper/data
  Metadata loop file: /var/lib/docker/devicemapper/devicemapper/metadata
  Data Space Used: 2.637GB
  Data Space Total: 107.4GB
  Data Space Available: 2.68GB
  Metadata Space Used: 3.023MB
  Metadata Space Total: 2.147GB
  Metadata Space Available: 2.144GB
  Thin Pool Minimum Free Space: 10.74GB
  Deferred Removal Enabled: true
  Deferred Deletion Enabled: true
  Deferred Deleted Device Count: 0
  Library Version: 1.02.146-RHEL7 (2018-01-22)
 Logging Driver: json-file
 Cgroup Driver: cgroupfs
 Plugins:
  Volume: local
  Network: bridge host ipvlan macvlan null overlay
  Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
 Swarm: inactive
 Runtimes: runc
 Default Runtime: runc
 Init Binary: docker-init
 containerd version: 7ad184331fa3e55e52b890ea95e65ba581ae3429
 runc version: dc9208a3303feef5b3839f4323d9beb36df0a9dd
 init version: fec3683
 Security Options:
  seccomp
   Profile: default
 Kernel Version: 3.10.0-862.14.4.el7.x86_64
 Operating System: CentOS Linux 7 (Core)
 OSType: linux
 Architecture: x86_64
 CPUs: 2
 Total Memory: 3.7GiB
 Name: ip-172-31-36-148.ec2.internal
 ID: FN2W:3MNR:Q56T:7P65:BYPL:O5EO:KFC5:T3BV:AA6B:VXXF:PEKY:RS4V
 Docker Root Dir: /var/lib/docker

```

# containers operations 

## creating and view containers 

```
 docker  run   alpine   cal 
 
 docker  run  --name  ashuc1      -d      alpine ping  8.8.8.8
 
 ```
 
 ### view
 
 ```
 docker ps
 docker. ps. -a
 
 ```
 ## checking output of parent process in container
 
 ```
    62  docker  logs  ashuc1 
   63  docker  logs  -f  ashuc1 
  
  ```
  
  ### stopping a container
  ```
  [centos@ip-172-31-36-148 ~]$ docker  stop   ashuc1 
  
  ```
  
  ### start a container 
  
  ```
   docker  start  ashuc1
   ```
   
   ### forcefully stop a container
   
   ```
   [centos@ip-172-31-36-148 ~]$ docker  kill  ashuc1  
   
   ```
   
   ### kill all the running containers 
   
   ```
   [centos@ip-172-31-36-148 ~]$ docker kill $(docker  ps  -q)
743af6038035
f41e09cb9bb3
04a2e8797311
85a17aba17c7
b02d129bca24

```

### starting all the stopped / killed containers

```
[centos@ip-172-31-36-148 ~]$ docker start  $(docker  ps  -qa)

```

## docker child process 

```
[centos@ip-172-31-36-148 ~]$ docker  exec  ashuc1   cal
    August 2020
Su Mo Tu We Th Fr Sa
                   1
 2  3  4  5  6  7  8
 9 10 11 12 13 14 15
16 17 18 19 20 21 22
23 24 25 26 27 28 29
30 31
[centos@ip-172-31-36-148 ~]$ docker  exec  ashuc1   ping  fb.com 
PING fb.com (31.13.66.35): 56 data bytes
64 bytes from 31.13.66.35: seq=0 ttl=51 time=1.090 ms
64 bytes from 31.13.66.35: seq=1 ttl=51 time=1.164 ms
64 bytes from 31.13.66.35: seq=2 ttl=51 time=1.147 ms
64 bytes from 31.13.66.35: seq=3 ttl=51 time=1.157 ms
^C
[centos@ip-172-31-36-148 ~]$ docker  exec -d   ashuc1   ping  fb.com 
[centos@ip-172-31-36-148 ~]$ docker  top  ashuc1
UID                 PID                 PPID                C                   STIME               TTY                 TIME                CMD
root                16278               16260               0                   05:14               ?                   00:00:00            ping 8.8.8.8
root                17616               16260               0                   05:18               ?                   00:00:00            ping fb.com
root                17760               16260               0                   05:18               ?                   00:00:00            ping fb.com
[centos@ip-172-31-36-148 ~]$ 


```

## accessing container shell 

```
[centos@ip-172-31-36-148 ~]$ docker  exec -it  ashuc1   sh 
/ # 
/ # uname 
Linux
/ # uname -r
3.10.0-862.14.4.el7.x86_64
/ # cat  /etc/os-release 
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.12.0
PRETTY_NAME="Alpine Linux v3.12"
HOME_URL="https://alpinelinux.org/"
BUG_REPORT_URL="https://bugs.alpinelinux.org/"
/ # ps  -e
PID   USER     TIME  COMMAND
    1 root      0:00 ping 8.8.8.8
   12 root      0:00 ping fb.com
   17 root      0:00 ping fb.com
   27 root      0:00 sh
   35 root      0:00 ps -e
/ # 

```
