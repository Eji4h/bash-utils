#!/bin/bash

buildTarget=''
if [[ $1 == '-a' ]] || [[ $1 == '--android' ]] || [[ $1 == '--Android' ]]; then
    echo "Build target is Android"
    buildTarget='Android'
fi

if [[ $1 == '-i' ]] || [[ $1 == '--ios' ]] || [[ $1 == '--iOS' ]]; then
    echo "Build target is iOS"
    buildTarget='iOS'
fi

buildTargetExtend=''

if [[ $buildTarget != '' ]]; then
    buildTargetExtend="-buildTarget $buildTarget"
fi

set -e
if [[ $(uname -r) =~ Microsoft$ ]]; then
    '/mnt/c/Program Files/Unity/Editor/Unity.exe' $buildTargetExtend
else
    case "$(uname -s)" in
    
       Darwin)
         /Applications/Unity/Unity.app/Contents/MacOS/Unity $buildTargetExtend
         ;;
    
       Linux)
         echo 'Linux'
         ;;
    
       *)
         echo 'other OS' 
         ;;
    esac
fi
