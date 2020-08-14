#  k8s docs

# K8s Client oN linux Based OS 

## install kubectl 

---
https://kubernetes.io/docs/tasks/tools/install-kubectl/

```
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"

[centos@ip-172-31-36-148 ~]$ chmod +x ./kubectl # making executable 
[centos@ip-172-31-36-148 ~]$ sudo mv ./kubectl /usr/local/bin/kubectl # moving to path 
[centos@ip-172-31-36-148 ~]$ kubectl  version --client 
Client Version: version.Info{Major:"1", Minor:"18", GitVersion:"v1.18.7", GitCommit:"bfb38f707bc4a8edfcd73472ec3d96b500b8b781", GitTreeState:"clean", BuildDate:"2020-08-12T20:27:48Z", GoVersion:"go1.13.14", Compiler:"gc", Platform:"linux/amd64"}

```

# Mac OS. as kubernetes client 

## installing kubectl 

```
ashutoshhs-MacBook-Air:~ fire$ curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl"
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100 47.8M  100 47.8M    0     0  6317k      0  0:00:07  0:00:07 --:--:-- 6562k

ashutoshhs-MacBook-Air:~ fire$ ls
Applications		Downloads		Pictures		config			table
Creative Cloud Files	Library			Public			k8s
Desktop			Movies			VirtualBox VMs		kubectl
Documents		Music			ashujavaimg.tar		student

ashutoshhs-MacBook-Air:~ fire$ chmod +x ./kubectl
ashutoshhs-MacBook-Air:~ fire$ sudo mv ./kubectl /usr/local/bin/kubectl
Password:

ashutoshhs-MacBook-Air:~ fire$ kubectl version --client
Client Version: version.Info{Major:"1", Minor:"18", GitVersion:"v1.18.7", GitCommit:"bfb38f707bc4a8edfcd73472ec3d96b500b8b781", GitTreeState:"clean", BuildDate:"2020-08-12T20:27:48Z", GoVersion:"go1.13.14", Compiler:"gc", Platform:"darwin/amd64"}

```

## kubectl in Windows system 

---
https://storage.googleapis.com/kubernetes-release/release/v1.18.0/bin/windows/amd64/kubectl.exe

### download this and add to PATH variable  
### then test from powershell or CMD 
--
kubectl client --version 


## connecting to k8s master from Client system 

```
[centos@ip-172-31-36-148 ~]$ kubectl  version  
Client Version: version.Info{Major:"1", Minor:"18", GitVersion:"v1.18.7", GitCommit:"bfb38f707bc4a8edfcd73472ec3d96b500b8b781", GitTreeState:"clean", BuildDate:"2020-08-12T20:27:48Z", GoVersion:"go1.13.14", Compiler:"gc", Platform:"linux/amd64"}
The connection to the server localhost:8080 was refused - did you specify the right host or port?


[centos@ip-172-31-36-148 ~]$ kubectl  version   --kubeconfig  admin.conf  
Client Version: version.Info{Major:"1", Minor:"18", GitVersion:"v1.18.7", GitCommit:"bfb38f707bc4a8edfcd73472ec3d96b500b8b781", GitTreeState:"clean", BuildDate:"2020-08-12T20:27:48Z", GoVersion:"go1.13.14", Compiler:"gc", Platform:"linux/amd64"}
Server Version: version.Info{Major:"1", Minor:"18", GitVersion:"v1.18.6", GitCommit:"dff82dc0de47299ab66c83c626e08b245ab19037", GitTreeState:"clean", BuildDate:"2020-07-15T16:51:04Z", GoVersion:"go1.13.9", Compiler:"gc", Platform:"linux/amd64"}


```

### another way to check connection 

```
ashutoshhs-MacBook-Air:Desktop fire$ kubectl cluster-info  --kubeconfig  admin.conf  
Kubernetes master is running at https://35.169.173.70:6443
KubeDNS is running at https://35.169.173.70:6443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy

To further debug and diagnose cluster problems, use 'kubectl cluster-info dump'.

```

## getting list of nodes 

```
[centos@ip-172-31-36-148 ~]$ kubectl get  nodes    --kubeconfig  admin.conf  
NAME                            STATUS   ROLES    AGE   VERSION
ip-172-31-73-242.ec2.internal   Ready    <none>   12h   v1.18.6
ip-172-31-74-78.ec2.internal    Ready    <none>   12h   v1.18.6
ip-172-31-79-12.ec2.internal    Ready    master   12h   v1.18.6

```

## setting admin.conf as default authentication 

```
[centos@ip-172-31-36-148 ~]$ ls
admin.conf  ashuwebimg.tar  day1  day2  day3  oracle10thaug2020

[centos@ip-172-31-36-148 ~]$ pwd
/home/centos

[centos@ip-172-31-36-148 ~]$ ls  -a
.   .bash_history  .bash_profile  .docker  .pki  .vim      admin.conf      day1  day3
..  .bash_logout   .bashrc        .kube    .ssh  .viminfo  ashuwebimg.tar  day2  oracle10thaug2020

[centos@ip-172-31-36-148 ~]$ cp  admin.conf  .kube/config  

```
# PODS

