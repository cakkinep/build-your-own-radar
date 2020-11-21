FROM node:latest as source
WORKDIR /src/build-your-own-radar
COPY package.json ./
RUN npm install
COPY . ./
RUN npm run build

FROM nginx:latest 
WORKDIR /opt/build-your-own-radar
COPY --from=source /src/build-your-own-radar/dist .
# COPY default.template /etc/nginx/conf.d/default.conf
# COPY ./nginx.conf /etc/nginx/nginx.conf
#COPY ./default.template /etc/nginx/conf.d/default.conf


#RUN chown -R nginx:nginx /opt/build-your-own-radar && chmod -R 755 /opt/build-your-own-radar && \
#	chown -R nginx:nginx /var/cache/nginx &&\ 
#        chown -R nginx:nginx /var/log/nginx && \
#        chown -R nginx:nginx /etc/nginx/conf.d

#RUN touch /var/run/nginx.pid && \
#        chown -R nginx:nginx /var/run/nginx.pid
#USER nginx


CMD ["nginx", "-g", "daemon off;"]
