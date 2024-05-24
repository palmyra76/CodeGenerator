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
    implementation deps.palmyra.spring
    implementation deps.palmyra.commons
    
    implementation deps.palmyra.extn.pwdmgmt
    implementation deps.palmyra.extn.aclmgmt
    
    implementation deps.org.lombok 
    implementation deps.springboot.web
    implementation deps.springboot.jpa
    implementation deps.spring.core
    implementation deps.jackson.jsr310
    implementation deps.springboot.security
    
    compileOnly deps.org.lombok
    annotationProcessor deps.org.lombok
    
    implementation 'org.apache.tika:tika-core:2.9.2'    
    
    runtimeOnly 'org.mariadb.jdbc:mariadb-java-client:3.2.0'    
    implementation deps.org.slf4j.api    
    
    implementation 'org.modelmapper:modelmapper:3.1.1'    
    testImplementation 'org.springframework.boot:spring-boot-starter-test'  
}

tasks.named('test') {
    useJUnitPlatform()
}

application {
    mainClass = '${packageName}.AppMain'
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