# ProxySQL Query Cache Digests

This script captures ProxySQL 2 query digest information and exposes them as a metric series to be scraped via textfile collector.

It assumes you have enabled one or more queries to be cached (ttl duration does not matter).

To use
------

Copy the file proxysql_query_cache_digests.sh into your /etc/cron.d directory

The script will run every 1s, and write to the high resolution directory.

Then you will want to pair this with the ProxySQL Query Cache Digests dashboard:

https://github.com/michaelcoburn/grafana-dashboards/tree/proxysql-query-cache-digests