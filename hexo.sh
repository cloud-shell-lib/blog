#!/bin/bash
#
# 在终端输入 hexo.sh 即可打开脚本
#

# 脚本版本
VERSION='2.0.6'

function on_wait(){
	if [ "$1" != "" ];then
		sleep $1
	else
		printf "\n按下任意键继续: "
		read -n 1
	fi
}
function on_success(){
	if [ "$1" != "" ];then
		printf "> \033[32m%s！\033[0m\n" $1
	else
		printf "> \033[32m操作成功！\033[0m\n"
	fi

}
function on_fail(){
	if [ "$1" != "" ];then
		printf "\n> \033[31m%s！\033[0m\n" $1
	else
		printf "\n> \033[31m操作失败！\033[0m\n"
	fi
	printf "我们都有不顺利的时候。\n"
	on_wait

}

# 在新的脚本中，输出更新信息，并提交文件改动
function on_updated(){
	PARAM1=""
	case $PARAM2 in
		'update') # 更新
			function success(){
				if [[ "$PARAM3" != "" ]]; then
					printf "\n> \033[32m%s！\033[0m\t%s\n" "更新成功" "${PARAM3} -> ${VERSION}" && on_wait 2
				fi
			}
	        chmod 777 $HOME/Downloads/hexo.sh &&
	        printf "\n> 请输入密码来更新脚本\n" &&
	        sudo mv $HOME/Downloads/hexo.sh '/usr/local/bin/hexo.sh' && success || on_fail
	        PARAM2="" && PARAM3=""
	        ;;
		*) # 下载
			chmod 777 hexo.sh &&
			printf "\n> 请输入密码来安装脚本\n" &&
			sudo mv hexo.sh '/usr/local/bin/hexo.sh' || on_fail
			;;
	esac
	hexo.sh $PARAM2 $PARAM3
}

# 安装nodejs
function install_nodejs(){
	function download(){
		printf "\n> 现在开始下载[node.js]，这通常不会太久...\n"
		curl -o $HOME/Downloads/node-latest.pkg 'https://nodejs.org/dist/v10.15.3/node-v10.15.3.pkg' -#
	}
	function install(){
		printf "\n> 请输入密码来安装node.js\n"
		sudo installer -store -pkg "$HOME/Downloads/node-latest.pkg" -target "/"
	}
	download && install
}
# 安装hexo
function install_hexo(){
	printf "\n> 现在开始下载并安装[hexo]，这通常不会太久...\n"
	printf "\n> sudo npm install hexo-cli -g\n"
	sudo npm install hexo-cli -g
}
function npm_install(){
	printf "\n> npm install\n" && npm install
}
# 创建博客
function hexo_init(){
	echo "" && read -p "请输入blog名称，例如“blog”: " BLOGNAME
	if [ "$BLOGNAME" == "" ];then
		BLOGNAME="blog"
	fi
	printf "\n> hexo init\n" ${BLOGNAME}
	hexo init ${BLOGNAME}
	printf "\n> cd %s\n" ${BLOGNAME}
	cd ${BLOGNAME}
}
# 安装主题
function hexo_theme_x(){
	function git_clone(){
		printf "\n> git clone https://github.com/xaoxuu/hexo-theme-material-x themes/material-x\n"
		git clone https://github.com/xaoxuu/hexo-theme-material-x themes/material-x
	}
	function git_update(){
		printf "\n> git pull https://github.com/xaoxuu/hexo-theme-material-x themes/material-x\n"
		cd "themes/material-x" && git pull && git checkout -- . && cd ../..
	}
	git_clone || git_update
	printf "\n> 正在安装主题依赖包，马上就要成功了...\n"
	npm i -S hexo-generator-search hexo-generator-json-content hexo-renderer-less
	printf "\n> 正在应用主题...\n"
	sed -i "" "s/^theme:\([^\"]\{1,\}\)/theme: material-x/g" '_config.yml'
}

# 启动博客
function hexo_server(){
	function open_url(){
		sleep 3
		open http://localhost:4000/
	}
	printf "\n> hexo server\n"
    open_url &
    hexo server
}

