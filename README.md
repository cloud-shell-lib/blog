# hexo.sh

> Build your hexo blog swiftly and gently.

## hexo.sh有什么用？

- 节省时间，省下来的时间都是你的，你可以用来做更有意义的事情。

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

ABC三种场景，请对号入座。

### A. 我想下载并开始使用hexo.sh

let `path` = 你想把博客放在哪里或者你的博客的路径，打开终端 **cd到 `path`** 。

执行下面这条命令 **下载并打开 `hexo.sh` 脚本**

```bash
curl -O 'https://raw.githubusercontent.com/xaoxuu/hexo.sh/master/hexo.sh' -# && chmod 777 hexo.sh && . hexo.sh
```

### B. 我想下载hexo.sh并尝试新全新的博客主题

如果你已经有博客了，可以执行这段命令 **尝试 `Material-X` 主题**

```bash
curl -O 'https://raw.githubusercontent.com/xaoxuu/hexo.sh/master/hexo.sh' -# && chmod 777 hexo.sh && . hexo.sh m x
```

### C. 我想下载hexo.sh并一键搭建hexo博客

如果你还没有搭建博客环境，可以执行这段命令 **配置环境并搭建 `Material-X` 主题的博客**

```bash
curl -O 'https://raw.githubusercontent.com/xaoxuu/hexo.sh/master/hexo.sh' -# && chmod 777 hexo.sh && . hexo.sh m nhbx
```

> 注意：安装node.js的时候需要输入**本机密码**，别忘了哦。
>
> 搭建博客的时候你需要输入**博客名**，其他时间就可以坐和放宽了。


## 脚本预览

```
==================== Hexo Utilities ====================
单个指令:
  c     hexo clean
  g     hexo generate
  s     hexo server
  d     hexo deploy

组合指令:
  cs    hexo clean, hexo server
  cg    hexo clean, hexo generate
  cgd   hexo clean, hexo generate, hexo deploy

脚本菜单:
  m     更多（搭建环境、创建博客、安装主题、安装依赖包）
  u     更新脚本
  .     结束脚本
--------------------------------------------------------
```

```
=================== Hexo Utilities ===================
搭建环境:
  n     安装node.js
  h     安装hexo (npm install hexo-cli -g)

创建博客:
  b     创建博客 (hexo init blog, npm install, hexo s)
  x     安装并应用【Material-X】主题【强烈推荐】

安装依赖:
  i     安装依赖包 (npm install)

小白套餐:
  hbx   安装hexo 并搭建【Material-X】主题博客
  nhbx  安装node.js、hexo并搭建【Material-X】主题博客

脚本菜单:
  .     返回上一层
------------------------------------------------------
```

  
