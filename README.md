# hexo.sh


let `path` = 你想把博客放在哪里或者你的博客的路径，打开终端 **cd到 `path`** 。

👉 执行下面这条命令 **下载并打开 `hexo.sh` 脚本**

```bash
curl -O 'https://raw.githubusercontent.com/xaoxuu/hexo.sh/master/hexo.sh' && chmod 777 hexo.sh && . hexo.sh
```

#### 或者

👉 如果你已经有博客了，可以执行这段命令 **尝试 `Material-X` 主题**

```bash
curl -O 'https://raw.githubusercontent.com/xaoxuu/hexo.sh/master/hexo.sh' && chmod 777 hexo.sh && . hexo.sh i x
```

#### 或者

👉 如果你还没有搭建博客环境，可以执行这段命令 **配置环境并搭建 `Material-X` 主题的博客**

```bash
curl -O 'https://raw.githubusercontent.com/xaoxuu/hexo.sh/master/hexo.sh' && chmod 777 hexo.sh && . hexo.sh i nhbx
```

> 注意：安装node.js的时候需要输入**本机密码**，别忘了哦。
>
> 搭建博客的时候你需要输入**博客名**，其他时间就可以坐和放宽了。

## 脚本的功能


- 对于需要频繁修改主题然后clean，重新server或者generate的人来说，能够简化操作。
- 对于新手来说，这个脚本可以让你快速上手hexo博客。

```
================= Hexo Utilities =================
c. hexo clean
g. hexo generate
s. hexo server
d. hexo deploy
cs. hexo clean, hexo server
cg. hexo clean, hexo generate
cgd. hexo clean, hexo generate, hexo deploy

i. 搭建环境、初始化、安装主题、安装依赖包(i i)……
h. hexo help
u. 更新脚本
0. 结束
--------------------------------------------------
请选择操作: 
```

```
================= Hexo Utilities =================
n. 安装node.js
h. 安装hexo (npm install hexo-cli -g)

b. 创建博客 (hexo init blog, npm install, hexo s)
x. 安装并应用 Material-X 主题【强烈推荐】

i. 安装依赖包 (npm install)

0. 返回上一层
--------------------------------------------------
请选择操作: 
```

## 例如

- 如果进行了某些修改需要重启server，就输入 `cs`

- 需要clean再重新generate，就输入 `cg`

- 需要clean在重新generate，然后deploy，那么就输入 `cgd`

  
