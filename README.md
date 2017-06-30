# zbx-nfsiostat-sysstat
Zabbix Basic template for NFS  -  nfsiostat-sysstat

zbx-nfsiostat-sysstat is basic Zabbix LLD template use to display  sysstat nfsiostat 

* mount-nfs-discovery.sh - Get nfs mouunt point 
* nfsiostat-check.sh - Zabbix LLD script 
* userparameter_unixdev_nfs_io_stat.conf - Zabbix user parameter file
* zbx_template_nfsiostat_sysstat.xml - Zabbix Template  

Base from : jizhang iostat script - https://github.com/jizhang/zabbix-templates

It's not complete but work for me. :) 

![Sample Graph](zbx-nfsiostat-sysstat/image/zabbix-nfs-io-stat-sysstat-graph.png)
