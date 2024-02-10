set verify   off
set feedback off
set termout  off
set lines 1000
set pagesize 1000
col owner form a25
col db_link form a40
col username form a65
col host form a85
col spoolname new_val spoolname
select 'DB_Links_'||instance_name||
	'_'||substr(host_name,0,decode((instr2(host_name,'.')),0,length(host_name)+1,(instr2(host_name,'.')))-1)||
	'.log' spoolname from v$instance;
spool &spoolname
SELECT owner, db_link, username, host FROM DBA_DB_LINKS;
spool off

