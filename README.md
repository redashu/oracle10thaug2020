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

# Dockerfile to creating custom docker images

## python code + Dockerfile

### python code

```
[centos@ip-172-31-36-148 pyapp]$ cat  ashu.py 
import time
import  subprocess

while 4 > 2 :
	print("Hello world i am docker with version ",subprocess.getoutput('docker version'))
	time.sleep(2)
	print("this is sample python code just to test docker & containers")
	print("___@@@@@@@@@@@@@@@@@@@@@@@@@@@_____________________________")
	b=subprocess.getoutput('docker  ps')
	print("all running containers list ",b)
    
  ```
  
  ### Dockerfile 
  
  ```
  [centos@ip-172-31-36-148 pyapp]$ cat  Dockerfile 
FROM  python 
#  we are refering  default  python image from docker hUB 
#  FROM will pull the image if it is not present in Docker engine 
MAINTAINER   ashutoshh@linux.com  
#  optional keyword but image designer can share its info 
RUN  mkdir  /pycode
# it will create this directory in newly created docker image 
COPY ashu.py  /pycode/ashu.py 
# copy will take input from host system and paste file in docker image
#  copy can only take input from current location where dockerfile is present 
CMD   python  /pycode/ashu.py 
#  use of CMD is to assume  this as default parent process if not given by user during container creation time 

```

### building docker image
```
[centos@ip-172-31-36-148 pyapp]$ ls
Dockerfile  ashu.py
[centos@ip-172-31-36-148 pyapp]$ docker  build  -t   python:ashuaug10v001   .
Sending build context to Docker daemon  3.584kB
Step 1/5 : FROM  python
latest: Pulling from library/python
d6ff36c9ec48: Pull complete 
c958d65b3090: Pull complete 
edaf0a6b092f: Pull complete 
80931cf68816: Pull complete 
bc1b8aca3825: Pull complete 
edfe96a4dd20: Pull complete 
4e7c0e94bdeb: Pull complete 
8dffdfc294e3: Pull complete 
25f1468e00b7: Pull complete 
Digest: sha256:b04db6093bb158affaa89ac5af1281e748092433442e8ae0096ba8fbe37f00cc
Status: Downloaded newer image for python:latest
 ---> 6feb119dd186
Step 2/5 : MAINTAINER   ashutoshh@linux.com
 ---> Running in 75a0d1f8cda4
Removing intermediate container 75a0d1f8cda4
 ---> 68b4433cb7f0
Step 3/5 : RUN  mkdir  /pycode
 ---> Running in 92353438b857
Removing intermediate container 92353438b857
 ---> b698fee934be
Step 4/5 : COPY ashu.py  /pycode/ashu.py
 ---> 813abffce93f
Step 5/5 : CMD   python  /pycode/ashu.py
 ---> Running in 2891b1344c21
Removing intermediate container 2891b1344c21
 ---> bf41cefd5473
Successfully built bf41cefd5473
Successfully tagged python:ashuaug10v001

```

### running container 
```
[centos@ip-172-31-36-148 pyapp]$ docker  run  -it  -d  --name  ashuc5  python:ashuaug10v001 
```
### resource consumption by containers

```
  176  docker  stats  ashuc5 
  177  docker  stats  

```

# Cgroups 

## memory limits

```
[centos@ip-172-31-36-148 pyapp]$ docker  run  -it  -d  --name  ashuc5    --memory 100m     python:ashuaug10v001
```

### updating RAM 
```
 195  docker  update   ashuc5  --memory 200m 
 ```
 
## cpu limits

### single core cpu 

```
docker  run  -d --name ashux1  --cpus=1  alpine  ping fb.com

```

