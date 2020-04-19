EVE-NG
Eve-NG is a new generation software for networking lab. 
This is the first clientless lab platform EVE-NG.
Here am adding  the bash script to Modify Qemu base images and commit script with user input.

You can run this script in eve-ng machine to create pre configured source images.

Committing is the operation that changes  baseline is pretty useful in setting up preconfigured source images for nodes in the lab example Windows AD, Cisco ISE and Firewall other appliances.

These takes time to reconfigure if it they are wiped. so you can do the config and commit it to setting up preconfigured sourec images.


1.git clone the script to EVE-NG machine.
`git clone https://github.com/f451ly2k/EVE-NG`

2.Execute the Script
`chmod +x commit.sh && ./commit.sh`

3.Collect POD | LAB ID | NOD ID 

Collect POD:
![](https://raw.githubusercontent.com/f451ly2k/EVE-NG/master/pod.gif)

Collect LABID
![](https://raw.githubusercontent.com/f451ly2k/EVE-NG/master/labid.gif)

Collect NOD ID
![](https://raw.githubusercontent.com/f451ly2k/EVE-NG/master/nodid.gif)



NOTE: 
In certain scenario when executing commmit operation are getting aborted, in such scenario  you can  run the below command: 
`chmod +x commitforce.sh && ./commitforce.sh`

sample error commit :
root@eve-ng:/opt/unetlab/tmp/0/1989ae22-36da-4e64-8d3b-0f7a4f1557d5/1# /opt/qemu/bin/qemu-img commit virtioa.qcow2 Co-routine re-entered recursively Aborted



4.Thats it, Happy LABING.

![](https://raw.githubusercontent.com/f451ly2k/EVE-NG/master/capture.gif)

Here you go !

Please visit: http://youtube.com/f451ly2k
