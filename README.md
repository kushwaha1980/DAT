# dat
Daily activity tool
This tool is a combination of Ansible/bash and python. The intention is to reduce daily activity workload for sysadmins.
This tools worked on two ~/hosts file section - perf and random.
- perf : This section will be used for Health check section. The seperate section is picked due to performance issues normally stayed longer than expected so you would not need to change this frequently. 
- random: This section will be used for rest of the section/options. The random name taken since you may need to change this frequently.  

To use this tool:
- After cloning this repo, please run pre-req.sh script which will set hosts/ansible.cfg file in your home dir.
- update the hosts file's section as per your env and need.
- The DAT folder should be reside in your home dir, Ex: ~/DAT
- once the obove done please run the ./dat.sh script and follow the instructions.

Note: 
- For the time being reboot command is blocked from the ad-hoc command section.
- The Ansible would need sudo access on your dest servers so it would prompt for password before executing the playbooks.
- the sudo access is being provide via tempsudo script which would run via ansible on dest servers, so you need to make sure the script is already present.

- last but not the least, this tool may need some improvement and will be done as we move ahead based on the requirment/feedback.
- Please use it in single test server first and once you are confirtable and confident use as per your requirement :)

Regards
