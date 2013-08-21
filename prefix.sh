#!/bin/sh
#
# Simple script for setting table prefixes in SQL-dump

if [ $# != 2 ]; then
  cat >&2 << EOH
This is Drupal database prefixer.

Usage:
$0 prefix original_db.sql >prefixed_db.sql

- all tables will prefixed with 'prefix'
EOH

exit 1;
fi

PRFX=$1;
sed "s/CREATE TABLE \`/CREATE TABLE \`$PRFX/;
     s/DROP TABLE IF EXISTS \`/DROP TABLE IF EXISTS \`$PRFX/;
     s/LOCK TABLES \`/LOCK TABLES \`$PRFX/;
     s/INSERT INTO \`/INSERT INTO \`$PRFX/;
     s/REPLACE \`/REPLACE \`$PRFX/;
     s/ALTER TABLE \`/ALTER TABLE \`$PRFX/" $2
