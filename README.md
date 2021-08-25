# zbx-nfsiostat fork
Zabbix Basic template for version above 2.0 for NFS  -  nfsiostat

zbx-nfsiostat is basic Zabbix template uses LLD scripts for discover nfs shares and add it to monitoring with nfsiostat script 

It uses nfsiostat instead nfsiostat-sysstat like in master branch

Also it doesn't use active checks for get metrics.

* mount-nfs-discovery.sh - Get nfs mouunt point 
* nfsiostat-check.sh - Zabbix LLD script 
* userparameter_unixdev_nfs_io_stat.conf - Zabbix user parameter file
* zbx_template_nfsiostat_2.0.xml - Zabbix Template  

## Usage 
1. copy  mount-nfs-discovery.sh  nfsiostat-check.sh to /usr/local/bin on target host. You may use ansible playbook for this which is attached here.
2. copy userparameter_unixdev_nfs_io_stat.conf to /etc/zabbix/zabbix_clientd.d/ on target host. Yet another task may be competed with playbook.
3. Import Zabbix template ```zbx_tempalte_nfsiostat_sysstat_2.0.xml``` to zabbix  
4. reload zabbix-agent service. This step also may be completed with playbook.  

Works fine on Zabbix 2.4.6, but I didn't test this yet on above versions, sry.
