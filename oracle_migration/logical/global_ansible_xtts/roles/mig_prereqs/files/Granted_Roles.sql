set verify   off
set feedback off
set termout  off
col granted_role format A30
col grantee format A30
col spoolname new_val spoolname
select 'granted_roles_'||instance_name||
	'_'||substr(host_name,0,decode((instr2(host_name,'.')),0,length(host_name)+1,(instr2(host_name,'.')))-1)||
	'.log' spoolname from v$instance;
spool &spoolname
select granted_role, grantee from dba_role_privs;
spool off