### cpu and ram 
```
docker  run  -d --name ashux2  --cpus=1 --memory 200m  alpine  ping fb.com 
```
### swap and Ram update
```
  214  docker update  ashux1  --memory-swap  128m  --memory 500m  # not work 
  215  docker update  ashux1  --memory-swap  600m  --memory 500m 
  
  ```
  
  ### cpu core percentage 
  
  ```
  [centos@ip-172-31-36-148 ~]$ docker run -d --name x222  --cpu-shares=30  alpine  ping fb.com
  221  docker  update  ashux1  --cpu-shares=50  
  
  ```
  
  
  # Dockerfile with java code 
  
  ```
  [centos@ip-172-31-36-148 javaapp]$ cat  ashu.java 
class myclass { 
    public static void main(String args[]) 
    { 
        // test expression 
        while (true) { 
            System.out.println("Hello World"); 
  
            // update expression 
        } 
    } 
} 
[centos@ip-172-31-36-148 javaapp]$ cat  Dockerfile 
FROM  java
MAINTAINER  ashutoshh@linux.com
RUN mkdir  /javacode
WORKDIR  /javacode
#  to change directory during image build time 
#  in short it is very similar to cd command in linux 
COPY  ashu.java  .
RUN  javac  ashu.java
# comipling code
CMD  java myclass

```


 # Day1 revision 
 
 ## Docker desktop for mac 
 
 ---
 https://hub.docker.com/editions/community/docker-ce-desktop-mac
 
 ## Docker desktop for windows 10 
 
 ----
 https://hub.docker.com/editions/community/docker-ce-desktop-windows/
 
 # Day2 
 
 ## Dockerfile with httpd 
 ```
 [centos@ip-172-31-36-148 samplehtml]$ cat  Dockerfile 
FROM  centos
MAINTAINER  ashutoshh@linux.com 
# an optional part 
RUN yum  install  httpd  -y 
WORKDIR  /var/www/html/
#  changing  directory to documentroot of httpd web server 
COPY app1  . 
# we are copying all the data of app1 folder to /var/www/html/
EXPOSE 80 
# to let docker engine know about default port of webapp 
CMD  /usr/sbin/httpd -DFOREGROUND

====
 docker build  -t  httpd:ashuaug112020 . 
 
```

### launching container 
```
docker run  -d  --name ashuwebc1  -p  1122:80    httpd:ashuaug102020 

```

## Dockerfile with entrypoint as parent process
```
[centos@ip-172-31-36-148 samplehtml]$ cat  Dockerfile 
FROM  centos
MAINTAINER  ashutoshh@linux.com 
# an optional part 
RUN yum  install  httpd  -y 
WORKDIR  /var/www/html/
#  changing  directory to documentroot of httpd web server 
COPY app1  . 
# we are copying all the data of app1 folder to /var/www/html/
EXPOSE 80 
# to let docker engine know about default port of webapp 
#CMD /usr/sbin/httpd -DFOREGROUND
ENTRYPOINT  /usr/sbin/httpd -DFOREGROUND
#  both are  default parent process but entrypoint can't be replaced as last argument of parent process
[centos@ip-172-31-36-148 samplehtml]$ docker  build  -t  httpd:ashuaug102020v2  . 

```

## entrypoint. vs  cmd
```
[centos@ip-172-31-36-148 cmdvsentrypoint]$ cat  dockerfile
from alpine
maintainer  ashutoshh
entrypoint ["ping"]
cmd ["fb.com"]


----
390  docker  build -t  ashu:testv1  . 
  391* docker  run  -it --rm  ashu:testv2  
  392  cat  dockerfile 
  393  docker  run  -it --rm  ashu:testv1  cal 
  394  vim dockerfile 
  395  docker  build -t  ashu:testv2  . 
  396  docker  run  -it --rm  ashu:testv2  
  397  docker  run  -it --rm  ashu:testv2  cal 
  398  ls
  399  cat  dockerfile 
  400  history 
  401  ls
  402  cat  dockerfile 
  403  docker  run  -it --rm  ashu:testv2  cal 
  404  docker  run  -it --rm  --entrypoint cal   ashu:testv2  
  405  ls
  406  vim  dockerfile 
  407  docker  build -t  ashu:testv3  . 
  408  docker  run -it --rm  ashu:testv3  
  409  cat  dockerfile 
  410  docker  run -it --rm  ashu:testv3  google.com 
  411  docker  run -it --rm  ashu:testv3  8.8.8.8


```

## dockerfile with arg

```
[centos@ip-172-31-36-148 dynimc]$ cat ashu.txt 
FROM  centos
ARG  software=httpd
#  is a way to define varibale in dockerfile 
#  that can web replaced during build time  without changing dockerfile original content 
#  software variable will not be present in newly created docker image 
RUN  yum  install  $software  -y 

====
[centos@ip-172-31-36-148 dynimc]$ docker build  -t  ashu:dynamicv1 -f  ashu.txt   . 

```

## replacing arg value
```
[centos@ip-172-31-36-148 dynimc]$ docker build --build-arg software=ftp  -t  ashu:ftpv1 -f  ashu.txt   .
```

## dockerfile build with no previous cache 
```
docker build --build-arg software=ftp  -t  ashu:ftpv1 -f  ashu.txt --no-cache   .
```

### to check environment variable in docker image
```
[centos@ip-172-31-36-148 dynimc]$ docker  run  -it --rm   ashu:ftpv1 env  
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=8dce13975b34
TERM=xterm
HOME=/root

```

## using persistent env var in dockerfile using ENV keyword

