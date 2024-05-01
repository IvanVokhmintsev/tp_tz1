Вам нужно написать скрипт на bash, который на вход принимает два параметра - две директории (`входная директория` и `выходная директория`).
Во `входной директории` могут находиться как файлы, так и вложенные директории (внутри которых тоже могут быть как файлы, так и папки) - уровень вложенности может быть любой.
Задача скрипта - "обойти" `входную директорию` и скопировать все файлы из нее (и из всех сложенных директорий) в `выходную директорию` - но уже без иерархии, а просто все файлы - внутри `выходной директории`.

Пример:

`Входная директория` = `/home/input_dir`; `Выходная директория` = `/home/output_dir`.

`/home/output_dir` изначально пустая.

Структура `/home/input_dir`: 
- input_dir
	- a.txt
	- dir2
		- b.txt
	 - dir3
   		- c.txt

Тогда после работы вашего скрипта структура `/home/output_dir` должна быть следующая: 
- output_dir
	- a.txt
 	- b.txt
  	- c.txt

Для запуска скрипта необходимо в консоле Bash прописать путь к скрипту и указать два параметра: первый - аудиторию, из которой необходимо скопировать файлы, второй - аудиторию, куда необходимо скопировать файлы