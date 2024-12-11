follow the steps to run the playbook
====================================
prerequisites: ## ensure you have already created the ansible.cfg and hosts file and the yaml files

cd /home/ansibleadmin/ansible_config_files/db_build/non_prod/pre_prod/OTCHPPUS 

ansible-playbook --syntax-check /home/ansibleadmin/global_ansible_db_build_v2/db_build.yaml --extra-vars "@host_vars/vars.yml" --extra-vars "@host_vars/tnsnames.yml"

nohup ansible-playbook /home/ansibleadmin/global_ansible_db_build_v2/db_build.yaml --extra-vars "@host_vars/vars.yml" --extra-vars "@host_vars/tnsnames.yml" > log/db_build.log 2>1 &





to run only specific role
============================
e.g.
cd /home/ansibleadmin/ansible_config_files/db_build/non_prod/pre_prod/OTCHPPUK
ansible-playbook /home/ansibleadmin/global_ansible_db_build_v2/db_build.yaml --tags tns_update  --extra-vars "@host_vars/vars.yml" --extra-vars "@host_vars/pri_tnsnames.yml"

ansible-playbook /home/ansibleadmin/global_ansible_db_build_v2/db_build.yaml --tags pri_set_nls_iso_currency  --extra-vars "@host_vars/vars.yml" --extra-vars "@host_vars/pri_tnsnames.yml" --limit pre-prod


nohup ansible-playbook /home/ansibleadmin/global_ansible_db_build_v2/db_build.yaml --tags pri_change_db_domain,pri_tns_update,pri_post_db_build,pri_redo_update,pri_create_service,pri_set_nls_iso_currency  --extra-vars "@host_vars/vars.yml" --extra-vars "@host_vars/pri_tnsnames.yml" > log/db_build2.log 2>1 &
