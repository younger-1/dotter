#!/usr/bin/env bash
#
# http://ix.io/
#
# Examples:
#     ix hello.txt              # paste file (name/ext will be set).
#     echo Hello world. | ix    # read from STDIN (won't set name/ext).
#     ix -n 1 self_destruct.txt # paste will be deleted after one read.
#     ix -i ID hello.txt        # replace ID, if you have permission.
#     ix -d ID

# NAME
#     ix: command line pastebin.
# TL;DR
#     ~$ echo Hello world. | curl -F 'f:1=<-' ix.io
#     http://ix.io/fpW
# GET
#     ix.io/ID
#         raw
#     ix.io/ID/
#         default syntax language (by filetype, if provided)
#         append #n-LINENO to link directly to a particular line
#         uses pygments, see pygments documentation for details
#     ix.io/ID/LANG
#         explicitly set language
#     ix.io/ID+
#         console highlighting (default)
#     ix.io/ID+LANG
#         console highlighting (explicitly set language)
#     ix.io/user/USER
#         pastes from USER
#     ix.io/user/
#         last 100 anonymous pastes
# POST
#     ix.io/
#         f:N    contents or attached file.
#         id:N   id to replace. login required if used.
#         name:N set filename (if f:N is not attached).
#         ext:N  set filetype (eg .txt, if f:N is not attached).
#         read:N set number of reads allowed before deletion.
#         rm     id to delete. login required if used.
#     where N is a unique number within request. (This allows you to post
#     multiple files at once.)
#     Use Basic-Auth to login. If the login does not exist, it will be created.
#     Don't use an important password, this is not secure.
#     returns: http://ix.io/id for N in request
# PUT
#     ix.io/ID
#         replace ID. authentication required
# DELETE
#     ix.io/ID
#         delete ID. authentication required
# EXAMPLES
#     Anonymous, unnamed paste, two ways:
#         cat file.ext | curl -F 'f:1=<-' ix.io
#         curl -F 'f:1=@file.ext' ix.io
#     Nonymous, using .netrc for auth:
#        curl -n -F 'f:1=@file.ext' ix.io
#     Delete ID, two ways:
#         curl -n -X DELETE ix.io/ID
#         curl -F 'rm=ID' USER:PASS@ix.io
#     Replace ID, two ways:
#         curl -n -X PUT -F 'f:1=@file.ext' ix.io/ID
#         cat file.ext | curl -F 'f:1=<-' -F 'id:1=ID' USER:PASS@ix.io
#     Paste that can be only be read twice:
#         cat file.ext | curl -F 'f:1=<-' -F 'read:1=2' ix.io


ix() {
    local opts
    local OPTIND
    [ -f "$HOME/.netrc" ] && opts='-n'
    while getopts ":hd:i:n:" x; do
        case $x in
            h) echo "ix [-d ID] [-i ID] [-n N] [opts]"; return;;
            d) $echo curl $opts -X DELETE ix.io/$OPTARG; return;;
            i) opts="$opts -X PUT"; local id="$OPTARG";;
            n) opts="$opts -F read:1=$OPTARG";;
        esac
    done
    shift $(($OPTIND - 1))
    [ -t 0 ] && {
        local filename="$1"
        shift
        [ "$filename" ] && {
            curl $opts -F f:1=@"$filename" $* ix.io/$id
            return
        }
        echo "^C to cancel, ^D to send."
    }
    curl $opts -F f:1='<-' $* ix.io/$id
}

ix $*
