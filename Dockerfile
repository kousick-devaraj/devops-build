FROM nginx:alpine
# Copy the pre-built application to Nginx's serving directory
COPY build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
