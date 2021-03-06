#!/bin/sh
# Yet Another Graphics Benchmark
# Automated script to measure Win32 graphics performance
# Copyright 2010 Dan Kegel.
# Licence: LGPL (for winehq compatibility)
#
# To run on Windows, please use cygwin.
# When running on Windows Vista or 7, disable UAC and reboot, or Autohotkey won't be able to script the installers.
# On any OS, you'll want to install the packages
#  cabextract subversion unzip wget 
# and also libxml2 or libxml2-utils (for xmllint)
# and then do something like
#  svn checkout http://winezeug.googlecode.com/svn/trunk/ winezeug
#  cd winezeug
#  sh yagmark 3dmark2000
# On Windows 7, you have to mark the installed 3dmark2000/3dmark2001 executables as 
# needing Windows XP compatibility mode, or they will not run.

VERSION=20100509

# Set to 1 to do a very short testing run
TINY=0

WINEPREFIX="${WINEPREFIX:-$HOME/.wine-yagmark}"
export WINEPREFIX
RESULTSDIR="${RESULTSDIR:-`pwd`/results}"

case "$OS" in
 "Windows_NT")
    WINE=""
    DRIVE_C="C:/"
    XXXPATH=cygpath
    # Mysterious workaround for quoting difference between cygwin and linux
    backslash='\'
    ;;
 *)
    WINE=${WINE:-wine}
    DRIVE_C="$WINEPREFIX/drive_c"
    XXXPATH="$WINE winepath"
    # Mysterious workaround for quoting difference between cygwin and linux
    backslash='\\'
    ;;
esac
export WINE

# The folder-name is localized!
programfilesdir_win="`unset WINEDEBUG; WINEDLLOVERRIDES=mshtml= $WINE cmd.exe /c echo "%ProgramFiles%" | tr -d '\015'`"
test x"$programfilesdir_win" != x || die "$WINE cmd.exe /c echo '%ProgramFiles%' returned empty string"
programfilesdir_unix="`unset WINEDEBUG; $XXXPATH -u "$programfilesdir_win" | tr -d '\015' `"
test x"$programfilesdir_unix" != x || die "winepath -u $programfilesdir_win returned empty string"

# 64 bit windows has a second directory for program files
programfilesdir_x86_win="${programfilesdir_win} (x86)"
programfilesdir_x86_unix="${programfilesdir_unix} (x86)"
if ! test -d "$programfilesdir_x86_unix"
then
    programfilesdir_x86_win="${programfilesdir_win}"
    programfilesdir_x86_unix="${programfilesdir_unix}"
fi

YAGMARK_TMP="$DRIVE_C"/yagmarktmp
YAGMARK_TMP_WIN='c:\yagmarktmp'
YAGMARK_RESULTS="$DRIVE_C"/yagmarkresults
YAGMARK_RESULTS_WIN='c:\yagmarkresults'

olddir=`pwd`

rm -rf "$YAGMARK_TMP"
mkdir -p "$YAGMARK_TMP"

cputype=`cat /proc/cpuinfo | egrep 'model name' | 
        awk '{print $8}' | uniq`

host=`hostname | sed 's/\..*//'`    

case "$OS" in
"Windows_NT")
    systeminfo | tee "$YAGMARK_TMP"/sysinfo.txt
    # Dirty code to simplify os name
    osname=`grep "OS Name" "$YAGMARK_TMP"/sysinfo.txt | sed 's/.*Microsoft.*Windows //;s/VistaT/Vista/;s/ .*//'`
    wineversion=""
    dxdiag -t "$YAGMARK_TMP_WIN"\\dxdiaginfo.txt
    echo "--------------- dxdiag ---------------" >> "$YAGMARK_TMP"/sysinfo.txt
    cat "$YAGMARK_TMP"/dxdiaginfo.txt >> "$YAGMARK_TMP"/sysinfo.txt
    gputype=`grep 'Card name' < "$YAGMARK_TMP"/dxdiaginfo.txt |
            awk '{print $5"_"$6}'`
    ;;
