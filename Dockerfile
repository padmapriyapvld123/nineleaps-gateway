From openjdk:8
copy ./target/apigateway.jar apigateway.jar
CMD ["java","-jar","apigateway.jar"]
EXPOSE 8765

