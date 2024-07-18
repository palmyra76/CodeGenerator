spring:
  jpa:
    show-sql: true
    hibernate:
      ddl-auto: validate
  datasource:
    url: ${jdbcUrl}/${schemas}
    username: ${userName}
    password: 
    driverClassName: org.mariadb.jdbc.Driver

server:
  port: 8080
  servlet:
    context-path: /api

palmyra:
  servlet:
    prefix-path: /palmyra