# 更新脚本
function cmd_update(){
	# 下载脚本
	function download(){
		curl -o $HOME/Downloads/hexo.sh 'https://raw.githubusercontent.com/xaoxuu/hexo.sh/master/hexo.sh'
	}
	# 启动脚本，并传入参数
	function install(){
		chmod 777 $HOME/Downloads/hexo.sh
		. $HOME/Downloads/hexo.sh -i update $VERSION
	}
	printf "\n> 正在更新...\n"
	download && install || on_fail "更新失败"
	PARAM1=""
	PARAM2=""
}


function cmd_init(){
	# 检查是否有 node 环境
	function auto_node(){
		printf "\n> 正在检查 node 环境...\n"
		node_version=`node -v`
		if [[ ${node_version} == "" ]]; then
			install_nodejs || on_fail
		else
			on_success "node.js准备就绪"
		fi
	}
	# 检查是否有 hexo 环境
	function auto_hexo(){
		printf "\n> 正在检查 hexo 环境...\n"
		hexo_version=`hexo -v`
		if [[ ${hexo_version} == "" ]]; then
			install_hexo || on_fail
		else
			on_success "hexo准备就绪"
		fi
	}
	printf "\n> 请坐和放宽，我正在帮你搞定一切...\n"
	auto_node && auto_hexo && hexo_init && hexo_theme_x && npm_install && hexo_server || on_fail
}
function cmd_install(){
	case $PARAM2 in
		'n'|'node') install_nodejs ;;
		'h'|'hexo') install_hexo ;;
		'b'|'blog') hexo_init && hexo_server ;;
		'd'|'dependency') npm_install ;;
		'x'|'material-x') hexo_theme_x && hexo_server ;;
		*) ;;
	esac
	PARAM2=""
}
function start(){
	function cmd_help(){
		function wait(){
			on_wait 0.02
		}
		printf "\n\n常用:\n" && wait
		printf "  \033[1m\033[32m%s\033[0m %s \t %s \n" 'c' '(clean)' '执行 hexo clean' && wait
		printf "  \033[1m\033[32m%s\033[0m %s \t %s \n" 's' '(server)' '执行 hexo server' && wait
		printf "  \033[1m\033[32m%s\033[0m %s \t %s \n" 'g' '(generate)' '执行 hexo generate' && wait
		printf "  \033[1m\033[32m%s\033[0m %s \t %s \n" 'd' '(deploy)' '执行 hexo deploy' && wait
		printf "  \033[1m\033[32m%s\033[0m %s \t\t %s \n" 'cs' '' '执行 c, s 的组合' && wait
		printf "  \033[1m\033[32m%s\033[0m %s \t\t %s \n" 'cg' '' '执行 c, g 的组合' && wait
		printf "  \033[1m\033[32m%s\033[0m %s \t\t %s \n" 'cgd' '' '执行 c, g, d 的组合，然后提交代码' && wait

		printf "\n安装:\n" && wait
		printf "  \033[1m\033[32m%-s\033[0m %s \t %s \n" 'i' '(install)' '用于安装的命令，下面是install命令的参数:' && wait
		printf "  \t\t \033[1m\033[32m%s\033[0m %-12s %s \n" 'n' '(node)' '安装node.js环境' && wait
		printf "  \t\t \033[1m\033[32m%s\033[0m %-12s %s \n" 'h' '(hexo)' '安装hexo环境(npm install hexo-cli -g)' && wait
		printf "  \t\t \033[1m\033[32m%s\033[0m %-12s %s \n" 'b' '(blog)' '搭建博客(hexo init, npm install)' && wait
		printf "  \t\t \033[1m\033[32m%s\033[0m %-12s %s \n" 'd' '(dependency)' '安装依赖包(npm install)' && wait
		printf "  \t\t \033[1m\033[32m%s\033[0m %-12s %s \n" 'x' '(material-x)' '下载并应用【Material-X】主题' && wait

		printf "\n自动:\n" && wait
		printf "  \033[1m\033[32m%-s\033[0m \t\t %s \n" 'init' '自动检查并安装所有需要的环境，然后搭建并启动博客。👍🏼' && wait
		printf "  \033[1m\033[32m%-s\033[0m \t\t %s \n" 'xut' '下载并运行【Material-X】主题的单元测试。' && wait


		printf "\n脚本:\n" && wait
		printf "  \033[1m\033[32m%-s\033[0m %s \033[1m\033[32m%-s\033[0m \t %s \n" 'cd' '+' '`path`' '选择路径'
		printf "  \033[1m\033[32m%-s\033[0m %s \t %s \n" 'docs' '' '查看文档(https://xaoxuu.com/wiki/hexo.sh)' && wait
		printf "  \033[1m\033[32m%-s\033[0m %s \t %s \n" 'gh' '(github)' 'GitHub页面(https://github.com/xaoxuu/hexo.sh)' && wait
		printf "  \033[1m\033[32m%-s\033[0m %s \t %s%s%s \n" 'u' '(update)' '更新脚本文件(当前版本：' ${VERSION} ')' && wait

		printf "\n\n" && wait
		on_wait

	}
	function hexo_clean(){
		printf "\n> hexo clean\n" && hexo clean
	}
	function hexo_generate(){
		printf "\n> hexo generate\n" && hexo generate
	}
	function hexo_deploy(){
		printf "\n> hexo deploy\n" && hexo deploy
	}
	while :
	do
		if [ "$PARAM1" == "" ];then
			clear
			echo '==================== Hexo Utilities ===================='
			printf "常用:\n"
			printf "  \033[1m\033[32m%s\033[0m %s \t %s \n" 'c' '(clean)' '执行 hexo clean'
			printf "  \033[1m\033[32m%s\033[0m %s \t %s \n" 's' '(server)' '执行 hexo server'
			printf "  \033[1m\033[32m%s\033[0m %s \t %s \n" 'g' '(generate)' '执行 hexo generate'
			printf "  \033[1m\033[32m%s\033[0m %s \t %s \n" 'd' '(deploy)' '执行 hexo deploy'
			printf "  \033[1m\033[32m%s\033[0m %s \t\t %s \n" 'cs' '' '执行 c, s 的组合'
			printf "  \033[1m\033[32m%s\033[0m %s \t\t %s \n" 'cg' '' '执行 c, g 的组合'
			printf "  \033[1m\033[32m%s\033[0m %s \t\t %s \n" 'cgd' '' '执行 c, g, d 的组合，然后提交代码'
			printf "\n更多:\n"
			printf "  \033[1m\033[32m%-s\033[0m %s \t %s%s%s \n" 'u' '(update)' '更新脚本文件(当前版本：' ${VERSION} ')'
			printf "  \033[1m\033[32m%-s\033[0m \t\t %s \n" 'help'  '查看全部指令'
			echo '--------------------------------------------------------'
		    read -p "请输入指令: " PARAM1 PARAM2
		fi
        case $PARAM1 in
        	# 常用
	        'c'|'clean') hexo_clean && on_wait || on_fail ;;
			'g'|'generate') hexo_generate && on_wait || on_fail ;;
			's'|'server') hexo_server ;;
			'd'|'deploy') hexo_deploy && on_wait || on_fail ;;
			'cs') hexo_clean && hexo_server ;;
			'cg') hexo_clean && hexo_generate && on_wait || on_fail ;;
			'cgd')
				function git_commit_all(){
					printf "\n> 正在提交文件改动到git...\n"
					git add --all && git commit -am "update all"
					git push origin && echo -e "> \\033[0;32m提交成功！\\033[0;39m"
				}
				hexo_clean && hexo_generate && hexo_deploy && git_commit_all && on_wait || on_fail ;;
			# 安装
			'i'|'install') cmd_install ;;
			# 自动
			'init') cmd_init ;;
			'xut')
				git clone https://github.com/hexojs/hexo-theme-unit-test.git &&
				cd hexo-theme-unit-test && npm_install && hexo.sh i x ;;
			# 脚本
			'cd') cd $PARAM2 && on_success && on_wait 1 || on_fail;;
			'docs') open https://xaoxuu.com/wiki/hexo.sh ;;
			'gh'|'github') open https://github.com/xaoxuu/hexo.sh ;;
			'u'|'update') cmd_update ;;
			'help') cmd_help ;;

			# private
			'-i') on_updated ;;
			*) ;;
	    esac
	    PARAM1="" && PARAM2=""
	done
}

PARAM1=$1
PARAM2=$2
PARAM3=$3
PARAM4=$4
start
