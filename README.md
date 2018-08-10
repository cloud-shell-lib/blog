# hexo.sh


let path = 你想把博客放在哪里或者你的博客的路径

打开终端cd到path，执行下面这条命令下载并打开 `hexo.sh` 脚本

```bash
curl -O 'https://raw.githubusercontent.com/xaoxuu/hexo.sh/master/hexo.sh' && . hexo.sh
```


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

i. 配置环境、初始化、安装主题。
h. hexo help
--------------------------------------------------
请选择操作: 
```

```
================= Hexo Utilities =================
1. 安装hexo (npm install hexo-cli -g)
2. 创建博客 (hexo init blog, npm install, hexo s)
3. 安装依赖包 (npm install)
4. 安装并应用 Material-X 主题

0. 返回上一层
--------------------------------------------------
请选择操作: 
```

## 例如

- 如果进行了某些修改需要重启server，就输入 `cs`
- 需要clean再重新generate，就输入 `cg`
- 需要clean在重新generate，然后deploy，那么就输入 `cgd`
