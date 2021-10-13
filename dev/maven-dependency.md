#### download artifact 
> [dependency:copy](https://maven.apache.org/plugins/maven-dependency-plugin/copy-mojo.html)

```
mvn org.apache.maven.plugins:maven-dependency-plugin:3.1.2:copy \
 -Dartifact="com.jfeat:jar-dependency-api:1.0.0" -DoutputDirectory=tmp
```
or
```
mvn dependency:copy -Dartifact="com.jfeat:jar-dependency-api:1.0.0" -DoutputDirectory=tmp
```
