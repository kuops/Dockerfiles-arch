#!/usr/bin/env bash
java -jar -Xmx256m jmx_prometheus_httpserver-0.11.jar 5556 configs/httpserver_sample_config.yml
