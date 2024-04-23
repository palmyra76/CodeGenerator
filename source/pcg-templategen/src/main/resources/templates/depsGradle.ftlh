def versions = [ spring_boot: '3.2.1',spring:'6.1.2',
    HikariCP:'5.0.1',log4j2:'2.22.0',
    persistence_api:'3.1.0',servlet_api:'5.0.0', 
    jackson:'2.15.2', slf4j:"2.0.9", jetty:'11.0.16',
    lombok:'1.18.30', jdbc_mariadb:'3.2.0',sqlstore:'0.1.0']

def palmyra = [
    spring:"com.palmyralabs.palmyra:palmyra-spring:0.1.0",
    standard:"com.palmyralabs.palmyra.core:palmyra-standard:0.1.0",
    store : [
        schema:"com.palmyralabs.sqlstore:sqlstore-schema:${r"${versions.sqlstore}"}",
        base:"com.palmyralabs.sqlstore:sqlstore-base:${r"${versions.sqlstore}"}",
        core:"com.palmyralabs.sqlstore:sqlstore-core:${r"${versions.sqlstore}"}",
        dao:"com.palmyralabs.sqlstore:sqlstore-dao:${r"${versions.sqlstore}"}"
    ],
    extn : [
        pwdmgmt:"com.palmyralabs.palmyra.extn:palmyra-dbpwd-mgmt:0.1.0",
        aclmgmt:"com.palmyralabs.palmyra.extn:palmyra-dbacl-mgmt:0.1.0"
    ]
]

def spring = [
    jdbc : "org.springframework:spring-jdbc:${r"${versions.spring}"}",
    context : "org.springframework:spring-context:${r"${versions.spring}"}",
    core : "org.springframework:spring-core:${r"${versions.spring}"}",
    spring_tx : "org.springframework:spring-tx:${r"${versions.spring}"}",
    security_web: "org.springframework.security:spring-security-web:${r"${versions.spring_security}"}",
    context_support : "org.springframework:spring-context-support:${r"${versions.spring_security}"}"
]

def springboot = [    
    web:"org.springframework.boot:spring-boot-starter-web:${r"${versions.spring_boot}"}",
    jetty:"org.springframework.boot:spring-boot-starter-jetty:${r"${versions.spring_boot}"}",
    tomcat:"org.springframework.boot:spring-boot-starter-tomcat:${r"${versions.spring_boot}"}",
    jpa:"org.springframework.boot:spring-boot-starter-data-jpa:${r"${versions.spring_boot}"}",
    security:"org.springframework.boot:spring-boot-starter-security:${r"${versions.spring_boot}"}",
    test:"org.springframework.boot:spring-boot-starter-test:${r"${versions.spring_boot}"}"
]

def jackson = [
    annotations: "com.fasterxml.jackson.core:jackson-annotations:${r"${versions.jackson}"}",
    core: "com.fasterxml.jackson.core:jackson-core:${r"${versions.jackson}"}",
    databind: "com.fasterxml.jackson.core:jackson-databind:${r"${versions.jackson}"}", 
    jsr310: "com.fasterxml.jackson.datatype:jackson-datatype-jsr310:${r"${versions.jackson}"}"
]

def apache = [    
    log4j2:[ core:"org.apache.logging.log4j:log4j-core:${r"${versions.log4j2}"}",
        api:"org.apache.logging.log4j:log4j-api:${r"${versions.log4j2}"}",
        slf4j2 :"org.apache.logging.log4j:log4j-slf4j2-impl:${r"${versions.log4j2}"}"]
]

def jetty = [
    servlet: "org.eclipse.jetty:jetty-servlet:${r"${versions.jetty}"}",
    webapp : "org.eclipse.jetty:jetty-webapp:${r"${versions.jetty}"}",
    proxy: "org.eclipse.jetty:jetty-proxy:${r"${versions.jetty}"}",
    http2: "org.eclipse.jetty.http2:http2-server:${r"${versions.jetty}"}"
]

def org = [
    lombok : "org.projectlombok:lombok:${r"${versions.lombok}"}",
    slf4j: [ api:"org.slf4j:slf4j-api:${r"${versions.slf4j}"}"]
]

def jakarta = [
    servlet_api : "jakarta.servlet:jakarta.servlet-api:${r"${versions.servlet_api}"}", 
    persistence:"jakarta.persistence:jakarta.persistence-api:${r"${versions.persistence_api}"}", 
]

def jdbc = [mariadb:"org.mariadb.jdbc:mariadb-java-client:${r"${versions.jdbc_mariadb}"}",
    hikaricp : "com.zaxxer:HikariCP:${r"${versions.HikariCP}"}"
]

ext.deps = [ 'spring': spring, 'springboot':springboot, 'jackson': jackson, 'apache': apache,
    'jakarta' : jakarta, 'versions':versions,
    'jetty': jetty, 'org':org, 'jdbc':jdbc, "palmyra" : palmyra ]
    
    
    
    
    