## nginx pod
```
[centos@ip-172-31-36-148 pods]$ cat  ashupod1.yaml 
apiVersion: v1 
kind: Pod
metadata:
 name: ashupod-001   #  name of my pod 

spec: #  info about application and its component 
 containers: # writing about docker image and containers 
 - name: ashuc1  # name of container  
   image: nginx #  name of Docker  image from DOcker hub 
   ports: # default application port  but optional 
   - containerPort: 80  #  nginx has 80 port by default 
   
 ```
 
 ### deploy pod on K8s 
 
 ### dry-run 
 
 ```
 [centos@ip-172-31-36-148 pods]$ kubectl  apply  -f  ashupod1.yaml  --dry-run=client  
pod/ashupod-001 created (dry run)
```

### deploying 
```
[centos@ip-172-31-36-148 pods]$ kubectl  apply  -f  ashupod1.yaml  
pod/ashupod-001 created
[centos@ip-172-31-36-148 pods]$ 
[centos@ip-172-31-36-148 pods]$ kubectl   get  pods 
NAME          READY   STATUS              RESTARTS   AGE
ashupod-001   0/1     ContainerCreating   0          6s
[centos@ip-172-31-36-148 pods]$ kubectl   get  pods 
NAME          READY   STATUS             RESTARTS   AGE
ashupod-001   1/1     Running            0          12s

```

## tips about PODs 

```
[centos@ip-172-31-36-148 pods]$ kubectl   get   po 
NAME             READY   STATUS    RESTARTS   AGE
anandpod-001     1/1     Running   0          87s
anupod-001       1/1     Running   0          10m
ashupod-001      1/1     Running   0          11m
chaipod-01       1/1     Running   0          11m
mohitpod-001     1/1     Running   0          10m
pradeeppod-001   1/1     Running   0          2m22s
prashpod001      1/1     Running   0          9m52s
rameshpod-001    1/1     Running   0          10m
shoaib-001       1/1     Running   0          6m34s
shopod-001       1/1     Running   0          9m25s
[centos@ip-172-31-36-148 pods]$ kubectl   get   po  -o  wide  
NAME             READY   STATUS    RESTARTS   AGE     IP                NODE                            NOMINATED NODE   READINESS GATES
anandpod-001     1/1     Running   0          99s     192.168.121.77    ip-172-31-74-78.ec2.internal    <none>           <none>
anupod-001       1/1     Running   0          11m     192.168.153.199   ip-172-31-73-242.ec2.internal   <none>           <none>
ashupod-001      1/1     Running   0          11m     192.168.121.72    ip-172-31-74-78.ec2.internal    <none>           <none>
chaipod-01       1/1     Running   0          11m     192.168.121.73    ip-172-31-74-78.ec2.internal    <none>           <none>
mohitpod-001     1/1     Running   0          10m     192.168.153.200   ip-172-31-73-242.ec2.internal   <none>           <none>
pradeeppod-001   1/1     Running   0          2m34s   192.168.121.76    ip-172-31-74-78.ec2.internal    <none>           <none>
prashpod001      1/1     Running   0          10m     192.168.153.201   ip-172-31-73-242.ec2.internal   <none>           <none>
rameshpod-001    1/1     Running   0          10m     192.168.121.74    ip-172-31-74-78.ec2.internal    <none>           <none>
shoaib-001       1/1     Running   0          6m46s   192.168.153.202   ip-172-31-73-242.ec2.internal   <none>           <none>
shopod-001       1/1     Running   0          9m37s   192.168.121.75    ip-172-31-74-78.ec2.internal    <none>           <none>

```

===
### specific pod details 

```
[centos@ip-172-31-36-148 pods]$ kubectl   get   po  ashupod-001    -o  wide  
NAME          READY   STATUS    RESTARTS   AGE   IP               NODE                           NOMINATED NODE   READINESS GATES
ashupod-001   1/1     Running   0          13m   192.168.121.72   ip-172-31-74-78.ec2.internal   <none>           <none>

```

### Describe pods 

```
[centos@ip-172-31-36-148 pods]$ kubectl   get   po  ashupod-001    -o  wide  
NAME          READY   STATUS    RESTARTS   AGE   IP               NODE                           NOMINATED NODE   READINESS GATES
ashupod-001   1/1     Running   0          13m   192.168.121.72   ip-172-31-74-78.ec2.internal   <none>           <none>
[centos@ip-172-31-36-148 pods]$ kubectl   describe   pods  ashupod-001  
Name:         ashupod-001
Namespace:    default
Priority:     0
Node:         ip-172-31-74-78.ec2.internal/172.31.74.78
Start Time:   Thu, 13 Aug 2020 03:14:40 -0400
Labels:       <none>
Annotations:  cni.projectcalico.org/podIP: 192.168.121.72/32
Status:       Running
IP:           192.168.121.72
IPs:
  IP:  192.168.121.72
Containers:
  ashuc1:
    Container ID:   docker://0249a0b10fdc8f21a99c0e6eba0c8bdbde3289572cee5ba2d340ab08773108fc
    Image:          nginx
    Image ID:       docker-pullable://nginx@sha256:36b74457bccb56fbf8b05f79c85569501b721d4db813b684391d63e02287c0b2
    Port:           80/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Thu, 13 Aug 2020 03:14:45 -0400
    Ready:          True
    Restart Count:  0
    Environment:    <none>

```

