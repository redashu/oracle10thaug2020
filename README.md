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



