spring:
  jpa:
    show-sql: true
    hibernate:
      ddl-auto: validate
  datasource:
    url: jdbc:mariadb://<ipaddress>:3306/${projectName}
    username: 
    password: 
    driverClassName: org.mariadb.jdbc.Driver

server:
  port: 8080
  servlet:
    context-path: /api

palmyra:
  servlet:
    prefix-path: /palmyra