```
[centos@ip-172-31-36-148 dynimc]$ cat  ashu.txt 
FROM  centos
ENV  software=httpd
#  is a way to define varibale in dockerfile 
#  that can web replaced during build time  without changing dockerfile original content 
#  software variable will not be present in newly created docker image 
RUN  yum  install  $software  -y 

===
[centos@ip-172-31-36-148 dynimc]$ docker  run  -it --rm   ashu:ftpv1 env  
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=620bac46edc5
TERM=xterm
software=httpd
HOME=/root

```


## using ENV & ARG 

```
[centos@ip-172-31-36-148 dynimc]$ cat  ashu.txt 
FROM  centos
ARG  s=httpd
ENV  software=$s
#  is a way to define varibale in dockerfile 
#  that can web replaced during build time  without changing dockerfile original content 
#  software variable will not be present in newly created docker image 
RUN  yum  install  $software  -y 

---
[centos@ip-172-31-36-148 dynimc]$ docker build --build-arg s=ftp  -t  ashu:ftpv1 -f  ashu.txt --no-cache   . 
[centos@ip-172-31-36-148 dynimc]$ docker  run  -it --rm   ashu:ftpv1 env  
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
HOSTNAME=048598b3ccb4
TERM=xterm
software=ftp
HOME=/root

```

## Multi app Dockerfile 

### Dockerfile
```
[centos@ip-172-31-36-148 multiapp]$ cat Dockerfile 
FROM centos
MAINTAINER  ashutoshh@linux.com
ARG  webserver=httpd
ENV  web=app1 
RUN yum  install  $webserver  -y
RUN  mkdir  /data  /data/app1   /data/app2 /data/app3 
COPY webapp1  /data/app1/
COPY webapp2  /data/app2/
COPY webapp3  /data/app3/
WORKDIR  /data
COPY  deploywebapp.sh   . 
RUN  chmod +x  deploywebapp.sh 
EXPOSE 80
ENTRYPOINT  ["./deploywebapp.sh"]
```

### script 
```
[centos@ip-172-31-36-148 multiapp]$ cat deploywebapp.sh 
#!/bin/bash 

if  [  "$app" ==  "web1"    ]
then
	cp  -rvf  /data/app1/*    /var/www/html/
	httpd -DFOREGROUND 

elif  [  "$app" == "web2"    ]
then
	cp  -rvf  /data/app2/*   /var/www/html/
	httpd -DFOREGROUND

elif  [  "$app" == "web3"    ]
then
	cp  -rvf  /data/app3/*   /var/www/html/
	httpd -DFOREGROUND



else  
	echo  "Wrong value supplied "   >/var/www/html/index.html
	httpd -DFOREGROUND 

fi 

```

### running dockerfile 
```
[centos@ip-172-31-36-148 oracle10thaug2020]$ docker  build  -t  ashumultiapp:11082020  . 

```
### launching containers 

#### container 1 
```
[centos@ip-172-31-36-148 oracle10thaug2020]$ docker run --name ashuc1  -p 1001:80  -d   ashumultiapp:11082020  
bf87dff6ba7598fe7ce34ffb9d2770087da55955906a6f2cd89476df31d29f1c

```

### container 2 & 3

```
[centos@ip-172-31-36-148 oracle10thaug2020]$ docker run --name ashuc2  -p 9111:80  -d   -e app=web2   ashumultiapp:11082020  
a6ea267e5aa982344e625367674df23ceb08b37d1abac3157d092031a6c9c52e
[centos@ip-172-31-36-148 oracle10thaug2020]$ docker run --name ashuc3  -p 9222:80  -d   -e app=web3  ashumultiapp:11082020  
c77bc84c144f8b08e264d3b1f6995ff553dc07981dc1ba14f146da0b9c2901b7

```

# image transfer 

## backup & restore 

### backup 

```
[centos@ip-172-31-36-148 ~]$ docker   save  -o  ashuwebimg.tar  0a3308a8f1aa

```

### restore 
```
[centos@ip-172-31-36-148 ~]$ docker load  -i  ashuwebimg.tar 
291f6e44771a: Loading layer [==================================================>]  222.4MB/222.4MB
c3b444218554: Loading layer [==================================================>]  39.85MB/39.85MB
7ed8005b49ae: Loading layer [==================================================>]  3.584kB/3.584kB
e4bf59bd4aa8: Loading layer [==================================================>]  73.22kB/73.22kB
379eeda99657: Loading layer [==================================================>]  1.008MB/1.008MB
7057e95f2570: Loading layer [==================================================>]  837.6kB/837.6kB
dd548c4084de: Loading layer [==================================================>]   2.56kB/2.56kB
aca1bb5f70c0: Loading layer [==================================================>]   2.56kB/2.56kB
Loaded image ID: sha256:0a3308a8f1aa0b9cd3b193596c9afacf7f7fee6c6219c2088e3e58205163cf01

----
[centos@ip-172-31-36-148 ~]$ docker tag  0a3308a8f1aa  ashumultiapp:11082020 


```

