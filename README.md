# blog

> Build your hexo blog swiftly and gently.

## blog脚本有什么用？

自动化执行一系列命令，节省时间。

例如，`cs`相当于：
```sh
hexo clean
hexo s
```

`cgd`相当于：
```sh
hexo clean
hexo g
hexo d
git add --all
git commit -am "update all"
git push origin
```



## 那么，如何迅捷而优雅地使用blog脚本？

### 下载脚本

打开终端，输入并执行这一行命令即可：

```sh
curl -s https://sh.xaox.cc/install | sh -s blog
```

如需安装指定版本，在后面加上版本号即可：

```sh
curl -s https://sh.xaox.cc/install | sh -s blog 3.0.0
```

当你在终端输入 `blog` 看到类似如下的内容，就说明已经下载好并打开脚本了：

```
> blog: 3.0.0
> docs: https://xaoxuu.com/wiki/cloud-shell/blog/
```



### 打开脚本

在终端输入如下 `blog` 即可打开脚本菜单。

也可以后面直接带参数，例如 `blog cs` 就相当于打开脚本菜单然后输入 `cs`。



### 使用脚本

在终端输入 `blog help` 即可查看脚本所有支持的指令。

这是2.0版本中的所有命令，以脚本中的帮助信息为准。

```
常用:
  c (clean) 	 执行 hexo clean 
  s (server) 	 执行 hexo server 
  g (generate) 	 执行 hexo generate 
  d (deploy) 	 执行 hexo deploy 
  cs  		 执行 c, s 的组合 
  cg  		 执行 c, g 的组合 
  cgd  		 执行 c, g, d 的组合，然后提交代码 

安装:
  i node  	 安装node.js环境 
  i hexo  	 安装hexo环境(npm install hexo-cli -g) 
  i blog  	 搭建博客(hexo init, npm install) 
  i dep  	 安装依赖包(npm install) 
  i volantis  	 下载并应用「Volantis」主题 
  i stellar  	 下载并应用「Stellar」主题 
  i xxx  	 下载并应用「xxx」主题 

自动:
  init 		 自动检查并安装所有需要的环境，然后搭建并启动博客。👍🏼 
  vut 		 下载并运行「Volantis」主题的单元测试。 

脚本:
  cd + `path` 	 选择路径 
  docs  	 查看文档(https://xaoxuu.com/wiki/cloud-shell/blog/) 
  gh (github) 	 GitHub页面(https://github.com/cloud-shell-lib/blog) 
  u (update) 	 更新脚本文件(当前版本：3.0.0) 
```



### 使用脚本快速搭建博客 👍🏼

let `path` = 你想把博客放在哪里，打开终端 **cd到 `path`** 。

在终端输入 **`blog init`** 自动检查并安装所有需要的环境，然后搭建并启动博客 。

> 注意：安装 node.js 或者 hexo 的时候需要输入一次**本机密码**，别忘了哦。
>
> 搭建博客的时候你需要输入**博客名**，其他时间就可以坐和放宽了。
