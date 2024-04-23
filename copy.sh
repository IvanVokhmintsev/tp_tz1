srcRepo=$1
destRepo=$2


IFS=$'\n'
readarray -d '' files < <(find $srcRepo -mindepth 1  -maxdepth 1 -type f)
readarray -d '' directories < <(find $srcRepo -mindepth 1 -maxdepth 1 -type d)
readarray -d '' allFiles  < <(find $srcRepo -mindepth 1 -type f)

declare -A copiedFiles

for filePath in $allFiles 
do
    fileName=$(basename ${filePath})
    fileDirectory=$(dirname "$filePath")
    if [ "${copiedFiles[$fileName]}" ]
    then
        counter=${copiedFiles[$fileName]}
        cp $filePath $destRepo/"($counter) "$fileName
        copiedFiles[$fileName]=$(($counter + 1))
    else
        copiedFiles[$fileName]=1
        cp $filePath $destRepo
    fi
done