## dockerhub

### tag docker image

```
docker  tag  0a3308a8f1aa   dockerashu/ashumulti:aug2020
```

### push image
```
 617  docker  tag  0a3308a8f1aa   dockerashu/ashumulti:aug2020 
  621  docker  login 
  622  docker  push   dockerashu/ashumulti:aug2020
  624  docker  logout 
```

# Docker Restart policy : 

```
  629  docker  run  -d --name x1  alpine ping fb.com 
  630  docker  ps
  631  docker  inspect   x1  
  632  docker  run  -d --name x2  --restart always   alpine ping fb.com 
  633  history 
  634  docker  inspect   x2

```

===
https://docs.docker.com/config/containers/start-containers-automatically/


# Docker Remote Socket :
---
## configure in TCP socket 

---
```
[centos@ip-172-31-36-148 docker]$ cat  /usr/lib/systemd/system/docker.service
[Unit]
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
BindsTo=containerd.service
After=network-online.target firewalld.service containerd.service
Wants=network-online.target
Requires=docker.socket

[Service]
Type=notify
# the default is not to use systemd for cgroups because the delegate issues still
# exists and systemd currently does not support the cgroup feature set required
# for containers run by docker
ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock  -g  /mnt/docker -H tcp://0.0.0.0:2375
ExecReload=/bin/kill -s HUP $MAINPID
TimeoutSec=0
RestartSec=2
Restart=always

=====
 657  sudo systemctl daemon-reload 
  658  sudo systemctl restart  docker 
  
  ```
  
  ## connection remote docker engine running on TCP socket
  
  ### for Mac and Linux users 
  
  ```
 ashutoshhs-MacBook-Air:~ fire$ export  DOCKER_HOST="tcp://52.23.129.90:2375"
ashutoshhs-MacBook-Air:~ fire$ 
ashutoshhs-MacBook-Air:~ fire$ docker  version 
Client: Docker Engine - Community
 Version:           19.03.12
 API version:       1.40
 Go version:        go1.13.10
 Git commit:        48a66213fe
 Built:             Mon Jun 22 15:41:33 2020
 OS/Arch:           darwin/amd64
 Experimental:      true

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
ashutoshhs-MacBook-Air:~ fire$ docker  images
REPOSITORY                    TAG                 IMAGE ID            CREATED             SIZE
durgamultiapp                 latest1             3f72624f9b24        18 hours ago        258MB
20051987/durgamultiapp        latest1             3f72624f9b24        18 hours ago        258MB
anandimg                      11001               83f4faeb4a9f        18 hours ago        258MB
singhranand/anandimg          11001               83f4faeb4a9f        18 hours ago        258MB
yannamrk/rameshmulti          aug2020             29f908d79498        19 hours ago        258MB
anuradhapottelu/anumultiapp   aug2020i1           29f908d79498        19 hours ago        258MB
dockerram/rameshmulti         aug2020             29f908d79498        19 hours ago        258MB
anumultiapp                   aug112020v3         29f908d79498        19 hours ago        258MB
pradeepsan/test               1                   29f908d79498        19 hours ago        258MB
shomulapp                     11082020            6f1e89054392        19 hours ago        258MB
sho317/shoaib                 aug2020             6f1e89054392        19 hours ago        258MB
prashant                      multiload           f9504f0f1cb2        19 hours ago        258MB
prashantghiwari/prashu        aug2020             f9504f0f1cb2        19 hours ago        258MB
cmalur/chaimulti              aug2020             0a3308a8f1aa        19 hours ago        256MB
dashpd/dinesh                 aug2020             0a3308a8f1aa        19 hours ago        256MB
dockerashu/ashumulti          aug2020             0a3308a8f1aa        19 hours ago        256MB

```

### For window users 
#### Either Docker desktop or any other docker method 

#### Powershell 

```
$env:DOCKER_HOST="tcp://52.23.129.90:2375"

```

# Docker networking 

## list of Bridges

```
[centos@ip-172-31-36-148 docker]$ docker  network    ls
NETWORK ID          NAME                DRIVER              SCOPE
74a4e22ed411        bridge              bridge              local
88602ecc3fb8        host                host                local
d63c99eb750b        none                null                local

```

