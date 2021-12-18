FROM postgres:latest

RUN apt-get update && apt-get -y install cron
RUN apt-get -y install awscli 

# Copy hello-cron file to the cron.d directory
COPY my_cronjob /etc/cron.d/my_cronjob
COPY backup_script.sh /etc/cron.d/backup_script.sh
 
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/my_cronjob
RUN chmod u+x /etc/cron.d/backup_script.sh

# Apply cron job
RUN crontab /etc/cron.d/my_cronjob
 
# Create the log file to be able to run tail
RUN touch /var/log/cron.log
 
# Run the command on container startup
CMD echo postgres:5432:${POSTGRES_USER}:${POSTGRES_DB}:${POSTGRES_PASSWORD} > ~/.pgpass \
    && chmod 600 ~/.pgpass \
    && mkdir ~/.aws \
    && echo "[default] \naws_access_key_id=${AWS_ACCESS_KEY_ID}\naws_secret_access_key=${AWS_SECRET_ACCESS_KEY}" \
        > ~/.aws/credentials \
    && chmod 600 ~/.aws/credentials \
    && cron && tail -f /var/log/cron.log
