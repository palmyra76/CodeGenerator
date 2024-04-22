plugins {
    id 'java'
    id 'application'
    id 'org.springframework.boot' version '3.2.1'
    id 'io.spring.dependency-management' version '1.1.4'
}

apply from: './deps.gradle'

group = '${group}'
version = '0.0.1-SNAPSHOT'

java {
    sourceCompatibility = '17'
}

repositories {
    mavenLocal()
    mavenCentral()
}

dependencies {
    implementation 'org.springframework.boot:spring-boot-starter'
    implementation 'com.palmyralabs.palmyra:palmyra-spring:0.1.0'
    implementation 'com.palmyralabs.sqlstore:palmyra-commons:0.1.0'
    implementation 'com.fasterxml.jackson.datatype:jackson-datatype-jsr310'
    implementation 'org.springframework.boot:spring-boot-starter:3.2.1'
    implementation 'org.springframework.boot:spring-boot-starter-data-jpa:3.2.2'
    implementation 'org.springframework.boot:spring-boot-starter-web'
	implementation 'org.springframework.boot:spring-boot-starter-oauth2-client'
	implementation 'org.springframework.boot:spring-boot-starter-security'
	implementation 'org.apache.commons:commons-lang3:3.12.0'
	implementation 'org.springdoc:springdoc-openapi-starter-webmvc-ui:2.1.0'
	implementation 'org.modelmapper:modelmapper:3.1.1'
    
    implementation deps.palmyra.extn.pwdmgmt 
    implementation deps.springboot.web
    implementation deps.springboot.jpa
    implementation deps.spring.core
    implementation deps.jackson.jsr310
    implementation deps.springboot.security
    implementation deps.org.slf4j.api
    
    testImplementation 'org.springframework.boot:spring-boot-starter-test' 
    
    compileOnly deps.org.lombok
    annotationProcessor deps.org.lombok
    runtimeOnly 'org.mariadb.jdbc:mariadb-java-client:3.2.0'   
}

tasks.named('test') {
    useJUnitPlatform()
}

application {
    mainClass = '${packageName}.${convertedProjectName}Application'
}

configurations {
    compileOnly {
        extendsFrom annotationProcessor
    }
}

distZip {
   exclude('**/*.yaml')
   exclude('**/*.xml')
}

jar {
   exclude('**/*.yaml')
   exclude('**/*.xml')
}


distributions {
    main {        
        contents {            
            from 'src/main/resources'
        }
    }
}

installDist {
    into ('../dist')
}

applicationDistribution.with {
    include 'application.yaml'
}