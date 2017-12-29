#!/bin/bash
path_dir=$1
match=$2
replace=$3

current_path=$(pwd)

if [  "$path_dir" == '/' ]; then
	echo "Fatal error : please check you path"
	exit 125
fi

replaceFileName ()
{

	local folder=$1
	cd $folder

	local array=(*)

	local files=${array[@]}

	for f in $files ; do
		if   [ -d "${f}" ];then

			local newfolder="$folder/$f"
			`replaceFileName $newfolder`

		elif [ -f "${f}" ];then
			local newfile="${f//$match/$replace}" 
			mv $f $newfile
		fi

	done
}

replaceFileName $path_dir

cd $current_path

echo "success"
