FROM postgres:latest

RUN apt-get update && apt-get -y install cron
RUN apt-get -y install awscli 

COPY cronjob_weekly /etc/cron.d/cronjob_weekly
COPY weekly_backup.sh /etc/cron.d/weekly_backup.sh
COPY cronjob_daily /etc/cron.d/cronjob_daily
COPY daily_backup.sh /etc/cron.d/daily_backup.sh
 
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/cronjob_weekly
RUN chmod u+x /etc/cron.d/weekly_backup.sh
RUN chmod 0644 /etc/cron.d/cronjob_daily
RUN chmod u+x /etc/cron.d/daily_backup.sh

# Apply cron job
RUN crontab /etc/cron.d/cronjob_weekly
RUN crontab /etc/cron.d/cronjob_daily
 
# Create the log file to be able to run tail
RUN touch /var/log/cron.log
 
# Run the command on container startup
CMD echo postgres:5432:${POSTGRES_USER}:${POSTGRES_DB}:${POSTGRES_PASSWORD} > ~/.pgpass \
    && chmod 600 ~/.pgpass \
    && mkdir -p ~/.aws \
    && echo "[default] \naws_access_key_id=${AWS_ACCESS_KEY_ID}\naws_secret_access_key=${AWS_SECRET_ACCESS_KEY}" \
        > ~/.aws/credentials \
    && chmod 600 ~/.aws/credentials \
    && cron && tail -f /var/log/cron.log