### Help for keywords in k8s

```
 1056  kubectl  explain   pods 
 1057  kubectl  explain   pods.spec   
 1058  kubectl  explain   pods.spec.containers 
 
 ```
 
 ## deleting pods 
 
 ```
 [centos@ip-172-31-36-148 pods]$ kubectl  delete  pods  ashupod-001 
pod "ashupod-001" deleted

[centos@ip-172-31-36-148 pods]$ kubectl  delete  pods  --all
pod "anandpod-001" deleted
pod "anupod-001" deleted
pod "chaipod-01" deleted
pod "durgapod-001" deleted
pod "mohitpod-001" deleted
pod "pradeeppod-001" deleted
pod "prashpod001" deleted

```

## Auto generate YAML and JSON 
```
 1070  kubectl  run  ashupod2 --image=nginx  --port=80   --dry-run=client  
 1071  kubectl  run  ashupod2 --image=nginx  --port=80   --dry-run=client   -o  yaml 
 1072  kubectl  run  ashupod2 --image=nginx  --port=80   --dry-run=client   -o json 
 
  1075  kubectl  run  ashupod2 --image=nginx  --port=80   --dry-run=client   -o  yaml >ashupod2.yaml 
 1076  kubectl  run  ashupod2 --image=nginx  --port=80   --dry-run=client   -o  json  >ashupod2.json  
 1077  ls
 1078  cat  ashupod2.yaml 
 1079  cat  ashupod2.json 
 1080  ls
 1081  kubectl  apply -f  ashupod2.json  
 
 ```
 
 ## Pods with labesl 
 
 ```
 [centos@ip-172-31-36-148 pods]$ cat  ashupod1.yaml 
apiVersion: v1 
kind: Pod
metadata:
 name: ashupod-001   #  name of my pod  and its must be unique as of Now 
 labels:
  x: helloashu   #  here x is key and helloashu is value 
  "y": "100"

spec: #  info about application and its component 
 containers: # writing about docker image and containers 
 - name: ashuc1  # name of container  
   image: nginx #  name of Docker  image from DOcker hub 
   ports: # default application port  but optional 
   - containerPort: 80  #  nginx has 80 port by default 
   
  ```
  
  ### checking. labels 
  ```
  [centos@ip-172-31-36-148 pods]$ kubectl  get  po  --show-labels 
NAME           READY   STATUS    RESTARTS   AGE    LABELS
anandpod2      1/1     Running   0          33m    run=anandpod2
anupod2        1/1     Running   0          34m    run=anupod2
ashupod-001    1/1     Running   0          2m4s   x=helloashu,y=100
ashupod2       1/1     Running   0          34m    run=ashupod2
chaipod2       1/1     Running   0          28m    run=chaipod2
mohitpod-001   1/1     Running   0          32m    run=mohitpod-001

```

# creating NodePort service 

```
[centos@ip-172-31-36-148 pods]$ cat  ashuapp1service1.yaml 
apiVersion: v1
kind: Service
metadata:
 name: ashusvc-1

spec:
 type: NodePort  #  type of  service  
 selector:  #  this is for finding  pod with labels 
  run: ashupod2  #  this is the label of my pod and it must match 
 ports:
 - name: webapp1  # name of port  and its optional  
   port: 1234  #  service port  number it can be anything  in the range 1024 to 60k u can use this
   protocol: TCP  #  target apps protocol 
   targetPort: 80 #  this port number must match pod port 
   
   ```
   
   # package 
   
   
  ```
   kubectl   run   ashuwebpod2  --image=dockerashu/ashumulti:aug2020  --port  80 --dry-run=client -o yaml  >webashpod2.yml
   kubectl  create  service  nodeport  ashusvc2  --tcp  1345:80  --dry-run=client -o yaml >>webashpod2.yml
   
   ===
   [centos@ip-172-31-36-148 pods]$ cat  webashpod2.yml 
apiVersion: v1
kind: Pod
metadata:
  creationTimestamp: null
  labels: #  defining  labels
    run: ashuwebpod2 #  label of pod 
  name: ashuwebpod2    # name  of pod 
spec:
  containers:
  - image: dockerashu/ashumulti:aug2020  # docker  image
    name: ashuwebpod2  #  name of container 
    ports:
    - containerPort: 80  # port of  application 
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}
---

apiVersion: v1
kind: Service
metadata:
  creationTimestamp: null
  labels:
    app: ashusvc2 # label of service u can ignore for now
  name: ashusvc2  # name of service 
spec:
  ports:
  - name: 1345-80
    port: 1345  # service  port  number 
    protocol: TCP
    targetPort: 80 #  pod port number 
  selector:  # find  pod with labels 
   run: ashuwebpod2   #  must match label of  pod  
  type: NodePort
status:
  loadBalancer: {}


===

```

