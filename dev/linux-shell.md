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

### 移除字符换行符 (newline)
```
cls=$(echo com/jfeat/product/service/PostageService.class)
cls=${cls%$'\n'}
echo $cls

VAR=$'helloworld\n'
CLEANED=${VAR%$'\n'}
echo ${CLEANED}
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

### read space line into array
```
arr=($line)
arr=(`echo ${line}`);
# read
read -a arr <<< $line
IFS=' ' read -a arr <<< "$line"
eval "arr=($line)"
```

### convert multi lines to array
```
local array=(${lines})
```

### 列表
```
### declear -a list 
declare -a LIST=(bread milk eggs)
for ITEM in "${LIST[@]}" ; do
    echo $ITEM
done

if [ ${#LIST[@]} != 4 ]; then
    echo "What about the bacon?"
else
    echo "Let's go shopping!"
fi

### read list from a function
foo_list(){
    declare -a _list=(foo bar cat)
    echo ${_list[@]}
}
declare -a LIST=$(foo_list)
for line in ${LIST[@]};do
   echo $line
done

## append new item
LIST+=(bar)
# LIST=(${LIST[@]} "Fruit")
# LIST[${#LIST[@]}]="Python"

## LIST as function arg
ITER_LIST(){
   local _LIST=("$@")
   for ITEM in ${_LIST[@]};do
     echo $ITEM
   done
}
ITER_LIST ${LIST[@]}

## last arg
last_arg=${@: -1}

## remove last arg
args=($@)
unset "args[${#args[@]}-1]"
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

