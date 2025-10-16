# use a lightweight Node.js image 
FROM httpd:2.4
COPY . /usr/local/apache2/htdocs


# Expose Port 3000
EXPOSE 80
CMD ["httpd-foreground"]
