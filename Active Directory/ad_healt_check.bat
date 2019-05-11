Dcdiag.exe /v >> D:\%COMPUTERNAME%_%RANDOM%_dcdiag.txt
Netsh dhcp show server >> D:\%COMPUTERNAME%_%RANDOM%_dhcp.txt
Repadmin /showreps >> D:\%COMPUTERNAME%_%RANDOM%_rep_partners.txt
repadmin /replsum /errorsonly >> D:\%COMPUTERNAME%_%RANDOM%_repadmin_err.txt
