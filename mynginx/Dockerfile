FROM nginx

RUN  { \
        echo "server {"; \
        echo "listen 80;"; \
        echo "    location / {"; \
        echo "    proxy_pass      http://localhost:5000/;"; \
        echo "    }"; \
        echo "}"; \
     } > /etc/nginx/conf.d/default.conf
