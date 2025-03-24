FROM maven AS Stage1
COPY ./src /usr/src/app/src
COPY pom.xml /usr/src/app
RUN mvn -f /usr/src/app/pom.xml clean package


FROM tomcat 
RUN rm -fr /usr/local/tomcat/webapps/ROOT
COPY --from=Stage1 /usr/src/app/target/testapp1.war /usr/local/tomcat/webapps/ROOT.war