### checking service 
```
[centos@ip-172-31-36-148 pods]$ kubectl   get  po 
NAME            READY   STATUS    RESTARTS   AGE
anandwebpod     1/1     Running   0          37s
anuwebpod3      1/1     Running   0          11m
anuwebpod4      1/1     Running   0          15s
ashuwebpod2     1/1     Running   0          54s
chaipod2        1/1     Running   0          11m
mohitpod-001    1/1     Running   0          25s
pradeeppod2     1/1     Running   0          38s
prashpod3       1/1     Running   0          11m
prashwebpod1    1/1     Running   0          48s
rameshwebpod2   1/1     Running   0          3s
[centos@ip-172-31-36-148 pods]$ kubectl   get  service
NAME          TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
anandsvc2     NodePort    10.103.142.188   <none>        1345:31327/TCP   42s
anuserv2      NodePort    10.100.58.240    <none>        2222:32266/TCP   20s
ashusvc2      NodePort    10.99.151.226    <none>        1345:30955/TCP   59s
kubernetes    ClusterIP   10.96.0.1        <none>        443/TCP          13m
mohitsvc1     NodePort    10.108.215.155   <none>        1345:30652/TCP   30s
pradeepsvc2   NodePort    10.105.216.105   <none>        1346:32252/TCP   43s
prashser2     NodePort    10.101.133.239   <none>        1345:32024/TCP   53s
rameshsvc2    NodePort    10.96.6.91       <none>        1345:32578/TCP   8s
[centos@ip-172-31-36-148 pods]$ kubectl   get  svc
NAME          TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
anandsvc2     NodePort    10.103.142.188   <none>        1345:31327/TCP   48s
anuserv2      NodePort    10.100.58.240    <none>        2222:32266/TCP   26s
ashusvc2      NodePort    10.99.151.226    <none>        1345:30955/TCP   65s
kubernetes    ClusterIP   10.96.0.1        <none>        443/TCP          13m
mohitsvc1     NodePort    10.108.215.155   <none>        1345:30652/TCP   36s
pradeepsvc2   NodePort    10.105.216.105   <none>        1346:32252/TCP   49s
prashser2     NodePort    10.101.133.239   <none>        1345:32024/TCP   59s
rameshsvc2    NodePort    10.96.6.91       <none>        1345:32578/TCP   14s

```

# Namespace 

## list of NS
```
[centos@ip-172-31-36-148 ~]$ kubectl  get  ns
NAME              STATUS   AGE
default           Active   34h
kube-node-lease   Active   34h
kube-public       Active   34h
kube-system       Active   34h


```

# K8s multinode cluster deployment using Kubeadm 

##  pre-setup stpes for all the system / vms 

```
[root@masternode ~]# cat  k8spresetup.sh 
setenforce  0  # disable selinux 
# local DNS only required in manual setup 
# in cloud based setup this is automatic 
echo "172.31.39.128 masternode"   >>/etc/hosts
echo "172.31.38.131 minion-node-1"   >>/etc/hosts
echo "172.31.37.172 minion-node-2"   >>/etc/hosts

#  swap memory must be disable 
swapoff -a

#  enable kernel bridge driver
modprobe br_netfilter
echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables

# install docker  in all the system 
yum   install  docker  -y
systemctl  start  docker
systemctl  enable  docker  
# note in your case you can follow docker installation from below link according to your VM OS
# https://docs.docker.com/engine/install/centos/

# Installing  kubeadm : the k8s installer  in all the system / vm

#  setup a repo 
cat  <<EOF  >/etc/yum.repos.d/kube.repo
[kube]
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
gpgcheck=0
EOF

# installing kubeadm
yum  install kubeadm  kubectl kubelet  -y
systemctl start kubelet 
systemctl enable kubelet 


```

## install Master node 

```
[root@masternode ~]# kubeadm  init  --pod-network-cidr=192.168.0.0/16 

```
### take a look in output of above command and follow steps 

## Note: you can assume master node as client also 

## deploy calico network CNI
```
kubectl apply -f https://docs.projectcalico.org/v3.8/manifests/calico.yaml

```

