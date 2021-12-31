#!/bin/bash
pg_dump -h postgres -p 5432 -U mental_maths_app  > backup_latest.sql 
aws s3 cp backup_latest.sql s3://mental-maths-app-postgres-backup/mental_maths_app_latest.sql
