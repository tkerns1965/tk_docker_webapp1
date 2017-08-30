FROM nginx:1.13.3

RUN rm /etc/nginx/nginx.conf && \
    rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/
COPY webapp.conf /etc/nginx/conf.d/
