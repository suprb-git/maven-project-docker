FROM tomcat:8
ADD /var/lib/jenkins/workspace/new-docker-project/webapp/target/*.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh","run"]