### exploring docker0

```
[centos@ip-172-31-36-148 docker]$ docker  network  inspect  bridge 
[
    {
        "Name": "bridge",
        "Id": "74a4e22ed411976dbcc27dc00c4e5c20885f81846f2ccb21703c069aecb08bb0",
        "Created": "2020-08-12T00:27:49.268559353-04:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": null,
            "Config": [
                {
                    "Subnet": "172.17.0.0/16",
                    "Gateway": "172.17.0.1"
                }
            ]

```

### all connected containers in bridge
```
[centos@ip-172-31-36-148 docker]$ docker  network  inspect  bridge   |   grep -i ipv4
                "IPv4Address": "172.17.0.3/16",
                "IPv4Address": "172.17.0.4/16",
                "IPv4Address": "172.17.0.2/16",
            "com.docker.network.bridge.host_binding_ipv4": "0.0.0.0",
[centos@ip-172-31-36-148 docker]$ 

```

### container with None Network

```
[centos@ip-172-31-36-148 docker]$ docker  run  -it --rm  --network=none  alpine  sh 
/ # 
/ # 
/ # cat /etc/os-release 
NAME="Alpine Linux"
ID=alpine
VERSION_ID=3.12.0
PRETTY_NAME="Alpine Linux v3.12"
HOME_URL="https://alpinelinux.org/"
BUG_REPORT_URL="https://bugs.alpinelinux.org/"
/ # ifconfig 
lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

/ # ping  172.17.0.1
PING 172.17.0.1 (172.17.0.1): 56 data bytes
ping: sendto: Network unreachable
/ # ping  fb.com

```
### container with Host IP

```
[centos@ip-172-31-36-148 docker]$ docker  run -it --rm   --network=host  alpine  sh 
/ # ifconfig 
docker0   Link encap:Ethernet  HWaddr 02:42:7E:03:27:0D  
          inet addr:172.17.0.1  Bcast:172.17.255.255  Mask:255.255.0.0
          inet6 addr: fe80::42:7eff:fe03:270d/64 Scope:Link
          UP BROADCAST MULTICAST  MTU:1500  Metric:1
          RX packets:5500 errors:0 dropped:0 overruns:0 frame:0
          TX packets:5496 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0 
          RX bytes:441996 (431.6 KiB)  TX bytes:1183041 (1.1 MiB)

eth0      Link encap:Ethernet  HWaddr 0E:EA:4E:D5:F1:FD  
          inet addr:172.31.36.148  Bcast:172.31.47.255  Mask:255.255.240.0
          inet6 addr: fe80::cea:4eff:fed5:f1fd/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:9001  Metric:1
          RX packets:14571 errors:0 dropped:0 overruns:0 frame:0
          TX packets:12583 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:1823659 (1.7 MiB)  TX bytes:3583482 (3.4 MiB)

lo        Link encap:Local Loopback  
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:65536  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000 
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

/ # ls
bin    dev    etc    home   lib    media  mnt    opt    proc   root   run    sbin   srv    sys    tmp    usr    var
/ # 


```

## creat a new bridge 

```
[centos@ip-172-31-36-148 docker]$ docker  network  create   ashubr1  
32690798ca1624157c7a6291183e9c5fe561b5fced8baaab7334c7095c30cec2

---
[centos@ip-172-31-36-148 docker]$ docker  network  inspect  ashubr1 
[
    {
        "Name": "ashubr1",
        "Id": "32690798ca1624157c7a6291183e9c5fe561b5fced8baaab7334c7095c30cec2",
        "Created": "2020-08-12T02:05:16.93207966-04:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {},
        "Options": {},
        "Labels": {}
    }
]


```

