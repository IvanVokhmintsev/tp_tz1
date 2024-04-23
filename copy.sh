srcRepo=$1
destRepo=$2


IFS=$'\n'
readarray -d '' files < <(find $srcRepo -mindepth 1  -maxdepth 1 -type f) # получение списка всех файлов, находящихся непосредственно во входной директории
readarray -d '' directories < <(find $srcRepo -mindepth 1 -maxdepth 1 -type d) # получение списка директорий, находящихся во входной директории
readarray -d '' allFiles  < <(find $srcRepo -mindepth 1 -type f) # получение списка всех файлов, вложенных во входную директорию

declare -A copiedFiles

for filePath in $allFiles 
do
    fileName=$(basename ${filePath})
    fileDirectory=$(dirname "$filePath")
    # Реализована HashMap, подсчитывающая количество файлов по названию. При добавлении файла, значение инкрементируется.
    # Если в HashMap уже есть файл с таким названием, то перед названием файла при копировании дописывается цифра в скобках
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
