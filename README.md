# pmm-custom-queries
Code examples that work for PMM's Custom Queries functionality

PMM supports execution of SELECT queries against MySQL (and derivatives - Percona Server for MySQL, MariaDB, Amazon RDS MySQL & Aurora MySQL) and PostgreSQL (including Amazon RDS PostgreSQL & Aurora PostreSQL).  You can also run shell scripts that output metric series.

Requirements:
* PMM Server version 1.15 or newer
* A working mysql service to use queries-mysqld.yml
* A working pmm-admin config to use the textfile collector scripts


How to Use
==========
Add the queries-mysqld.yml snippet to the appropriate resolution directory, for example:

/usr/local/percona/pmm2/collectors/custom-queries/mysql/high-resolution/

For scripts, you can put them in /etc/cron.d or set them up on your own schedule.  They will then write out to resolution directory, for example:

/usr/local/percona/pmm2/collectors/textfile-collector/high-resolution