### checking 
```
  707  docker  run -d  --name  ashucc11  --network ashubr1  alpine ping fb.com 
  708  docker  run -d  --name  ashucc22  --network ashubr1  alpine ping google.com 
  709  history 




[centos@ip-172-31-36-148 docker]$ docker  network  inspect  ashubr1 
[
    {
        "Name": "ashubr1",
        "Id": "32690798ca1624157c7a6291183e9c5fe561b5fced8baaab7334c7095c30cec2",
        "Created": "2020-08-12T02:05:16.93207966-04:00",
        "Scope": "local",
        "Driver": "bridge",
        "EnableIPv6": false,
        "IPAM": {
            "Driver": "default",
            "Options": {},
            "Config": [
                {
                    "Subnet": "172.18.0.0/16",
                    "Gateway": "172.18.0.1"
                }
            ]
        },
        "Internal": false,
        "Attachable": false,
        "Ingress": false,
        "ConfigFrom": {
            "Network": ""
        },
        "ConfigOnly": false,
        "Containers": {
            "1cac4adeb2038d476da44bef72ef293459e3fe586c8e89507e7587af4e59e9a3": {
                "Name": "ashucc22",
                "EndpointID": "92cc13709f44451bba6e2a6d088743ce87b4d5e0579bac5947bcc8dc4e4770a1",
                "MacAddress": "02:42:ac:12:00:03",
                "IPv4Address": "172.18.0.3/16",
                "IPv6Address": ""
            },
            "8b1a9e4bf3667a1bcd1e6a09ed09d3a207d5ccbc59cc75026fb8434717a1bee2": {
                "Name": "ashucc11",
                "EndpointID": "e1995f341418b09355ba83d88197063bbddbad3d6ad5d16cb86d6b4c2b77a41b",
                "MacAddress": "02:42:ac:12:00:02",
                "IPv4Address": "172.18.0.2/16",
                "IPv6Address": ""
            }

```

## Docker network with custom IP subnet 
```
[centos@ip-172-31-36-148 docker]$ docker  network   create  ashubr2  --subnet  192.168.1.0/24  
d35fe6e7f1021eb2ec68506876e267c23538a1f0e1915b88ed470a60a319776b
[centos@ip-172-31-36-148 docker]$ docker  run  -d --name  ashucc33 --network ashubr2  --ip  192.168.1.100  alpine ping fb.com 

```


## Remove all docker networks 
```
 726  docker  rm  $(docker  ps -aq) -f
  727  docker network  ls
  728  docker  network  rm  ashubr1
  729  docker  network  rm  $(docker network ls  -q)
  730  docker  network  ls
```

# Storage 

## changing. docker engine storage
```
[centos@ip-172-31-36-148 docker]$ cat  /usr/lib/systemd/system/docker.service
[Unit]
Description=Docker Application Container Engine
Documentation=https://docs.docker.com
BindsTo=containerd.service
After=network-online.target firewalld.service containerd.service
Wants=network-online.target
Requires=docker.socket

[Service]
Type=notify
# the default is not to use systemd for cgroups because the delegate issues still
# exists and systemd currently does not support the cgroup feature set required
# for containers run by docker
ExecStart=/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock  -g  /ashutoshh -H tcp://0.0.0.0:2375
ExecReload=/bin/kill -s HUP $MAINPID
TimeoutSec=0
RestartSec=2
Restart=always

====
 743  sudo systemctl daemon-reload 
  744  sudo systemctl restart  docker 

```

## Docker. volumes 

### create volume
```
centos@ip-172-31-36-148 docker]$ docker  volume   create  ashuvol1 
ashuvol1

---
[centos@ip-172-31-36-148 docker]$ docker  volume  ls
DRIVER              VOLUME NAME
local               anuvol1
local               anvol1
local               ashuvol1
local               chaivol1
local               prashant
local               rameshvol1
local               shovol

---
[centos@ip-172-31-36-148 docker]$ docker  volume   inspect  ashuvol1 
[
    {
        "CreatedAt": "2020-08-12T03:00:10-04:00",
        "Driver": "local",
        "Labels": {},
        "Mountpoint": "/ashutoshh/volumes/ashuvol1/_data",
        "Name": "ashuvol1",
        "Options": {},
        "Scope": "local"
    }
]


```

### container with volume
```
[centos@ip-172-31-36-148 docker]$ docker run  -it  --name ashuc1 -v ashuvol1:/mnt/oracle:rw    centos  bash 
Unable to find image 'centos:latest' locally
latest: Pulling from library/centos
3c72a8ed6814: Pull complete 
Digest: sha256:76d24f3ba3317fa945743bb3746fbaf3a0b752f10b10376960de01da70685fbd
Status: Downloaded newer image for centos:latest
[root@32efa7ec30e3 /]# 
[root@32efa7ec30e3 /]# 
[root@32efa7ec30e3 /]# cd   /mnt/oracle/
[root@32efa7ec30e3 oracle]# ls
[root@32efa7ec30e3 oracle]# mkdir hello world 
[root@32efa7ec30e3 oracle]# ls
hello  world
===

[centos@ip-172-31-36-148 docker]$ docker run  -it --rm  -v  ashuvol1:/mnt/ok  alpine  sh 
/ # cd /mnt/ok/
/mnt/ok # ls
hello  world

---

[centos@ip-172-31-36-148 docker]$ docker run  -it --rm  -v  ashuvol1:/mnt/ok:ro   alpine  sh 
/ # 
/ # cd  /mnt/ok/
/mnt/ok # ls
alpine  am      hello   i       world
/mnt/ok # mkdir  fine 
mkdir: can't create directory 'fine': Read-only file system

```
### Backend of Docker volume

