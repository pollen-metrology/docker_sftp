# docker_sftp

create the file docker-compose.yaml
mkdir config
mkdir config/keys
copy id_rsa_ftp.pub config/keys/id_rsa.pub
docker-compose up -d
docker exec -it dockersftp_sftp_1 /bin/bash
cat /home/platypus/.ssh/authorized_keys
