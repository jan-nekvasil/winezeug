#!/bin/sh
# Start a wine buildbot master
# Copyright 2011, Dan Kegel
# LGPL

set -x
set -e

TOP=$HOME/winemaster.dir

# Get email address of user from environment for use by the 'try' command.
# If not set, default to username@hostname.
EMAIL=${EMAIL:-$LOGNAME@`hostname`}

#----- Helper functions -----------------------------------------------------

usage() {
    set +x
    echo "Usage: $0 command ..."
    echo "Commands:"
    echo "   destroy"
    echo "   install_prereqs"
    echo "   create"
    echo "   start"
    echo "   tail"
    echo "   demo"
    echo "   patchwatcher"

    exit 1
}

#----- Functions invoked by user when setting up or starting master -----------

install_prereqs() {
    # For Ubuntu.  Other systems may differ.
    # Needed for buildbot
    sudo apt-get install python-dev python-virtualenv 
    # Needed for parsepatch.pl
    sudo apt-get install libdatetime-format-mail-perl
}

destroy() {
    if test -d $TOP
    then
        stop_master || true
        rm -rf $TOP || true
    fi
}

create_master() {
    (
    # Master
    mkdir -p $TOP
    cd $TOP
    virtualenv --no-site-packages sandbox
    cd $TOP/sandbox
    . bin/activate
    if false
    then
        easy_install buildbot
    elif false
    then
        # Here's how to install from a source tarball
        wget -c http://buildbot.googlecode.com/files/buildbot-0.8.4p2.tar.gz
        tar -xzvf buildbot-0.8.4p2.tar.gz
        cd buildbot-0.8.4p2
        python setup.py install
        cd ..
    else
        # Here's how to install master from trunk
        # (Needed until buildbot-0.8.5 is released,
        # since it has fixes for the try server / mail notifier.)
        # BTW rerunning 'pip install -emaster' takes less than a second, 
        # and seems to be how buildbot developers test their code
        test -d buildbot-git || git clone git://github.com/buildbot/buildbot.git buildbot-git
        cd buildbot-git
        export PIP_USE_MIRRORS=true
        pip install -emaster
        cd ..
    fi
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

# Shows how to bring up a demo master
demo() {
    destroy
    install_prereqs
    create_master
    start_master
}

#--------- Functions used to implement patchwatcher ---------

do_try() {
    (
    if test "$1" = ""
    then
        echo "need patch name"
        exit 1
    fi
    who=$2
    # The --properties flag uses comma as a delimiter, so we have to change all commas in comments to something else
    subject="`echo $3 | tr ',' ';'`"
    cd $TOP/sandbox
    . bin/activate
    # FIXME: import username and password from another file so
    # it doesn't show up in svn.  Must match those in master.cfg.
    # FIXME: Use real hostname for master.
    # Always use -p 1 for wine patches, since that's the project's convention.
    buildbot try $wait --who $who --properties=comment="$subject" --connect=pb --master=127.0.0.1:5555 --username=fred --passwd=trybot --diff=$1 -p 1
    )
}

# Try the most recent not-yet-done patch series from source.winehq.org/patches
do_pulltry() {
    series=`perl parsepatch.pl 1`
    if test "$series"
    then
        maxlen=`echo $series | wc -w`
        for len in `seq 1 $maxlen`
        do
            # Concatenate first len patches of the series
            > series.patch
            for id in `echo $series | tr ' ' '\012' | head -n $len`
            do
                cat cached_patches/cache-$id.patch >> series.patch
                subject="`grep '^Subject:' < cached_patches/cache-$id.patch | head -n 1`"
            done
            author_email=`grep '^From:' < series.patch | head -n 1 | sed 's/^From: //;s/.*<//;s/>.*//'`
            do_try `pwd`/series.patch $author_email "${id}: ${subject}"
        done
    fi
}

# Sit and test new patches forever
do_patchwatcher() {
    while true
    do
       do_pulltry || true
       # Launch at most one patch per minute
       sleep 60
    done
}

#--------- Main program ---------------------------------------------------------

SRC=`dirname $0`
SRC=`cd $SRC; pwd`

if ! test "$1"
then
    usage
fi

while test "$1"
do
    arg="$1"
    shift
    case "$arg" in
    destroy) destroy;;
    install_prereqs) install_prereqs;;
    create_master) create_master;;
    start) start_master;;
    stop) stop_master;;
    tail) tail -f $TOP/sandbox/master/twistd.log;;
    demo) demo;;
    pulltry) do_pulltry;;
    pw|patchwatcher) do_patchwatcher;;
    try) do_try $1 $EMAIL; shift;;
    *) usage ;;
    esac
done