```
[root@ip-172-31-36-148 volumes]# cd  /ashutoshh/
[root@ip-172-31-36-148 ashutoshh]# ls
builder  buildkit  containers  devicemapper  image  network  plugins  runtimes  swarm  tmp  trust  volumes
[root@ip-172-31-36-148 ashutoshh]# cd volumes/
[root@ip-172-31-36-148 volumes]# ls
anuvol1  anvol1  ashuvol1  chaivol1  dinesh  metadata.db  pradeepv1  prashant  rameshvol1  shovol
[root@ip-172-31-36-148 volumes]# cd ashuvol1/
[root@ip-172-31-36-148 ashuvol1]# ls
_data
[root@ip-172-31-36-148 ashuvol1]# cd  _data/
[root@ip-172-31-36-148 _data]# ls
alpine  am  hello  i  world

```

## volume mounts 

### mounting a directory 
```
 docker  run  -itd  --name  ashupyc1 -v  /home/centos/day1/pyapp:/mycodes:ro  python    python  /mycodes/ashu.py
 ```
 ### mounting file
 ```
 [centos@ip-172-31-36-148 pyapp]$ docker  run -it --rm  -v  /home/centos/day1/pyapp/hello.py:/mnt/ok.py  alpine  sh 
/ # cd  /mnt/
/mnt # ls
ok.py
/mnt # 

```

# Docker volume with Nginx & httpd server 
```
 803  mkdir day3
  804  cd  day3
  805  git clone  https://github.com/mdn/beginner-html-site-styled
  806  ls
  807  pwd
  808  docker run -d  --name ashuweb9  -v  /home/centos/day3/beginner-html-site-styled:/usr/share/nginx/html  -p 9001:80  nginx 
  809  docker  ps
  810  docker run -d  --name ashuweb19  -v  /home/centos/day3/beginner-html-site-styled:/var/www/html  -p 9009:80  httpd
  
  ```
  
  # Mysql as container 
  ```
  docker  run  -d  --name ashudb -e MYSQL_ROOT_PASSWORD=oracle123  mysql
  
  =====
  
  [centos@ip-172-31-36-148 day3]$ docker  exec  -it ashudb  bash 
root@54ecbcd10041:/# mysql -u root  -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.21 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.01 sec)

mysql> create database  ashu;
Query OK, 1 row affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ashu               |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)


Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 

```

# MYsql db all 
```
[centos@ip-172-31-36-148 day3]$ docker  run -d --name  ashudb -e  MYSQL_ROOT_PASSWORD=oracle123  mysql  
825a1d89963a8ed201d52821968f82a93440ecd4025462b452215d2ac68f4a94
[centos@ip-172-31-36-148 day3]$ docker  ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                 NAMES
825a1d89963a        mysql               "docker-entrypoint.s…"   3 seconds ago       Up 2 seconds        3306/tcp, 33060/tcp   ashudb
0ea4fc7fb12e        mysql               "docker-entrypoint.s…"   5 seconds ago       Up 5 seconds        3306/tcp, 33060/tcp   anudb
fe129995aef4        mysql               "docker-entrypoint.s…"   7 seconds ago       Up 6 seconds        3306/tcp, 33060/tcp   prashdb
41bbe5b3a950        mysql               "docker-entrypoint.s…"   12 seconds ago      Up 11 seconds       3306/tcp, 33060/tcp   pradeepdb
5f344c97ee53        mysql               "docker-entrypoint.s…"   13 seconds ago      Up 12 seconds       3306/tcp, 33060/tcp   rameshdb
020d862c300a        mysql               "docker-entrypoint.s…"   13 seconds ago      Up 12 seconds       3306/tcp, 33060/tcp   shoql
[centos@ip-172-31-36-148 day3]$ docker  exec  -it  ashudb  bash 
root@825a1d89963a:/# mysql -u root -p
Enter password: 
ERROR 2002 (HY000): Can't connect to local MySQL server through socket '/var/run/mysqld/mysqld.sock' (2)
root@825a1d89963a:/# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.21 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.00 sec)

mysql> create database adhoc;
Query OK, 1 row affected (0.00 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| adhoc              |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.00 sec)

```

