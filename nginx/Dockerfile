FROM nginx:1.14.0

ENV NGINX_VERSION     "1.14.0"
ENV NGINX_VTS_VERSION "0.1.18"

RUN echo "deb-src http://nginx.org/packages/debian/ stretch nginx" >> /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y dpkg-dev curl git \
  && mkdir -p /opt/rebuildnginx \
  && chmod 0777 /opt/rebuildnginx \
  && cd /opt/rebuildnginx \
  && su --preserve-environment -s /bin/bash -c "apt-get source nginx" _apt \
  && apt-get build-dep -y nginx=${NGINX_VERSION} \
  && cd /opt \
  && git clone https://github.com/openresty/echo-nginx-module.git \
  && git clone https://github.com/vozlt/nginx-module-vts.git \
  && git clone https://github.com/yaoweibin/ngx_http_substitutions_filter_module.git 

RUN sed -i -r -e "s@\./configure(.*)@\./configure\1 --add-module=/opt/nginx-module-vts --add-module=/opt/echo-nginx-module --add-module=/opt/ngx_http_substitutions_filter_module@" /opt/rebuildnginx/nginx-${NGINX_VERSION}/debian/rules \
  && cd /opt/rebuildnginx/nginx-${NGINX_VERSION} \
  && dpkg-buildpackage -b \
  && cd /opt/rebuildnginx \
  && dpkg --install nginx_${NGINX_VERSION}-1~stretch_amd64.deb \
  && apt-get remove --purge -y dpkg-dev curl && apt-get -y --purge autoremove && rm -rf /var/lib/apt/lists/* && rm -rf /opt/*

CMD ["nginx", "-g", "daemon off;"]
