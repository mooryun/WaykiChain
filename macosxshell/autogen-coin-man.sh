#!/bin/sh
set -e

if [ $# = 0 ]; then	
  	echo -e "\033[40;33m"
		echo Warning:  your did not input assemble model
		echo "$PWD"
		echo autogen-coin-man [MODEL NAME]
		echo
		echo	EXAMPLE:
		echo
		echo	autogen-coin-man ["coin|coin-test|coin-ptest"]
	echo -e "\033[40;37m"
		exit 1
elif [ $# = 1 ]; then
	case $1 in 
		coin)
		flag1=--with-daemon
		;;
		coin-test)
		flag1=--enable-tests
		;;
		coin-ptest)
		flag1=--enable-ptests
		;;
		*)
		echo -e "\033[40;32m"
		echo Warning: error in param!
		echo -e "\033[40;37m"
		exit 1
		;;
	esac
elif [ $# = 2 ]; then
	case $1 in 
		coin)
		flag1=--with-daemon
		;;
		coin-test)
		flag1=--enable-tests
		;;
		coin-ptest)
		flag1=--enable-ptests
		;;
		*)
		echo -e "\033[40;32m"
		echo Warning: error in param!
		echo -e "\033[40;37m"
		exit 1
		;;
	esac
	case $2 in 
		coin)
		flag2=--with-daemon
		;;
		coin-test)
		flag2=--enable-tests
		;;
		coin-ptest)
		flag2=--enable-ptests
		;;
		*)
		echo -e "\033[40;32m"
		echo Warning: error in param!
		echo -e "\033[40;37m"
		exit 1
		;;
	esac
elif [ $# = 3 ]; then
	case $1 in 
		coin)
		flag1=--with-daemon
		;;
		coin-test)
		flag1=--enable-tests
		;;
		coin-ptest)
		flag1=--enable-ptests
		;;
		*)
		echo -e "\033[40;32m"
		echo Warning: error in param!
		echo -e "\033[40;37m"
		exit 1
		;;
	esac
	case $2 in 
		coin)
		flag2=--with-daemon
		;;
		coin-test)
		flag2=--enable-tests
		;;
		coin-ptest)
		flag2=--enable-ptests
		;;
		*)
		echo -e "\033[40;32m"
		echo Warning: error in param!
		echo -e "\033[40;37m"
		exit 1
		;;
	esac
	case $3 in 
		coin)
		flag3=--with-daemon
		;;
		coin-test)
		flag3=--enable-tests
		;;
		coin-ptest)
		flag3=--enable-ptests
		;;
		*)
		echo -e "\033[40;32m"
		echo warming:error para!
		echo -e "\033[40;37m"
		exit 1
		;;
	esac
else
	echo -e "\033[40;32m"
	echo Warning:  You input an illegal param value
   	echo Please ensure the param is of the following values: [coin|coin-test|coin-ptest]
	echo -e "\033[40;37m" 
	exit 1
fi

srcdir="$(dirname $0)"
cd "$srcdir"
autoreconf --install --force

CPPFLAGS="-stdlib=libc++ -std=c++11 -I/usr/local/opt/boost160/include -I/usr/local/BerkeleyDB.4.8/include" \
LDFLAGS="-L/usr/local/opt/boost160/lib -L/usr/local/BerkeleyDB.4.8/lib -lc++" \
./configure \
--disable-upnp-default \
--enable-debug \
--without-gui \
$flag1 \
$flag2 \
$flag3 \
$flag4 \
--with-boost-libdir=/usr/local/opt/boost160/lib \
--with-incompatible-bdb