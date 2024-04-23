spring:
  jpa:
    show-sql: true
    hibernate:
      ddl-auto: validate
  datasource:
    url: ${url}/${projectName}
    username: ${userName}
    password: ${password}
    driverClassName: ${driverClassName}

server:
  port: 8080
  servlet:
    context-path: /api

palmyra:
  servlet:
    prefix-path: /${projectName}