# Namespace again 
```
[centos@ip-172-31-36-148 ~]$ kubectl  get ns
NAME              STATUS   AGE
anuradhans        Active   81m
default           Active   36h
kube-node-lease   Active   36h
kube-public       Active   36h
kube-system       Active   36h
[centos@ip-172-31-36-148 ~]$ 
[centos@ip-172-31-36-148 ~]$ 
[centos@ip-172-31-36-148 ~]$ 
[centos@ip-172-31-36-148 ~]$ kubectl  get  po 
No resources found in default namespace.
[centos@ip-172-31-36-148 ~]$ kubectl  get  po  -n kube-system 
NAME                                                   READY   STATUS    RESTARTS   AGE
calico-kube-controllers-75d555c48-vt8lj                1/1     Running   3          36h
calico-node-r7mjj                                      1/1     Running   3          36h
calico-node-wftbr                                      1/1     Running   3          36h
calico-node-z48d6                                      1/1     Running   3          36h
coredns-66bff467f8-59bcx                               1/1     Running   3          36h
coredns-66bff467f8-fms24                               1/1     Running   3          36h
etcd-ip-172-31-79-12.ec2.internal                      1/1     Running   3          36h
kube-apiserver-ip-172-31-79-12.ec2.internal            1/1     Running   3          36h
kube-controller-manager-ip-172-31-79-12.ec2.internal   1/1     Running   3          36h
kube-proxy-2kznv                                       1/1     Running   3          36h
kube-proxy-92gj7                                       1/1     Running   3          36h
kube-proxy-jwxjt                                       1/1     Running   3          36h
kube-scheduler-ip-172-31-79-12.ec2.internal            1/1     Running   3          36h

===

[centos@ip-172-31-36-148 day5]$ cat  pod.yml 
apiVersion: v1
kind: Pod
metadata:
  namespace: ashu-space  #  name of  my name space  
  creationTimestamp: null
  labels: # label of pod 
    run: ashupod
  name: ashupod # name of pod 
spec:
  containers:
  - image: dockerashu/ashumulti:aug2020
    name: ashupod
    ports:
    - containerPort: 80
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}


---
[centos@ip-172-31-36-148 day5]$ kubectl  get  po -n ashu-space 
NAME      READY   STATUS    RESTARTS   AGE
ashupod   1/1     Running   0          2m27s

```

## expose pod to create service 
```
[centos@ip-172-31-36-148 day5]$ kubectl  expose  pod ashupod  --type NodePort --port 1245 --target-port 80 --name ashus1 -n ashu-space 
service/ashus1 exposed
```

# Deployment 

```
kubectl  create  deployment  ashu-dep-1 --image=dockerashu/ashumulti:aug2020   --dry-run=client -o yaml >dep1.yml

====
[centos@ip-172-31-36-148 day5]$ cat dep1.yml 
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: ashu-dep-1
  name: ashu-dep-1  # name of deployment 
  namespace: ashu-space  #  my personal name space  
spec:
  replicas: 2   # replicaset will be create and then one pod will be 
  selector:
    matchLabels:
      app: ashu-dep-1
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: ashu-dep-1
    spec:
      containers:
      - image: dockerashu/ashumulti:aug2020
        name: ashumulti
        resources: {}
status: {}

```

## checking deployments

```
[centos@ip-172-31-36-148 day5]$ kubectl  apply  -f  dep1.yml  -n  ashu-space  
deployment.apps/ashu-dep-1 created
[centos@ip-172-31-36-148 day5]$ kubectl  get  deployments  -n ashu-space
NAME         READY   UP-TO-DATE   AVAILABLE   AGE
ashu-dep-1   2/2     2            2           17s
[centos@ip-172-31-36-148 day5]$ kubectl  get  deployment  -n ashu-space
NAME         READY   UP-TO-DATE   AVAILABLE   AGE
ashu-dep-1   2/2     2            2           21s
[centos@ip-172-31-36-148 day5]$ kubectl  get  deploy  -n ashu-space
NAME         READY   UP-TO-DATE   AVAILABLE   AGE
ashu-dep-1   2/2     2            2           27s

===
[centos@ip-172-31-36-148 day5]$ kubectl  get replicaset  -n ashu-space
NAME                    DESIRED   CURRENT   READY   AGE
ashu-dep-1-65fdc4dd67   2         2         2       85s
[centos@ip-172-31-36-148 day5]$ kubectl  get rs  -n ashu-space
NAME                    DESIRED   CURRENT   READY   AGE
ashu-dep-1-65fdc4dd67   2         2         2       106s
[centos@ip-172-31-36-148 day5]$ 
[centos@ip-172-31-36-148 day5]$ 
[centos@ip-172-31-36-148 day5]$ kubectl  get pods  -n ashu-space
NAME                          READY   STATUS    RESTARTS   AGE
ashu-dep-1-65fdc4dd67-6gfd8   1/1     Running   0          116s
ashu-dep-1-65fdc4dd67-bptwr   1/1     Running   0          116s


---

[centos@ip-172-31-36-148 day5]$ kubectl  expose deployment  ashu-dep-1  --type LoadBalancer --port 9090 --target-port 80 -n ashu-space 
service/ashu-dep-1 exposed
[centos@ip-172-31-36-148 day5]$ 
[centos@ip-172-31-36-148 day5]$ 
[centos@ip-172-31-36-148 day5]$ kubectl  get  svc  -n ashu-space  
NAME         TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
ashu-dep-1   LoadBalancer   10.106.239.159   <pending>     9090:32592/TCP   10s

```

## scaling deployment oriented pods 

```
kubectl  scale deployment ashu-dep-1 --replicas=5  -n ashu-space
```

## Version and rollback in deployment 

