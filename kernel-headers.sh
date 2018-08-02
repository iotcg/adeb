#! /bin/bash

#kernel target is build out of source tree

echo "####################################"
echo "MAKE SURE YOU ARE UNDER             "
echo "   KERNEL BUILT OUTPUT DIRECTORY    "
echo "####################################"

rm -rf kernel-headers
mkdir -p kernel-headers/{include,arch}

cp -arf source/include kernel-headers/
cp -arf include/* kernel-headers/include/

for dirdoc in `find arch/ -maxdepth 1  -type d | xargs -I '{}' basename {} | grep -v arch` 
do
	if [ -d source/arch/$dirdoc ]
	then
		cp -arf source/arch/$dirdoc kernel-headers/arch
	fi
done

for filedoc in `find arch -name '*.h'`; do dir_base=$(dirname ${filedoc}); mkdir -p kernel-headers/$dir_base; cp $filedoc kernel-headers/$dir_base; done
