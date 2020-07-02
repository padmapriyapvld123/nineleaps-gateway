FROM alpine/git as clone 
WORKDIR /app2
RUN git clone https://github.com/padmapriyapvld123/nineleaps-gateway.git

FROM maven:3.5-jdk-8-alpine as build
WORKDIR /app2
COPY --from=0 /app2/nineleaps-gateway /app2 
RUN mvn install

FROM openjdk:8-jre-alpine
WORKDIR /app2
COPY --from=1 /app2/target/apigateway.jar /app2
EXPOSE 8765
ENTRYPOINT ["sh", "-c"]

CMD ["java -jar apigateway.jar"]




