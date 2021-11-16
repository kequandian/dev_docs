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

### 获取文件后缀
```
fileName=junit-4.12.jar
name=${fileName##*.}
echo $name
#.jar
```

### 移除文件后缀
```
fileName=junit-4.12.jar
name=${fileName%%.jar}
echo $name
#junit-4.12
```

### 替换字符
```
var="12345678abc"
replace="test"
echo ${var//12345678/$replace}
# testabc

args=$@
var=/path/to/jdk.jar
basevar=$(basename $var)
echo ${args//$var/$basevar}
```

### 移除字符换行符
```
cls=$(echo com/jfeat/product/service/PostageService.class)
cls=${cls%[\n\r]*}
echo $cls
```

### 首字母
firstletter=${jar::1}  ##first letter
if [[ $firstletter = '/' ]];then 
   echo first letter: $firstletter
fi

### match
```
[[ $date =~ ^[0-9]{8}$ ]] && echo "yes"
```

### 列表
```
my_array=(foo "cat" "dog" "mouse" "frog)
echo ${my_array[@]}
echo ${my_array[*]}

for str in ${myArray[@]}; do
  echo $str
done

for i in "${my_array[*]}"; do 
  echo "$i"
done

## append new item
my_array+=(bar)
my_array=(${my_array[@]} "Fruit")
my_array[${#my_array[@]}]="Python"
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


### 文件内空替换
```shell
sed -i "s/window.ZEle.endpoint[[:space:]]*=[[:space:]]*'http:\/\/[a-z0-9\.]*:[0-9]*/window.ZEle.endpoint = $endpoint/" $dist_root/config.js
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

