FROM postgres:latest
RUN apt-get update
RUN yes | apt-get install awscli 
COPY init_script.sh /docker-entrypoint-initdb.d/
