# rootless-sudo
	免root权限执行sudo。
	
	原理：安装包安装的时候会有一次root授权，这里给系统安装systemctl服务，服务将持续用root权限运行。
	平台：Windows和Linux原理一致，这里先实现了linux平台。

## rlsudo

### 执行服务，端口默认18080

	执行方法为
	
	http://127.0.0.1:18080/tmp/myscript.sh
	
	把/tmp/myscript.sh换成自己的脚本绝对路径
	
	
### 测试编译
	```
	gcc rlsudo.c -o rlsudo
	```
	
## service
	权限代理服务，使rlsudo用root权限运行