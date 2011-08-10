#!/bin/sh
# Executable version of http://buildbot.net/buildbot/tutorial/
# Modified to start a wine buildbot instead of the tutorial
# Copyright 2011, Dan Kegel
# Dual licensed, GPL and LGPL, suitable for inclusion in both buildbot and wine

set -x
set -e

SRC=`dirname $0`
SRC=`cd $SRC; pwd`
TOP=$HOME/tmp/buildbot

install_prereqs() {
    # For Ubuntu.  Other systems may differ.
    sudo apt-get install python-dev python-virtualenv
}

destroy() {
    stop_master || true
    stop_slave || true
    rm -rf $TOP || true
}

init_master() {
    (
    mkdir -p $TOP
    # Master
    cd $TOP
    virtualenv --no-site-packages sandbox
    cd $TOP/sandbox
    . bin/activate
    easy_install buildbot
    buildbot create-master master
    )
}

start_master() {
    (
    cd $TOP/sandbox
    . bin/activate
    cp $SRC/master.cfg $VIRTUAL_ENV/master
    buildbot start $VIRTUAL_ENV/master
    )
}

stop_master() {
    (
    cd $TOP/sandbox
    . bin/activate
    buildbot stop $VIRTUAL_ENV/master
    )
}

init_slave() {
    (
    mkdir -p $TOP
    cd $TOP
    test -d sandbox || virtualenv --no-site-packages sandbox
    cd $TOP/sandbox
    . bin/activate
    easy_install buildbot-slave
    buildslave create-slave slave localhost:9989 example-slave pass
    cp $SRC/winebuildbot.sh $TOP/sandbox/bin/winebuildbot.sh
    chmod +x $TOP/sandbox/bin/winebuildbot.sh
    cp $SRC/*-ignore-*.patch $TOP/sandbox/bin
    )
}

start_slave() {
    (
    cd $TOP/sandbox
    . bin/activate
    buildslave start $VIRTUAL_ENV/slave
    )
}

stop_slave() {
    (
    cd $TOP/sandbox
    . bin/activate
    buildslave stop $VIRTUAL_ENV/slave
    )
}

all() {
    destroy
    install_prereqs
    init_master
    start_master
    init_slave
    start_slave
}

# Useful for testing bot.sh or master.cfg changes
restart() {
    stop_master || true
    stop_slave || true
    init_master
    start_master
    init_slave
    start_slave
}

# Apply patches needed to skip flaky tests
do_patch() {
    cd $TOP/sandbox/slave/runtests/build
    for p in $SRC/*-ignore-*.patch
    do
        echo $p
        patch -p1 < $p
    done
}

do_configure() {
    cd $TOP/sandbox/slave/runtests/build
    CFLAGS="-g -O0" ./configure
}

do_build() {
    cd $TOP/sandbox/slave/runtests/build
    make -j9
}

do_test() {
    cd $TOP/sandbox/slave/runtests/build
    rm -rf wineprefix
    export WINEPREFIX=`pwd`/wineprefix
    # Many tests only work in english locale
    LANG=en_US.UTF-8
    # winetricks vd=800x600
    ./wine reg add HKCU\\Software\\Wine\\Explorer /v Desktop /d Default
    ./wine reg add HKCU\\Software\\Wine\\Explorer\\Desktops /v Default /d 800x600
    # winetricks nocrashdialog
    ./wine reg add HKCU\\Software\\Wine\\WineDbg /v ShowCrashDialog /t REG_DWORD /d 0
    # Blacklist some tests
    # http://bugs.winehq.org/show_bug.cgi?id=12053
    touch dlls/user32/tests/msg.ok
    touch dlls/user32/tests/win.ok
    touch dlls/user32/tests/input.ok
    # http://bugs.winehq.org/show_bug.cgi?id=28038
    touch dlls/wininet/tests/urlcache.ok
    # my machine fails with "capture.c:148: Test failed: waveInOpen(1)"
    touch dlls/winmm/tests/capture.ok
    # http://bugs.winehq.org/show_bug.cgi?id=28048
    touch dlls/winmm/tests/wave.ok
    # Blacklist until http://www.winehq.org/pipermail/wine-patches/2011-August/105358.html in
    touch dlls/winhttp/tests/winhttp.ok
    make -k test
}

do_try() {
    if test "$1" = ""
    then
        echo "need patch name"
        exit 1
    fi
    (
    cd $TOP/sandbox
    . bin/activate
    # FIXME: import username and password from another file so
    # it doesn't show up in svn.  Must match those in master.cfg.
    # FIXME: Use real hostname for master.
    # Always use -p 1 for wine patches, since that's the project's convention.
    buildbot try --connect=pb --master=127.0.0.1:5555 --username=fred --passwd=trybot --diff=$1 -p 1
    )
}

while test "$1"
do
    arg="$1"
    shift
    case "$arg" in
    d|destroy) destroy;;
    ip|install_prereqs) install_prereqs;;
    im|init_master) init_master;;
    sm|start_master) start_master;;
    is|init_slave) init_slave;;
    ss|start_slave) start_slave;;
    tm|stop_master) stop_master;;
    ts|stop_slave) stop_slave;;
    lm|log_master) tail -f $TOP/sandbox/master/twistd.log;;
    ls|log_slave) tail -f $TOP/sandbox/slave/twistd.log;;
    patch) do_patch;;
    configure) do_configure;;
    build) do_build;;
    test) do_test;;
    restart) restart;;
    all) all;;
    try) do_try $1; shift;;
    *) echo "bad arg; expected destroy, install_prereqs, {init,start,log}_{master,slave}, {patch,configure,build,test}, restart, try PATCH, or all"; exit 1;;
    esac
done
