FROM flaccid/confd:latest as builder

MAINTAINER Chris Fordham <chris@fordham-nagy.id.au>

RUN apk add --update curl && \
    mkdir -p /etc/prometheus && \
    curl -Ssl https://raw.githubusercontent.com/prometheus/prometheus/master/documentation/examples/prometheus.yml > \
      /etc/prometheus/prometheus.yml

FROM flaccid/confd:latest

RUN apk add --update --no-cache curl

COPY --from=builder /etc/prometheus /etc/prometheus
COPY etc/confd /etc/confd

VOLUME /etc/prometheus

ENV PATH=/opt/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

WORKDIR /opt/bin

CMD ["--backend", "env"]
