#!/bin/bash
# docs: https://xaoxuu.com/wiki/cloud-shell/blog/

VERSION='3.0.0'
URL_NODE='https://nodejs.org/dist/v18.12.1/node-v18.12.1.pkg'

P1=$1
P2=$2

function on_success() {
	str=$1
	if [ "$str" == "" ];then
		str="操作成功"
	fi
	printf "> \033[32m%s！\033[0m\n" "${str}"
}
function on_fail() {
	str=$1
	if [ "$str" == "" ];then
		str="操作失败"
	fi
	printf "\n> \033[31m%s！\033[0m\n" "${str}"
	printf "我们都有不顺利的时候。\n"
}

# install nodejs
function install_nodejs() {
	function download(){
		printf "\n> 现在开始下载[node.js]，这通常不会太久...\n"
		curl -o $HOME/Downloads/node-latest.pkg $URL_NODE -#
	}
	function install() {
		printf "\n> 请输入密码来安装node.js\n"
		sudo installer -store -pkg "$HOME/Downloads/node-latest.pkg" -target "/"
	}
	download && install
}

# install hexo
function install_hexo() {
	printf "\n> 现在开始下载并安装[hexo]，这通常不会太久...\n"
	printf "\n> sudo npm install hexo-cli -g\n"
	sudo npm install hexo-cli -g
}

# npm i
function npm_install() {
	printf "\n> npm install\n" && npm i
}

# hexo init
function hexo_init() {
	if [ -f "_config.yml" ];then
		printf "\n\n> 已检测到hexo博客\n"
	else
		echo "" && read -p "请输入blog名称，例如“blog”: " BLOGNAME
		if [ "$BLOGNAME" == "" ];then
			BLOGNAME="blog"
		fi
		printf "\n> hexo init\n" ${BLOGNAME}
		hexo init ${BLOGNAME}
		printf "\n> cd %s\n" ${BLOGNAME}
		cd ${BLOGNAME}
	fi
}

# install theme
function install_theme() {
	theme=$1
	if [[ ${theme} == "" ]]; then
		theme="stellar"
	fi
	printf "\n> 正在安装%s主题，马上就要成功了...\n" $theme &&
	npm i hexo-theme-$theme &&
	printf "\n> 正在应用主题...\n" &&
	sed -i "" "s/^theme:\([^\"]\{1,\}\)/theme: $theme/g" '_config.yml' &&
	if [ ! -f "_config.$theme.yml" ]; then
	  touch "_config.$theme.yml"
	fi
}

# local run
function hexo_server() {
	function open_url() {
		sleep 3
		open http://localhost:4000/
	}
	printf "\n> hexo server\n"
	open_url & hexo server
}

# check and start
function check_and_start() {
	# 检查是否有 node 环境
	function check_node() {
		printf "\n> 正在检查 node 环境...\n"
		node_version=`node -v`
		if [[ ${node_version} == "" ]]; then
			install_nodejs || on_fail
		else
			echo "node.js ${node_version}" && on_success "准备就绪"
		fi
	}
	# 检查是否有 hexo 环境
	function check_hexo() {
		printf "\n> 正在检查 hexo 环境...\n"
		hexo_version=`hexo -v`
		if [[ ${hexo_version} == "" ]]; then
			install_hexo || on_fail
		else
			echo "${hexo_version}" && on_success "准备就绪"
		fi
	}
	printf "\n> 请坐和放宽，我们正在帮你搞定一切...\n"
	check_node && check_hexo && hexo_init && install_theme $1 && npm_install && hexo_server || on_fail
}

function hexo_clean() {
	printf "\n> hexo clean\n" && hexo clean
}

function hexo_generate() {
	printf "\n> hexo generate\n" && hexo generate
}

function hexo_deploy() {
	printf "\n> hexo deploy\n" && hexo deploy
}


#### main ####
case $P1 in
	# 常用
	'c'|'clean') hexo_clean || on_fail ;;
	'g'|'generate') hexo_generate || on_fail ;;
	's'|'server') hexo_server || on_fail ;;
	'd'|'deploy') hexo_deploy || on_fail ;;
	'cs') hexo_clean && hexo_server || on_fail ;;
	'cg') hexo_clean && hexo_generate || on_fail ;;
	'cgd')
		function git_commit_all() {
			printf "\n> 正在提交文件改动到git...\n"
			git add --all && git commit -m "update at `date +'%Y-%m-%d %H:%M:%S'`"
			git push origin && echo -e "> \\033[0;32m提交成功！\\033[0;39m"
		}
		hexo_clean && hexo_generate && hexo_deploy && git_commit_all || on_fail ;;
	# 安装
	'i'|'install') 
		case $P2 in
			'n'|'node') install_nodejs ;;
			'h'|'hexo') install_hexo ;;
			'b'|'blog') hexo_init && hexo_server ;;
			'd'|'dep') npm_install ;;
			'vlts') install_theme 'volantis' && hexo_server ;;
			*) install_theme $P2 && hexo_server ;;
		esac
		;;
	# 自动
	'init') check_and_start $P2 ;;
	'test')
		git clone https://github.com/hexojs/hexo-theme-unit-test.git &&
		cd hexo-theme-unit-test &&
		install_theme $P2 && npm_install && hexo_server || on_fail
		;;
	# 帮助
	'docs'|'help') open https://xaoxuu.com/wiki/cloud-shell/blog/ ;;
	'gh'|'github') open https://github.com/cloud-shell-lib/blog ;;
	'version'|'-v') printf "> version: %s\n" ${VERSION} ;;
	'') 
	printf "> see docs: https://xaoxuu.com/wiki/cloud-shell/blog/\n"
	;;
esac