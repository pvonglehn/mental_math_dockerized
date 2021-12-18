#!/bin/bash
date=`date '+%Y%m%d%H'`
pg_dump -h postgres -p 5432 -U mental_maths_app  > backup_${date}.sql
aws s3 cp backup_${date}.sql s3://mental-maths-app-postgres-backup/backup_${date}.sql
aws s3 cp backup_${date}.sql s3://mental-maths-app-postgres-backup/mental_maths_app_latest.sql
