#!/bin/sh

RPM=/bin/rpm
option="-q"
 
while true
do
        echo "what to query?"
        select var in   "All" "file" "package name"
        do
               case $var in
               All)
                       option=$option"a"
                       break
                      ;;
               file)
                       echo -n "please input file name: "
                       option=$option"f"
                       read argument
                       break
                      ;;
                package\ name)
                       echo -n "please input package name: "
                       read argument
                       break
                      ;;
               *)
                       echo "please choose between 1-3"
                      ;;
               esac
        done
 
        echo "what do you want to know?"
        select var in "location" "info" "package name"
        do
               case $var in
                location)
                       option=$option"l"
                       break
                      ;;
               info)
                       option=$option"i"
                       break
                      ;;
                package\ name)
                       break
                      ;;
               *)
                       echo "please choose between 1-3"
                      ;;
               esac
        done
 
        ${RPM}   $option $argument
 
        echo "continue? [yes/no]"
        read answer
 
        if [ answer = "no" ]
        then
               break
        fi
done