# MYSQL with VOlume 
```
 docker  run -d --name ashudb111 -e MYSQL_ROOT_PASSWORD=123 -v  /centos:/var/lib/mysql  mysql
 [centos@ip-172-31-36-148 day3]$ docker  exec -it  ashudb111  bash 
root@72554b85c0c2:/# 
root@72554b85c0c2:/# 
root@72554b85c0c2:/# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 8
Server version: 8.0.21 MySQL Community Server - GPL

Copyright (c) 2000, 2020, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> create database ashuehllo;
Query OK, 1 row affected (0.02 sec)

mysql> ^DBye
root@72554b85c0c2:/# exit
[centos@ip-172-31-36-148 day3]$ ls  /centos/
#ib_16384_0.dblwr  ashuehllo      binlog.000002  ca.pem           ib_buffer_pool  ibdata1  mysql.ibd           public_key.pem   sys
#ib_16384_1.dblwr  auto.cnf       binlog.index   client-cert.pem  ib_logfile0     ibtmp1   performance_schema  server-cert.pem  undo_001
#innodb_temp       binlog.000001  ca-key.pem     client-key.pem   ib_logfile1     mysql    private_key.pem     server-key.pem   undo_002

```

# portainer 
```
docker run -d  --name  webui -p 1909:9000  -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
```

# Docker COmpose 

## Client side container. orchestrator

### install on linux platform
```
[centos@ip-172-31-36-148 day3]$ sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   638  100   638    0     0   4567      0 --:--:-- --:--:-- --:--:--  4589
100 11.6M  100 11.6M    0     0  38.3M      0 --:--:-- --:--:-- --:--:-- 38.3M
[centos@ip-172-31-36-148 day3]$ sudo chmod  +x  /usr/local/bin/docker-compose 

```

## COmpose file example 1 :

```
[centos@ip-172-31-36-148 ashuapp1]$ cat  docker-compose.yaml 
version: '3.8'  # this is compose file version 
services:
 ashuappx1:  #  first app
  image: alpine #  docker  image 
  container_name: ashuc001  # container name 
  command: ping fb.com  #  parent process 
  
 ```
 
 ## compose file example 2
 
 ```
 [centos@ip-172-31-36-148 ashuapp1]$ cat  docker-compose.yaml 
version: '3.8'  # this is compose file version 
services:
 ashuappx1:  #  first app
  image: alpine #  docker  image 
  container_name: ashuc001  # container name 
  command: ping fb.com  #  parent process 

 ashuappx2:  #  second app 
  image: nginx
  container_name: ashuwebc001
  ports:
   - "1999:80"

```
### compsoe command
```
  908  docker-compose  ps
  909  docker-compose  stop 
  910  docker-compose  ps
  911  docker-compose  start
  912  docker-compose  kill
  913  docker-compose  ps
  914  ls
  915  mv  docker-compose.yaml   ashu.yml
  916  ls
  917  docker-compose  ps
  918  docker-compose  -f  ashu.yml  ps
  919  docker-compose  -f  ashu.yml   start
  920  docker-compose  -f  ashu.yml  ps
  921  docker-compose  -f  ashu.yml  down 
  922  docker-compose  -f  ashu.yml  ps
```

## compose with dockerfile

```
[centos@ip-172-31-36-148 multiapp]$ cat  docker-compose.yml 
version: '3.5'
services:
 ashumultiapp:
  image: ashuweb:v007  # image tag we want to build
  build: .  # location of Dockerfile
  container_name: ashuxc11  #  after build container will be created 
  ports:
   - "8989:80"  #  same as  docker  -p 8989:80
  environment:
   app: web2  #  its same as docker  -e  app=web2
   
  ```
  
  ===
  ```
  [centos@ip-172-31-36-148 multiapp]$ cat  docker-compose.yml 
version: '3.5'
services:
 ashumultiapp:
  image: ashuweb:v007  # image tag we want to build
  build: .  # location of Dockerfile
  container_name: ashuxc11  #  after build container will be created 
  ports:
   - "8989:80"  #  same as  docker  -p 8989:80
  environment:
   app: web2  #  its same as docker  -e  app=web2 
  networks:
   - ashubr991   # using network  that we craeted below


networks:  #  creating  networking 
 ashubr991:

```

=====
```
[centos@ip-172-31-36-148 multiapp]$ cat  docker-compose.yml 
version: '3.5'
services:
 ashumultiapp:
  image: ashuweb:v007  # image tag we want to build
  build:  # location of Dockerfile
   context: .  # location of dockerfile
   dockerfile: ashu.dockerfile # name of dockerfile 
  container_name: ashuxc11  #  after build container will be created 
  ports:
   - "8989:80"  #  same as  docker  -p 8989:80
  environment:
   app: web2  #  its same as docker  -e  app=web2 
  networks:
   - ashubr991   # using network  that we craeted below


networks:  #  creating  networking 
 ashubr991:

```

