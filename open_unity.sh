#!/bin/bash
set -e
if grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null ; then
    '/mnt/c/Program Files/Unity/Editor/Unity.exe'
else
    case "$(uname -s)" in
    
       Darwin)
         echo 'Mac OS X'
         ;;
    
       Linux)
         echo 'Linux'
         ;;
    
       *)
         echo 'other OS' 
         ;;
    esac
fi
