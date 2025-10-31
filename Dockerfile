FROM nginx:alpine

# Copy the HTML file to nginx default directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Add a custom nginx config for better logging
RUN echo 'server { \
    listen 80; \
    server_name localhost; \
    root /usr/share/nginx/html; \
    index index.html; \
    \
    access_log /var/log/nginx/access.log; \
    error_log /var/log/nginx/error.log; \
    \
    location / { \
        try_files $uri $uri/ =404; \
    } \
    \
    # Health check endpoint \
    location /health { \
        access_log off; \
        return 200 "healthy\\n"; \
        add_header Content-Type text/plain; \
    } \
}' > /etc/nginx/conf.d/default.conf

# Start nginx
CMD ["nginx", "-g", "daemon off;"]