### Steps for Demo-04 in your AWS EC2 instance with bash scripts
1. Create a bash script 05_run.sh that builds, runs and remove container and images based on ```Dockerfile2```. In the docker-file you'll find comments on how to script it.
2. Create a bash script 04_scp.sh that copies 05_run.sh to your EC2 instance 
3. Execute 04_scp.sh with your personal private ssh-key
4. Access your EC2 instance
5. Build, run and remove container by using 05_run.sh
6. Use only LF (instead of CRLF) in all scripts and docker-files.
