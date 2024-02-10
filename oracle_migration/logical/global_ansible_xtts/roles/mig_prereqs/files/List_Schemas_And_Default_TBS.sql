set verify   off
set feedback off
set termout  off
set  pages 2000
set lines 500
col username form a40
col account_status form a40
col default_tablespaces form a65
col temporary_tablespace form a30
col profile format a30
col spoolname new_val spoolname
select 'Schemas_and_def_tablespace_'||instance_name||
	'_'||substr(host_name,0,decode((instr2(host_name,'.')),0,length(host_name)+1,(instr2(host_name,'.')))-1)||
	'.log' spoolname from v$instance;
spool &spoolname
select username, account_status, default_tablespace, TEMPORARY_TABLESPACE, profile from dba_users;
spool off
