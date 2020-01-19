# dat
							Daily Activity Tool
Gen Info:

This tool is a combination of Ansible/bash and python. The intention is to reduce daily activity workload for Linux sysadmins.
This tools worked on two ~/hosts file section - perf and random.

- perf : This section will be used for Health check section. The seperate section is being used since performance issues normally stayed longer than expected so you would not need to update servers frequently. 

- random: This section will be used for rest of the section/options. The random name taken since you may need to change this frequently.  

- For the time being reboot command is blocked from the ad-hoc command section.
- The Ansible would need sudo access on your dest servers so it would prompt for password before executing the playbooks.
- the sudo access to users [sudo section from user management] is being provided via /usr/local/bin/tempsudo script which would run via ansible on dest servers, so you need to make sure the script is already present in desire locationa.
- This tool use python's passlib module, please make sure it is installed in JS or from where you would run this tool.


To use this tool:

- After cloning DAT tool, please run pre-req.sh script which will copy hosts/ansible.cfg file in your home dir.
- Before you use this tool you need to update the ~/hosts file's server group section as per your env and need.
- Please don't modify the internal directory structure it may impact this tool functionality.
- once the obove done please run the ./dat.sh script and follow the instructions.

Remarks:
- Please use this tool carefully. The patching [RHEL/CentOS] section will reboot the server if kernel is updated.
- last but not the least, this tool may need some improvement and will be done as we move ahead based on the requirment/feedback.
- Please use it in single test server first and once you are confirtable and confident use as per your requirement :)

Regards
Deepak Kumar
