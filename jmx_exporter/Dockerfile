FROM java:8-jre

COPY jmx_exporter/ /jmx_exporter

WORKDIR /jmx_exporter

EXPOSE 5556

CMD ["./run_sample_httpserver.sh"]
