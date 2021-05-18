## Get Resource File from resources

### `ResourceUtils.getFile()`

If your application happens to be Spring WebMVC or Spring Boot application then you may directly take advantage of ResourceUtils class.

#### Example 3: Java program to read a file from resources folder using ResourceUtils

```java
File file = ResourceUtils.getFile("classpath:config/sample.txt")
 
//File is found
System.out.println("File Found : " + file.exists());
 
//Read File Content
String content = new String(Files.readAllBytes(file.toPath()));
System.out.println(content);
```
