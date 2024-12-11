cd /home/ansibleadmin/ansible_config_files/db_migration/prod/ADRW3PD 

ansible-playbook /home/ansibleadmin/global_ansible_xtts_rsync_noncdb_v3/final_incremental.yml --extra-vars "@mig_vars.yml" --tags post_mig_check