### updating image
```
[centos@ip-172-31-36-148 multiapp]$ kubectl  set image deployment  ashu-dep-1 ashumulti=dockerashu/ashumulti:aug2020v2  -n ashu-space 
deployment.apps/ashu-dep-1 image updated


---
 1147  docker  build  -t  dockerashu/ashumulti:aug2020v3  -f ashu.dockerfile . 
 1148  docker push dockerashu/ashumulti:aug2020v3
 1149  history 
 1150   kubectl  set image deployment  ashu-dep-1 ashumulti=dockerashu/ashumulti:aug2020v3  -n ashu-space
 1151  kubectl  describe deployment  ashu-dep-1  -n ashu-space 
 1152  history 
 1153  kubectl rollout history deployment ashu-dep-1  -n ashu-space 
 1154  kubectl  describe deployment  ashu-dep-1  -n ashu-space 
 1155  kubectl  rollout undo deployment ashu-dep-1 --to-revision=1  -n ashu-space 

```

## ENv In POD and Deployment 

### pod with ENV
```
[centos@ip-172-31-36-148 day5]$ cat  pod.yml 
apiVersion: v1
kind: Pod
metadata:
  namespace: ashu-space  #  name of  my name space  
  creationTimestamp: null
  labels: # label of pod 
    run: ashupod
  name: ashupod # name of pod 
spec:
  containers:
  - image: dockerashu/ashumulti:aug2020
    name: ashupod
    ports:
    - containerPort: 80
    env:
    - name: app # keyname 
      value: web2 #  value as per docker image 
    resources: {}
  dnsPolicy: ClusterFirst
  restartPolicy: Always
status: {}

```
### Deployment with ENV 

```
[centos@ip-172-31-36-148 day5]$ cat envdep.yaml 
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: ashudep-env
  name: ashudep-env
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ashudep-env
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: ashudep-env
    spec:
      containers:
      - image: dockerashu/ashumulti:aug2020
        name: ashumulti
        env: # for defining or using env variable 
        - name: app # this key must be same as dockerfile ENV whatever we have defined
          value: web2  #  deploying second app out of 3 
        resources: {}
status: {}


[centos@ip-172-31-36-148 day5]$ kubectl  apply -f  envdep.yaml  -n ashu-space 
deployment.apps/ashudep-env created


[centos@ip-172-31-36-148 day5]$ kubectl get  deployments.apps  -n ashu-space 
NAME          READY   UP-TO-DATE   AVAILABLE   AGE
ashudep-env   1/1     1            1           21s

```
### exposing deployment 

```
[centos@ip-172-31-36-148 day5]$ kubectl get  deployments.apps  -n ashu-space 
NAME          READY   UP-TO-DATE   AVAILABLE   AGE
ashudep-env   1/1     1            1           21s
[centos@ip-172-31-36-148 day5]$ kubectl  expose  deployment ashudep-env  --type NodePort  --port 1234 --target-port 80  -n ashu-space 
service/ashudep-env exposed
[centos@ip-172-31-36-148 day5]$ kubectl  get  svc -n ashu-space 
NAME          TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
ashudep-env   NodePort   10.103.167.16   <none>        1234:30149/TCP   9s

```


## DB mysql on k8s using Deployment 

```
[centos@ip-172-31-36-148 day5]$ cat db.yml 
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: ashudb
  name: ashudb
  namespace: ashu-space  #  name of namespace 
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ashudb
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: ashudb
    spec:
      containers:
      - image: mysql
        name: mysql
        ports:
        - containerPort: 3306  #  default port of mysql server 
        resources: {}
status: {}


```

## Best way to deploy db using Secrets

```
[centos@ip-172-31-36-148 day5]$ kubectl  create  secret  generic  ashudbsec  --from-literal  p=Oracle099   -n ashu-space 
secret/ashudbsec created

[centos@ip-172-31-36-148 day5]$ cat  db.yml 
apiVersion: apps/v1
kind: Deployment
metadata:
  creationTimestamp: null
  labels:
    app: ashudb
  name: ashudb
  namespace: ashu-space  #  name of namespace 
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ashudb
  strategy: {}
  template:
    metadata:
      creationTimestamp: null
      labels:
        app: ashudb
    spec:
      containers:
      - image: mysql
        name: mysql
        env:
        - name: MYSQL_ROOT_PASSWORD  # mysql root user variable 
          valueFrom:
           secretKeyRef:  #  calling  some secret
            name: ashudbsec  #  name of secret
            key: p  #  key of secret that we created 
        ports:
        - containerPort: 3306  #  default port of mysql server 
        resources: {}


```

# Dashboard in k8s 

