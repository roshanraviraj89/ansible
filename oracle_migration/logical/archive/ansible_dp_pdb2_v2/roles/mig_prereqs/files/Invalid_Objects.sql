set verify   off
set feedback off
set termout  off
set pages 1000
set lines 300
COLUMN object_name FORMAT A30
col owner format A30
col object_type format A30
col spoolname new_val spoolname
select 'invalid_objects_'||instance_name||
	'_'||substr(host_name,0,decode((instr2(host_name,'.')),0,length(host_name)+1,(instr2(host_name,'.')))-1)||
	'.log' spoolname from v$instance;
spool &spoolname
SELECT owner,
       object_type,
       object_name
FROM   dba_objects
WHERE  status = 'INVALID'
ORDER BY owner, object_type, object_name;
spool off
