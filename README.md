# hexo.sh

> Build your hexo blog swiftly and gently.



## hexo.sh有什么用？

自动化执行一系列命令，节省时间。

例如，`cs`相当于：
```bash
hexo clean
hexo s
```

`cgd`相当于：
```bash
hexo clean
hexo g
hexo d
git add --all
git commit -am "update all"
git push origin
```



## 那么，如何迅捷而优雅地使用hexo.sh？

### 下载脚本

打开终端，输入并执行这一行命令即可：

```bash
curl -O 'https://raw.githubusercontent.com/xaoxuu/hexo.sh/master/hexo.sh' -# && chmod 777 hexo.sh && . hexo.sh -i
```

当你在终端看到类似如下的内容，就说明已经下载好并打开脚本了：

```
==================== Hexo Utilities ====================
常用:
  c (clean) 	 执行 hexo clean 
  s (server) 	 执行 hexo server 
  g (generate) 	 执行 hexo generate 
  d (deploy) 	 执行 hexo deploy 
  cs  		 执行 c, s 的组合 
  cg  		 执行 c, g 的组合 
  cgd  		 执行 c, g, d 的组合，然后提交代码 

更多: 
  u (update) 	 更新脚本文件(当前版本：2.0) 
  help 		 查看全部指令 
--------------------------------------------------------
请输入指令: 
```



### 打开脚本

在终端输入如下 `hexo.sh` 即可打开脚本菜单。

也可以后面直接带参数，例如 `hexo.sh cs` 就相当于打开脚本菜单然后输入 `cs`。



### 使用脚本

在终端输入 `hexo.sh help` 即可查看脚本所有支持的指令。

这是2.0版本中的所有命令，以脚本中的帮助信息为准。

```
常用:
  c (clean) 	 执行 hexo clean 
  s (server) 	 执行 hexo server 
  g (generate) 	 执行 hexo generate 
  d (deploy) 	 执行 hexo deploy 
  cs  		     执行 c, s 的组合 
  cg  		     执行 c, g 的组合 
  cgd  	    	 执行 c, g, d 的组合，然后提交代码 

安装:
  i (install) 	 用于安装的命令，下面是install命令的参数: 
  		         n (node)       安装node.js环境 
  		         h (hexo)       安装hexo环境(npm install hexo-cli -g) 
  		         b (blog)       搭建博客(hexo init, npm install) 
  		         d (dependency) 安装依赖包(npm install) 
  		         x (material-x) 下载并应用【Material-X】主题 

自动:
  init 		     自动检查并安装所有需要的环境，然后搭建并启动博客。👍🏼 
  xut 		     下载并运行【Material-X】主题的单元测试。 

脚本:
  cd + `path` 	 选择路径 
  docs  	     查看文档(https://xaoxuu.com/docs/hexo.sh) 
  gh (github) 	 GitHub页面(https://github.com/xaoxuu/hexo.sh) 
  u (update) 	 更新脚本文件(当前版本：2.0) 
```



### 使用脚本快速搭建博客 👍🏼 

let `path` = 你想把博客放在哪里，打开终端 **cd到 `path`** 。

在终端输入 **`hexo.sh init`** 自动检查并安装所有需要的环境，然后搭建并启动博客 。

> 注意：安装node.js或者hexo的时候需要输入一次**本机密码**，别忘了哦。
>
> 搭建博客的时候你需要输入**博客名**，其他时间就可以坐和放宽了。