```
[centos@ip-172-31-36-148 day5]$ kubectl  get  sa -n ashu-space 
NAME      SECRETS   AGE
default   1         4h13m
[centos@ip-172-31-36-148 day5]$ kubectl  get  secrets -n ashu-space 
NAME                  TYPE                                  DATA   AGE
ashudbsec             Opaque                                1      39m
default-token-c294b   kubernetes.io/service-account-token   3      4h14m
[centos@ip-172-31-36-148 day5]$ 
[centos@ip-172-31-36-148 day5]$ kubectl  describe secrets  default-token-c294b  -n ashu-space 
Name:         default-token-c294b
Namespace:    ashu-space
Labels:       <none>
Annotations:  kubernetes.io/service-account.name: default
              kubernetes.io/service-account.uid: 59ccdfe3-413b-4a5f-8b7a-043c8b5e6e7b

Type:  kubernetes.io/service-account-token

Data
====
ca.crt:     1025 bytes
namespace:  10 bytes
token:      eyJhbGciOiJSUzI1NiIsImtpZCI6Ik01bUNGR0phMWt1Sml5cDNoSUdJUUhCVVVIZFBrZGpLaWVXYTFMbGkwYXMifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJhc2h1LXNwYWNlIiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9zZWNyZXQubmFtZSI6ImRlZmF1bHQtdG9rZW4tYzI5NGIiLCJrdWJlcm5ldGVzLmlvL3NlcnZpY2VhY2NvdW50L3NlcnZpY2UtYWNjb3VudC5uYW1lIjoiZGVmYXVsdCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjU5Y2NkZmUzLTQxM2ItNGE1Zi04YjdhLTA0M2M4YjVlNmU3YiIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDphc2h1LXNwYWNlOmRlZmF1bHQifQ.TA4nNVJ_CnVKqXQxYFX_0eSZ63B19x-vCHuhdJ2_lictHIesLgcw4DXZ_3aXBwCnd8-Z6X1lri8NT8dHF11gYBr9seX5Hq8JD_j_aLZYecJWUo-vGyuzx8pqMWQiPeZMJve57jloMkH-xCH2TrefpimXnjAAsSNd-MF487dpyt31O4UfcRFhjQjQxDWWlTUD_wgQYgY93LhH90ydP5PG1IPM0ZUbvVXxR_9R9djUW-v57vj_j9uSfRrwkwOoXiQridmyRPvG99EWG_VkPNc9l2aT6U9Rr_mOmyqQFMI20-z2ArKgIxcpj1oqrhfk15A_jZ_LRQRddL0ZkkAFYdbVNw

===

```

## deploying dashboard

```
[centos@ip-172-31-36-148 day5]$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0/aio/deploy/recommended.yaml
namespace/kubernetes-dashboard created
serviceaccount/kubernetes-dashboard created
service/kubernetes-dashboard created
secret/kubernetes-dashboard-certs created
secret/kubernetes-dashboard-csrf created
secret/kubernetes-dashboard-key-holder created
configmap/kubernetes-dashboard-settings created
role.rbac.authorization.k8s.io/kubernetes-dashboard created
clusterrole.rbac.authorization.k8s.io/kubernetes-dashboard created
rolebinding.rbac.authorization.k8s.io/kubernetes-dashboard created
clusterrolebinding.rbac.authorization.k8s.io/kubernetes-dashboard created
deployment.apps/kubernetes-dashboard created
service/dashboard-metrics-scraper created
deployment.apps/dashboard-metrics-scraper created
[centos@ip-172-31-36-148 day5]$ 
[centos@ip-172-31-36-148 day5]$ 
[centos@ip-172-31-36-148 day5]$ kubectl   get  ns
NAME                   STATUS   AGE
anand-space            Active   4h13m
anuradhans             Active   5h47m
ashu-space             Active   4h18m
chai-space             Active   4h17m
default                Active   40h
kube-node-lease        Active   40h
kube-public            Active   40h
kube-system            Active   40h
kubernetes-dashboard   Active   21s
prashant               Active   4h17m
ramesh-ns              Active   4h18m
shob                   Active   4h15m
[centos@ip-172-31-36-148 day5]$ kubectl  get  deploy  -n kubernetes-dashboard
NAME                        READY   UP-TO-DATE   AVAILABLE   AGE
dashboard-metrics-scraper   1/1     1            1           33s
kubernetes-dashboard        1/1     1            1           34s
[centos@ip-172-31-36-148 day5]$ kubectl  get  po   -n kubernetes-dashboard
NAME                                         READY   STATUS    RESTARTS   AGE
dashboard-metrics-scraper-6b4884c9d5-n7kmp   1/1     Running   0          44s
kubernetes-dashboard-7b544877d5-grbb9        1/1     Running   0          45s
[centos@ip-172-31-36-148 day5]$ kubectl  get  svc  -n kubernetes-dashboard
NAME                        TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
dashboard-metrics-scraper   ClusterIP   10.107.139.39   <none>        8000/TCP   50s
kubernetes-dashboard        ClusterIP   10.96.26.218    <none>        443/TCP    51s

```

