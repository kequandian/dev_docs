## Linux shell 编程技巧

#### 移除文件后缀[反向匹配]
```
fileName=junit-4.12.jar.test.jar
name=${fileName%.jar}
echo $name
#junit-4.12.jar.test
```

#### 移除字符串尾部[正向匹配]
```
fileName=junit-4.12.jar.test.jar
name=${fileName%%.jar*}
echo $name
#junit-4.12
```

### 移除字符串首部
```
fileName=junit-4.12.jar.test.jar
name=${fileName#*.jar}
echo $name
#.test.jar

fileName=junit-4.12.jar.test.jar
name=${fileName##*.test}
echo $name
#.jar
```

### 移除字符换行符
```
cls=$(echo com/jfeat/product/service/PostageService.class)
cls=${cls%[\n\r]*}
echo $cls
```

### `Hash`用法
```shell
declare -A map
map[Sunday]='星期天'
map[Monday]='星期一'

for key in ${!map[@]};do
   value=${map[$key]}
   echo $key, $value
done

for it in ${map[@]};do
  echo $it
done
```

### usage 标准用法
```
usage(){
	cat <<- EOF
	
	Usage: dependency Options [Variables...]
	e.g. dependency -p ./lib/test.jar
	
  Options:
	  -c, --compare </path/to/module1> </path/to/module2> 对比两个Maven module or Jar依赖情况
  EOF
	exit
}
```

