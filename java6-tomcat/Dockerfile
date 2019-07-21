FROM openjdk:6-jre

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH

RUN apt-get update &&\
    wget https://archive.apache.org/dist/tomcat/tomcat-6/v6.0.18/bin/apache-tomcat-6.0.18.tar.gz &&\
    tar xf apache-tomcat-6.0.18.tar.gz -C /usr/local/ &&\
    ln -sf /usr/local/apache-tomcat-6.0.18 /usr/local/tomcat &&\
    rm -f apache-tomcat-6.0.18.tar.gz &&\
    rm /usr/local/tomcat/bin/*.bat &&\
    rm -rf /var/lib/apt/lists/*

WORKDIR $CATALINA_HOME

EXPOSE 8080
CMD ["catalina.sh", "run"]