*) 
    # note: next line contains a tab
    osname=`lsb_release -d | sed 's/.*://;s/^[ 	]*//;s/ /_/g'`
    if test "$osname" = ""
    then
        if test -f /etc/gentoo-release
        then
            osname=gentoo
        fi
    fi
    wineversion=`$WINE --version`
    (lspci || /sbin/lspci || /usr/sbin/lspci) > "$YAGMARK_TMP"/sysinfo.txt
    gputype=`cat "$YAGMARK_TMP"/sysinfo.txt | grep VGA |
             sed -e 's/.*\[//;s/]\.*//;s/ (.*//;s/GeForce //;s/ /_/g'`
    
    # Handle case where kernel doesn't know this graphics card by name
    echo gputype is $gputype
    case $gputype in
    *nVidia_Corporation_Device_0ca3) gputype="GT_240";;
    esac
    ;;
esac

#----------------------------------------------------------------

warn() {
    echo "------------------------------------------------------"
    echo "$@"
    echo "------------------------------------------------------"
}

# At some point, make the return value controllable by a global 
# commandline option so we can see if we still need the workaround.
workaround_wine_bug()
{
    if test "$WINE" = ""
    then
        echo No need to work around wine bug $1 on windows
        return 1
    fi
    case $1 in
    "$YAGMARK_BLACKLIST") 
        echo wine bug $1 workaround blacklisted, skipping
        return 1
        ;;
    esac
    warn Working around wine bug $1
    return 0
}

ahk_do()
{
   echo "$@" | sed "s/\$//" > "$YAGMARK_TMP"/tmp.ahk
   $WINE "$programfilesdir_x86_unix/AutoHotkey/AutoHotkey.exe" "$YAGMARK_TMP"\\tmp.ahk
}

#----------------------------------------------------------------

run_3dmark2000()
{
    exe_dir="$programfilesdir_x86_unix/MadOnion.com/3DMark2000"

    SAVE_PATH="$YAGMARK_RESULTS_WIN${backslash}3dmark2000"

    # Install if needed
    if ! test -f "$exe_dir/3DMark2000.exe"
    then
        sh ../wisotool 3dmark2000
    fi
    cd "$exe_dir"
    ahk_do "
        SetTitleMatchMode, 2
        run, .${backslash}3DMark2000.exe
        winwait, 3DMark2000, Welcome
        ; set tiny to 1 to do just a tiny benchmark during debugging
        tiny = $TINY
        if ( tiny > 0 ) {
            ControlClick, New, 3DMark2000, Welcome
            sleep 1000
            send {escape}
            send !fn
            send c
            winwait, Select Tests
            send c
            send !p
            send {Enter}
            sleep 1000
        }
        send b
        winwait, Overall Score
        sleep 1000
        send {ESC}
        winwaitactive, 3DMark2000
        sleep 500
        ; Save it once with default type so we don't get the kamikaze dialog box on exit
        send ^s
        winwait, Save
        send {DEL 8}
        send $SAVE_PATH
        send {Enter}
        ; Save it again with .txt, which is what we really want
        sleep 1000
        send !fa
        winwait, Save
        send !t3
        send {Enter}
        sleep 500
        send !fx
        sleep 1000
        send n
        WinClose
        sleep 500
        send {Enter}
        send {ESC}
        WinWaitClose, 3DMark2000
        "
    cd "$YAGMARK_RESULTS"
    # Parse results, add prefix, and make parse-friendly
    tr -d '\015' < 3dmark2000.txt |
      sed '1,/Platform/d;
        /^SYSTEM/,$d;
        /^$/d;
        s/^/3dmark2000_/;
        s/[- _][- _]*/_/g;
        s,:,,' > 3dmark2000.parsed
    if test -s 3dmark2000.parsed
    then
        cat 3dmark2000.parsed
    else
        echo "No results?"
        rm 3dmark2000.parsed
    fi
    cd "$olddir"
}

