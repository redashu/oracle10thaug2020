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
