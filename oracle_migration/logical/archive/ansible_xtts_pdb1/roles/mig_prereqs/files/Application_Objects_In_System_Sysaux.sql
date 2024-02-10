set verify   off
set feedback off
set termout  off
set  pages 200
set lines 200
col OWNER format a40
col SEGMENT_NAME format a60
col SEGMENT_TYPE format a60
col spoolname new_val spoolname
select 'Application_Objects_'||instance_name||
	'_'||substr(host_name,0,decode((instr2(host_name,'.')),0,length(host_name)+1,(instr2(host_name,'.')))-1)||
	'.log' spoolname from v$instance;
spool &spoolname
select owner, segment_name, segment_type, tablespace_name
from dba_segments
where tablespace_name in ('SYSTEM', 'SYSAUX')
and owner not in
   (select name from system.logstdby$skip_support where action=0) ;

spool off
