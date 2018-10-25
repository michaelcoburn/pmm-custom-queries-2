# pmm-custom-queries
Code examples that work for PMM's Custom Queries functionality

PMM supports execution of SELECT queries against MySQL (and derivatives - Percona Server for MySQL, MariaDB, Amazon RDS MySQL & Aurora MySQL) and PostgreSQL (including Amazon RDS PostgreSQL & Aurora PostreSQL)

Requirements:
* PMM Server version 1.15 or newer
* mysql:metrics defined

How to Use
==========
Add the snippet to /usr/local/percona/pmm-client/queries-mysqld.yml

That's it!  PMM automatically sources that file every scrape interval which is currently the Low Resolution (LR) bucket which defaults to 60s.