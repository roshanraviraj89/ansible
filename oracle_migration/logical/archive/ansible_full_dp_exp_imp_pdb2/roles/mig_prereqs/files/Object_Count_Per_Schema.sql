set verify   off
set feedback off
set termout  off
set lines 333 pages 10000
col OWNER for a30
col OBJECT_TYPE for a21
col spoolname new_val spoolname
select 'object_countsByType_'||instance_name||
	'_'||substr(host_name,0,decode((instr2(host_name,'.')),0,length(host_name)+1,(instr2(host_name,'.')))-1)||
	'.log' spoolname from v$instance;
spool &spoolname
select owner,object_type,count(*)
from dba_objects 
group by owner,object_type order by owner,object_type;
spool off
exit;