### sa and secrets
```
[centos@ip-172-31-36-148 day5]$ kubectl  get  sa  -n kubernetes-dashboard
NAME                   SECRETS   AGE
default                1         2m15s
kubernetes-dashboard   1         2m15s
[centos@ip-172-31-36-148 day5]$ 
[centos@ip-172-31-36-148 day5]$ 
[centos@ip-172-31-36-148 day5]$ kubectl  get  secrets -n kubernetes-dashboard
NAME                               TYPE                                  DATA   AGE
default-token-5xfpl                kubernetes.io/service-account-token   3      2m26s
kubernetes-dashboard-certs         Opaque                                0      2m26s
kubernetes-dashboard-csrf          Opaque                                1      2m26s
kubernetes-dashboard-key-holder    Opaque                                2      2m26s
kubernetes-dashboard-token-9mtqz   kubernetes.io/service-account-token   3      2m26s


```
### changing service type to NodePOrt or LB 
```
[centos@ip-172-31-36-148 day5]$ kubectl  get  svc  -n kubernetes-dashboard
NAME                        TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)    AGE
dashboard-metrics-scraper   ClusterIP   10.107.139.39   <none>        8000/TCP   3m20s
kubernetes-dashboard        ClusterIP   10.96.26.218    <none>        443/TCP    3m21s
[centos@ip-172-31-36-148 day5]$ 
[centos@ip-172-31-36-148 day5]$ 
[centos@ip-172-31-36-148 day5]$ 
[centos@ip-172-31-36-148 day5]$ kubectl  edit  svc   kubernetes-dashboard     -n  kubernetes-dashboard 
service/kubernetes-dashboard edited
[centos@ip-172-31-36-148 day5]$ kubectl  get  svc  -n kubernetes-dashboard
NAME                        TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)         AGE
dashboard-metrics-scraper   ClusterIP   10.107.139.39   <none>        8000/TCP        5m39s
kubernetes-dashboard        NodePort    10.96.26.218    <none>        443:32710/TCP   5m40s

```
### getting secret token 

```
[centos@ip-172-31-36-148 day5]$ kubectl get  sa  -n kubernetes-dashboard 
NAME                   SECRETS   AGE
default                1         8m25s
kubernetes-dashboard   1         8m25s
[centos@ip-172-31-36-148 day5]$ kubectl get  secrets  -n kubernetes-dashboard 
NAME                               TYPE                                  DATA   AGE
default-token-5xfpl                kubernetes.io/service-account-token   3      8m32s
kubernetes-dashboard-certs         Opaque                                0      8m32s
kubernetes-dashboard-csrf          Opaque                                1      8m32s
kubernetes-dashboard-key-holder    Opaque                                2      8m32s
kubernetes-dashboard-token-9mtqz   kubernetes.io/service-account-token   3      8m32s
[centos@ip-172-31-36-148 day5]$ kubectl  describe  secrets  kubernetes-dashboard-token-9mtqz   -n kubernetes-dashboard 
Name:         kubernetes-dashboard-token-9mtqz
Namespace:    kubernetes-dashboard
Labels:       <none>
Annotations:  kubernetes.io/service-account.name: kubernetes-dashboard
              kubernetes.io/service-account.uid: 04e3285e-0301-4a00-aceb-8d00c5935892

Type:  kubernetes.io/service-account-token

Data
====
token:      eyJhbGciOiJSUzI1NiIsImtpZCI6Ik01bUNGR0phMWt1Sml5cDNoSUdJUUhCVVVIZFBrZGpLaWVXYTFMbGkwYXMifQ.eyJpc3MiOiJrdWJlcm5ldGVzL3NlcnZpY2VhY2NvdW50Iiwia3ViZXJuZXRlcy5pby9zZXJ2aWNlYWNjb3VudC9uYW1lc3BhY2UiOiJrdWJlcm5ldGVzLWRhc2hib2FyZCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VjcmV0Lm5hbWUiOiJrdWJlcm5ldGVzLWRhc2hib2FyZC10b2tlbi05bXRxeiIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50Lm5hbWUiOiJrdWJlcm5ldGVzLWRhc2hib2FyZCIsImt1YmVybmV0ZXMuaW8vc2VydmljZWFjY291bnQvc2VydmljZS1hY2NvdW50LnVpZCI6IjA0ZTMyODVlLTAzMDEtNGEwMC1hY2ViLThkMDBjNTkzNTg5MiIsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlcm5ldGVzLWRhc2hib2FyZDprdWJlcm5ldGVzLWRhc2hib2FyZCJ9.UcQd4vkzU6Ra809ZeXFqnn1-AhbCF0SXOf2nkPTvJmXfkX7i5hpgM0BkqjIkugVpugamzkh-oecYekS5sIoMdOkvKd9-ONA2gG5j0TqxllnkTFt5XIq2xjgviSYwPDYugJfGA2Gz0EH7xY0st8CMC1aW028wy3UdZqjB39VIIpWbSp04w0ZVymUGw-ZDRy8Hoh-b4qdV4EXfGwhDfOp2S03VLcQP27r_isFSkESzGySJ4tvhBhOJJSu_GkDlkAOKa_9RgFlJVoVvQozsKRZfAWeRc0hnlaQKWY0wcbZJWWo2ljXVIQDGRm0owApjIaddTaaQBglsAieUS0oak5igVA
ca.crt:     1025 bytes
namespace:  20 bytes


```

## apply RBAC 

```
[centos@ip-172-31-36-148 day5]$ kubectl  apply  -f rolepower.yml  -n kubernetes-dashboard 
clusterrolebinding.rbac.authorization.k8s.io/admin-user created
[centos@ip-172-31-36-148 day5]$ cat  rolepower.yml 
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: admin-user
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: kubernetes-dashboard  #  name of service account 
  namespace: kubernetes-dashboard


```