run_3dmark2001()
{
    exe_dir="$programfilesdir_x86_unix/MadOnion.com/3DMark2001 SE"
    SAVE_PATH="$YAGMARK_RESULTS_WIN${backslash}3dmark2001"

 # Install if needed
    if ! test -f "$exe_dir/3DMark2001SE.exe"
    then
        sh ../wisotool 3dmark2001
    fi
    cd "$exe_dir"
    ahk_do "
        SetTitleMatchMode, 2
        run, 3DMark2001SE.exe
        winwait, 3DMark2001
        sleep 500
        ; Uncomment next 7 lines to do just a tiny benchmark during debugging
        ;send c
        ;winwait, Select Tests
        ;sleep 500
        ;send c
        ;send f
        ;send {Enter}
        ;sleep 500
        send b
        winwaitactive, Overall Score
        sleep 1000
        send l
        sleep 500
        send ^s
        winwait, Save As
        send {DEL 8}
        send $SAVE_PATH
        send !t3
        send {Enter}
        sleep 500
        send !fx
        sleep 1000
        WinWaitClose, 3DMark2001
        "
    cd "$YAGMARK_RESULTS"
    # Parse results, add prefix, and make parse-friendly
    sed '1,/RESULTS/d;
        /Fill Rate/,$d;
        s/^/3dmark2001_/;
        s/[- _][- _]*/_/g;
        s/_fps/ fps/' 3dmark2001.txt > 3dmark2001.parsed
    if test -s 3dmark2001.parsed
    then
        cat 3dmark2001.parsed
    else
        echo "No results?"
        rm 3dmark2001.parsed
    fi
    cd "$olddir"
}

run_3dmark05()
{
    exe_dir="$programfilesdir_x86_unix/Futuremark/3DMark05"

    SAVE_PATH="$YAGMARK_RESULTS_WIN${backslash}3dmark05"

    # TODO: add an "if workaround_wine_bug" around -nosysteminfo
    ARGS="-nosysteminfo"
    case "$OS" in
    "Windows_NT") ARGS="" ;;
    esac

    # Install if needed
    if ! test -f "$exe_dir/3DMark05.exe"
    then
        sh ../wisotool 3dmark05
    fi

    cd "$exe_dir"
    ahk_do "
        SetTitleMatchMode, 2
        run, 3DMark05.exe $ARGS
        winwait, Please Register
        sleep 10000
        ;ControlClick, Button3
        send {tab 2}{space}
        winwait, Tip Of The Day
        sleep 500
        send {ESC}
        sleep 500
        send {Enter}
        winwait, 3DMark Score
        sleep 500
        send {tab}
        send {space}
        winwait, Save
        send {DEL 8}
        send $SAVE_PATH
        send {Enter}
        sleep 500
        send {ESC}
        winkill 3DMark05
        "
    cd "$YAGMARK_RESULTS"
    unzip -o 3dmark05.3dr Result.xml
    xmllint --format --nocdata --encode ascii Result.xml |    # convert to ascii and canonicalize
      tr '\012' ' ' |                                         # remove all line breaks
      sed 's,</Result>,|,g;s,</Setting>,|,g' |                # put record separator after each result or setting
      tr '|' '\012' |                                         # turn record separators into line breaks
      sed 's,</Name>,=,g' |                                   # add field separator between variable and value
      sed 's,<Category.*,,' |                                 # remove fields we don't care about
      sed 's,<Plain>[^<]*</Plain>,,g' |                       # remove fields we don't care about
      egrep -v "\.dll|\.exe|Posted|N/A" |                     # remove records we don't care about
      sed 's,<[^>]*>,,g' |                                    # remove remaining tags, leaving just content
      sed 's,^  *,,;s,  *$,,' |                               # remove extra whitespace at start and end of lines
      sed 's, *= *,=,g' |                                     # remove extra whitespace between fields
      sed 's, - , ,' |                                        # make variable names legal identifiers
      sed 's,Anti-Aliasing,AntiAliasing,' |                   # make variable names legal identifiers
      sed 's,post-processing,postprocessing,' |               # make variable names legal identifiers
      sed 's,SM2.0,SM2_0,' |                                  # make variable names legal identifiers
      sed 's,/SM3.0,_SM3_0,' |                                # make variable names legal identifiers
      sed 's, ,_,g' |                                         # make variable names legal identifiers
      tr = '\011' |                                           # use tab as field separator
      grep . > 3dmark05.txt                                   # remove blank lines

    sed 's/^/3dmark05_/' < 3dmark05.txt |                     # add test name to each record
      egrep -v "Frequency|Run_Length|_Profile|Width|Height|_Level|_Quality" > 3dmark05.parsed       # Remove less interesting results and non-results
    cat 3dmark05.parsed
    cd "$olddir"
}

