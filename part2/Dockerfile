FROM ubuntu:22.04

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl -y ca-certificates&& \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY requests_script.sh /script/
RUN chmod +x /script/requests_script.sh

CMD ["/script/requests_script.sh"]