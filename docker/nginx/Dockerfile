FROM nginx:1.21

# Copy Nginx configuration file
ARG APP_ENV=local
# Set TimeZone to Asia/Tokyo
ENV TZ Asia/Tokyo
RUN echo "${TZ}" > /etc/timezone \
   && dpkg-reconfigure -f noninteractive tzdata

COPY default.${APP_ENV}.conf /etc/nginx/conf.d/default.conf
COPY nginx.conf /etc/nginx/nginx.conf