run_3dmark06()
{
    exe_dir="$programfilesdir_x86_unix/Futuremark/3DMark06"

    SAVE_PATH="$YAGMARK_RESULTS_WIN${backslash}3dmark06"

    # TODO: add an "if workaround_wine_bug" around -nosysteminfo
    ARGS="-nosysteminfo"
    case "$OS" in
    "Windows_NT") ARGS="" ;;
    esac

    # Install if needed
    if ! test -f "$exe_dir/3DMark06.exe"
    then
        sh ../wisotool 3dmark06
    fi

    cd "$exe_dir"
    ahk_do "
        SetTitleMatchMode, 2
        run, 3DMark06.exe $ARGS
        winwait, Please Register
        sleep 10000
        ;ControlClick, Button3
        send {tab 2}{space}
        winwait, Tip Of The Day
        sleep 500
        send {ESC}
        sleep 500
        send {Enter}
        winwait, 3DMark Score
        sleep 500
        send {tab}
        send {space}
        winwait, Save
        send {DEL 8}
        send $SAVE_PATH
        send {Enter}
        sleep 500
        send {ESC}
        winkill 3DMark06
        "
    cd "$YAGMARK_RESULTS"
    unzip -o 3dmark06.3dr Result.xml
    xmllint --format --nocdata --encode ascii Result.xml |    # convert to ascii and canonicalize
      tr '\012' ' ' |                                         # remove all line breaks
      sed 's,</Result>,|,g;s,</Setting>,|,g' |                # put record separator after each result or setting
      tr '|' '\012' |                                         # turn record separators into line breaks
      sed 's,</Name>,=,g' |                                   # add field separator between variable and value
      sed 's,<Category.*,,' |                                 # remove fields we don't care about
      sed 's,<Plain>[^<]*</Plain>,,g' |                       # remove fields we don't care about
      egrep -v "\.dll|\.exe|Posted|N/A" |                     # remove records we don't care about
      sed 's,<[^>]*>,,g' |                                    # remove remaining tags, leaving just content
      sed 's,^  *,,;s,  *$,,' |                               # remove extra whitespace at start and end of lines
      sed 's, *= *,=,g' |                                     # remove extra whitespace between fields
      sed 's, - , ,' |                                        # make variable names legal identifiers
      sed 's,Anti-Aliasing,AntiAliasing,' |                   # make variable names legal identifiers
      sed 's,post-processing,postprocessing,' |               # make variable names legal identifiers
      sed 's,SM2.0,SM2_0,' |                                  # make variable names legal identifiers
      sed 's,/SM3.0,_SM3_0,' |                                # make variable names legal identifiers
      sed 's, ,_,g' |                                         # make variable names legal identifiers
      tr = '\011' |                                           # use tab as field separator
      grep . > 3dmark06.txt                                   # remove blank lines

    sed 's/^/3dmark06_/' < 3dmark06.txt |                     # add test name to each record
      egrep -v "Frequency|Run_Length|_Profile|Width|Height|_Level|_Quality" > 3dmark06.parsed       # Remove less interesting results and non-results
    cat 3dmark06.parsed
    cd "$olddir"
}

