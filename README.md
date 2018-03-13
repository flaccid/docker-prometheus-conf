# docker-prometheus-conf

:whale: A Docker image providing only Prometheus configuration statically or using confd

## Useful Tips

Update configuration one-time for rancher:

    $ /opt/bin/confd -onetime -backend rancher -prefix /2015-07-25

Then, reload Prometheus:

    $ curl -s -X POST prometheus:9090/-/reload
