# InnoDB Group Replication

Use this with InnoDB Group Replication, available since MySQL 5.7.

Requires that you have already loaded the InnoDB GR plugin so that the relevant tables in PERFORMANCE_SCHEMA have been created:
* replication_group_members
* replication_applier_status
* replication_group_member_stats
* replication_connection_status

This code will generate metric series beginning with:
`mysql_performance_schema_group_replication`