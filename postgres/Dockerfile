FROM postgres:12.9-bullseye
RUN apt-get update
RUN yes | apt-get install awscli 
COPY init_script.sh /docker-entrypoint-initdb.d/