run_re5bench()
{
    exedir="$programfilesdir_x86_unix/CAPCOM/RESIDENT EVIL 5 Benchmark Version"
    exe="$exedir/RE5DX9.EXE"

    # Install if needed
    if ! test -f "$exe"
    then
        sh ../wisotool re5bench
    fi

    # Can this be scraped/controlled at all with autohotkey?  Maybe if run in window...
    cd "$exedir"
    $WINE "$exe"
    cd "$olddir"
}

# Heaven2 has lots of variants.
# Set commandline and then call this to do the work.
do_heaven2()
{
    exedir="$programfilesdir_x86_unix/Unigine/Heaven"
    exe="$exedir/Heaven.exe"

    # Install if needed
    if ! test -f "$exe"
    then
        sh ../wisotool unigine_heaven
    fi

    cd "$exedir"
    if workaround_wine_bug 22622
    then
        # heaven usually hangs on exit without having flushed stdout,
        # so run it in background and watch its other log file
        FILE="$DRIVE_C/users/$LOGNAME/Unigine Heaven/log.html"
        rm -f "$FILE" 2> /dev/null
        $WINE $commandline > "$YAGMARK_RESULTS"/$verb.log 2>&1 & pid=$!
        while ! grep "Benchmark finished" "$FILE"
        do
            sleep 10
        done
        kill $pid
        # Munge the html log file into something like the normal one
        cat "$FILE" |
            sed '1,/log file/d' |             # remove html header
            grep -v '::' |                    # remove debugging messages
            grep -v '\{' |                    # remove css
            sed 's,&nbsp;, ,g;s,</div>,,;s,<div[^<]*>,,' |  # remove html tags
            sed 's,<br/>,|,g' |               # add record separator
            tr '|' '\012' |                   # one record per line
            sed 's/^[^ ]* //' |               # remove timestamp
            cat > "$YAGMARK_RESULTS"/$verb.log
    else
        $WINE $commandline > "$YAGMARK_RESULTS"/$verb.log 2>&1
    fi

    cd "$YAGMARK_RESULTS"
    egrep -v 'fixme:|Connection' < $verb.log | uniq > $verb.txt
    cat $verb.txt | 
        egrep ":[ 	]" |                  # ignore non key/value lines
        grep -v " path:" |                    # ignore uninteresting records
        sed 's/  */ /g' |                     # remove runs of spaces
        tr ' ' _ |                            # make key names legal identifiers
        sed 's/:[_	]/	/' |          # use tab as field separator
        sed "s/^/${verb}_/" > $verb.parsed    # add test name to each record
    cd "$olddir"
}

run_heaven2_d3d9()
{
    commandline="./Heaven.exe -extern_define RELEASE,BENCHMARK -engine_config data/heaven_2.1.cfg -data_path ./ -video_app direct3d9 -sound_app openal "
    do_heaven2
}

run_heaven2_gl()
{
    commandline="./Heaven.exe -extern_define RELEASE,BENCHMARK -engine_config data/heaven_2.1.cfg -data_path ./ -video_app opengl -sound_app openal "
    do_heaven2
}

do_halflife2()
{
    if ! test "$STEAMUSER"
    then
        echo "Must set STEAMUSER and STEAMPW"
        exit 1
    fi

    STEAMDIR="${STEAMDIR:-$programfilesdir_x86_unix/Steam}"
    STEAMUSER=`echo $STEAMUSER | tr A-Z a-z`
    exe="$STEAMDIR/steamapps/$STEAMUSER/half-life 2/hl2.exe"

    if ! test -d "$exedir" || ! test -f "$exe"
    then
        echo "Please install halflife 2 first"
        exit 1
    fi

    rm -f "$STEAMDIR/steamapps/$STEAMUSER/half-life 2/hl2/sourcebench.csv"
    $WINE "$STEAMDIR/Steam.exe" -login $STEAMUSER $STEAMPW -silent -applaunch 220 $commandline $PARAMS  &

    # wait for results file
    while( test ! -e "$STEAMDIR/steamapps/$STEAMUSER/half-life 2/hl2/sourcebench.csv" ) ; do
        sleep 10                                                                         
    done                                                                                     
    killall hl2.exe

    #parse the results
    hl2result=`cat "$STEAMDIR/steamapps/$STEAMUSER/half-life 2/hl2/sourcebench.csv" | grep $DEMO.dem | cut -f 2 -d ,`
    sleep 10 # give Hl2 some time to exit
    echo "result: " $hl2result " fps"
}

