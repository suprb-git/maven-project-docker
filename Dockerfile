FROM tomcat:8
ADD **/*.war /usr/local/tomcat
EXPOSE 8080
CMD ["catalina.sh","run"]
