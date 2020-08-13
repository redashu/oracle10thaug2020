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



   
   
 