run_halflife2()
{
    DEMO=mydemo
    PARAMS="-window -console -novid -nosound -width 640 -height 480 +cl_showfps 2 +timedemo $DEMO"

    # Make sure GLSL is used
    sh winetricks glsl-enable

    commandline="-dxlevel 81"
    do_halflife2
    result81glsl=$hl2result
    echo "result: " $hl2result " fps"

    commandline="-dxlevel 90"
    do_halflife2
    result90glsl=$hl2result

    commandline="-dxlevel 95"
    do_halflife2
    result95glsl=$hl2result

    # Make sure ARB is used
    sh winetricks glsl-disable
    commandline="-dxlevel 81"
    do_halflife2
    result81arb=$hl2result

    commandline="-dxlevel 90"
    do_halflife2
    result90arb=$hl2result

    # This may not actually run in dxlevel 95 on ATI cards. ARB supports SM 2.0 only
    # on ATI. Dxlevel 95 uses SM 2.0, but only activates itself when SM 3.0 is available
    commandline="-dxlevel 95"
    do_halflife2
    result95arb=$hl2result

    sh winetricks glsl-enable

    killall Steam.exe

    cd "$YAGMARK_RESULTS"
    echo "halflife2_dxlevel_81_glsl " $result81glsl > halflife2.parsed
    echo "halflife2_dxlevel_90_glsl " $result90glsl >> halflife2.parsed
    echo "halflife2_dxlevel_95_glsl " $result95glsl >> halflife2.parsed
    echo "halflife2_dxlevel_81_arb " $result81arb >> halflife2.parsed
    echo "halflife2_dxlevel_90_arb " $result90arb >> halflife2.parsed
    echo "halflife2_dxlevel_95_arb " $result95arb >> halflife2.parsed
    cd "$olddir"
}

announce()
{
   echo ">> $*"
   eval $1 $2 $3 $4 $5 $6 $7 $8 $9
}

do_system_description()
{
    echo ">>-------- begin system description ---------"
    echo "Host Name: $host"
    echo "CPU Type: $cputype"
    echo "Graphics Card: $gputype"
    echo "Operating System: $osname"
    echo "Wine Version: $wineversion"

    cat "$YAGMARK_TMP"/sysinfo.txt

    case "$OS" in
    "Windows_NT")
        ;;
    *)
       announce glxinfo \| egrep 'vendor\|renderer\|version'
       announce dmesg \| grep NVIDIA | grep loading | tail -n 1
    ;;
    esac
    echo ">>-------- end system description ---------"
}

SYSTEMID="$cputype-"$gputype"-$osname-$host"

echo SYSTEMID is $SYSTEMID

if ! test -d "${RESULTSDIR}/$SYSTEMID"
then
    mkdir -p "${RESULTSDIR}/$SYSTEMID"
    do_system_description > "${RESULTSDIR}/$SYSTEMID"/systemid.txt
fi

for verb
do
    rm -rf "$YAGMARK_RESULTS"
    mkdir -p "$YAGMARK_RESULTS"

    RUNID=`date +%F-%H.%M.%S`
    echo running run_$verb
    run_$verb
    mkdir -p "${RESULTSDIR}/$SYSTEMID/$wineversion/$RUNID"
    mv "$YAGMARK_RESULTS"/* "${RESULTSDIR}/$SYSTEMID/$wineversion/$RUNID"
done

# Generate simple statistics.  This can be done at any time, 
# don't need to run it from inside here, but this is easy.
srcdir=`dirname $0`
srcdir=`cd $srcdir; pwd`
cd "{RESULTSDIR}/$SYSTEMID"
sh $srcdir/yagmark-stats.sh
exit 0
