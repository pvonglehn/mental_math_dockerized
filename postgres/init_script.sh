#!/bin/bash
aws s3 cp s3://mental-maths-app-postgres-backup/mental_maths_app_latest.sql ${PGDATA}/backup.sql 
psql -U mental_maths_app -d mental_maths_app < ${PGDATA}/backup.sql
