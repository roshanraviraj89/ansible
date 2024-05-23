set verify   off
set feedback off
set termout  off
set  pages 200
col what format A100
col log_user format A25
col priv_user format A25
col schema_user format A25
set lines 250
col spoolname new_val spoolname
select 'Scheduled_Jobs_'||instance_name||
	'_'||substr(host_name,0,decode((instr2(host_name,'.')),0,length(host_name)+1,(instr2(host_name,'.')))-1)||
	'.log' spoolname from v$instance;
spool &spoolname
select job, what, log_user, priv_user, schema_user, broken from dba_jobs;

col program_name format A40
col owner format A25
SELECT  owner, program_name, program_type, enabled
FROM dba_scheduler_programs
order by owner;

col job_name format A30
select owner, job_name, program_name, job_type, enabled, state, failure_count
from dba_scheduler_jobs
order by owner;

spool off
