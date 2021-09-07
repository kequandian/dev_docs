## Linux shell 编程技巧


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
