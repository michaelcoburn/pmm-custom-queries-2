#!/bin/bash
DIR='/usr/local/percona/pmm2/collectors/textfile-collector/high-resolution'
FILE='proxysql_query_cache_digests.prom'
DEST="${DIR}/$FILE"

for i in $(seq 1 59); do
        # Clear old values
        rm -rf $DEST
        touch $DEST

        while read hostgroup schemaname username digest digested_text count_star sum_time min_time max_time sum_rows_affected sum_rows_sent ;do
                # Count of queries by digest
                echo "proxysql_query_digest_query_count{hostgroup=\"$hostgroup\",schemaname=\"$schemaname\",username=\"$username\",digest=\"$digest\",digested_text=\"$digested_text\"} $count_star" >> $DEST
                # Total time query has run
                echo "proxysql_query_digest_query_time_sum{hostgroup=\"$hostgroup\",schemaname=\"$schemaname\",username=\"$username\",digest=\"$digest\",digested_text=\"$digested_text\"} $sum_time" >> $DEST
                # Minimum time the query has run
                echo "proxysql_query_digest_query_time_min{hostgroup=\"$hostgroup\",schemaname=\"$schemaname\",username=\"$username\",digest=\"$digest\",digested_text=\"$digested_text\"} $min_time" >> $DEST
                # Maximum time the query has run
                echo "proxysql_query_digest_query_time_max{hostgroup=\"$hostgroup\",schemaname=\"$schemaname\",username=\"$username\",digest=\"$digest\",digested_text=\"$digested_text\"} $max_time" >> $DEST
                # Total number of rows affected
                echo "proxysql_query_digest_rows_affected_sum{hostgroup=\"$hostgroup\",schemaname=\"$schemaname\",username=\"$username\",digest=\"$digest\",digested_text=\"$digested_text\"} $sum_rows_affected" >> $DEST
                # Total number of rows sent
                echo "proxysql_query_digest_rows_sent_sum{hostgroup=\"$hostgroup\",schemaname=\"$schemaname\",username=\"$username\",digest=\"$digest\",digested_text=\"$digested_text\"} $sum_rows_sent" >> $DEST

        done < <(echo "SELECT hostgroup,schemaname,username,digest,SUBSTR(digest_text,1,5) as digested_text,count_star,sum_time,min_time,max_time,sum_rows_affected,sum_rows_sent from stats_mysql_query_digest;" | mysql -uadmin –padmin -P6032 -h127.1 --batch --silent)
        sleep 1
done