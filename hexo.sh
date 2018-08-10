#!/bin/bash https://blog.xaoxuu.com


function cmd_hexo_c(){
	echo '> hexo clean'
    hexo clean
}
function cmd_hexo_g(){
	echo '> hexo generate'
    hexo generate
}
function cmd_hexo_s(){
	echo '> hexo server'
    open http://localhost:4000/
    hexo server
}
function cmd_hexo_d(){
	echo '> hexo deploy'
    hexo deploy
}
function cmd_hexo_theme(){
	echo '> git clone https://github.com/xaoxuu/hexo-theme-material-x themes/material-x'
	git clone https://github.com/xaoxuu/hexo-theme-material-x themes/material-x
	echo '> 安装主题依赖包...'
	npm i -S hexo-generator-search hexo-generator-feed hexo-renderer-less hexo-autoprefixer hexo-generator-json-content hexo-recommended-posts
	echo '> 正在应用主题...'
	sed -i "" "s/^theme:\([^\"]\{1,\}\)/theme: material-x/g" '_config.yml'
	cmd_hexo_s
}

function cmd_i(){
	PARAM1=""
	while :
	do
		if [ "$PARAM2" == "" ];then
			clear
			echo '================= Hexo Utilities ================='
			echo '1. 安装hexo (npm install hexo-cli -g)'
			echo '2. 创建博客 (hexo init blog, npm install, hexo s)'
			echo '3. 安装依赖包 (npm install)'
			echo '4. 安装并应用 Material-X 主题'
			echo ''
			echo '0. 返回上一层'
			echo '--------------------------------------------------'
			read -p "请选择操作: " PARAM2
		fi
        
	    if [ $PARAM2 == 1 ];then
	    	echo '> sudo npm install hexo-cli -g'
	    	sudo npm install hexo-cli -g
		elif [ $PARAM2 == 2 ];then
			read -p "请输入blog名称: " BLOGNAME
			echo '> hexo init' ${BLOGNAME}
			hexo init ${BLOGNAME}
			echo '> cd' ${BLOGNAME}
			cd ${BLOGNAME}
	        echo '> npm install'
	        npm install
	        echo '> hexo server'
	        hexo server open http://localhost:4000/
	        start
	    elif [ $PARAM2 == 3 ];then
	    	echo '> npm install'
	    	npm install
	    	start
		elif [ $PARAM2 == 4 ];then
			cmd_hexo_theme
			start
		elif [ $PARAM2 == 0 ];then
			start
		else 
		    PARAM2=""
	        continue
	    fi
	    PARAM2=""
	done

}

function start(){

	while :
	do
		if [ "$PARAM1" == "" ];then
			clear
			echo '================= Hexo Utilities ================='
			echo 'c. hexo clean'
			echo 'g. hexo generate'
			echo 's. hexo server'
			echo 'd. hexo deploy'
			echo 'cs. hexo clean, hexo server'
			echo 'cg. hexo clean, hexo generate'
			echo 'cgd. hexo clean, hexo generate, hexo deploy'
			echo ''
			echo 'i. 配置环境、初始化、安装主题。'
			echo 'h. hexo help'
			echo '--------------------------------------------------'
		    read -p "请选择操作: " PARAM1
		fi
        
	    if [ $PARAM1 == 'c' ];then
	    	cmd_hexo_c
	    elif [ $PARAM1 == 'g' ];then
			cmd_hexo_g
		elif [ $PARAM1 == 's' ];then
	        cmd_hexo_s
	    elif [ $PARAM1 == 'd' ];then
			cmd_hexo_d
		elif [ $PARAM1 == 'cs' ];then
	        cmd_hexo_c
	        cmd_hexo_s
		elif [ $PARAM1 == 'cg' ];then
	        cmd_hexo_c
	        cmd_hexo_g
		elif [ $PARAM1 == 'cgd' ];then
	        cmd_hexo_c
	        cmd_hexo_g
	        cmd_hexo_d
		elif [ $PARAM1 == 'i' ];then
			cmd_i
		elif [ $PARAM1 == 'h' ];then
			hexo help
		else 
		    PARAM1=""
	        continue
	    fi
	    PARAM1=""
	done
}

PARAM1=$1
PARAM2=$2
start

