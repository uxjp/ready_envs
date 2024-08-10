# Spring-boot Simple Project - Maven

To run the project:  
```bash
mvn spring-boot:run
```


The stardard port of Spring Boot is `8080`. A curl request would look like:  

```bash
curl localhost:8080/hello
```

The Line with the port info looks like in the Server Log:  

```
2024-04-19T12:36:27.669-03:00  INFO 8800 --- [demo] [           main] o.s.b.w.embedded.tomcat.TomcatWebServer  : Tomcat initialized with port 8080 (http)
```
