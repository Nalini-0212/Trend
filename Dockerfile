FROM nginx:alpine3.23
COPY /dist/ /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]

