# EVE-NG
Eve-NG is a new generation software for networking lab. This is the first clientless lab platform

EVE-NG Qemu – Modify base images and commit script with user input.
================================================================================
Trying to commit content of an instant to be the source images generates an error. Committing the changes as baseline is pretty useful in setting up preconfigured source images for nodes in the lab example Windows AD, Cisco ISE and Firewall other appliances. These takes time to reconfigure if it they are wiped.

Sample Executing commit
root@eve-ng:/opt/unetlab/tmp/0/1989ae22-36da-4e64-8d3b-0f7a4f1557d5/1# /opt/qemu/bin/qemu-img commit virtioa.qcow2
Co-routine re-entered recursively
Aborted

1.git clone the script to EVE-NG machine.

2.Execute the Script

3.sh commit.sh

4.Enter POID

5.Enter USERID

6.Enter LAB ID.

Here you go !

Please visit: http://youtube.com/f451ly2k
