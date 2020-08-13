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
