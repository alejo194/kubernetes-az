vi findapikeybyname.sh
#!/bin/bash
file="/tmp/test/usernames.txt"
if [ -e $file ]
then
   echo "file is exist"
else
   echo "no file"
fi
if [ -s $file ]
then
   for name in `cat $file`
   do
      echo $name >> test.txt
      curl http://10.40.201.16:8001/consumers/$name/key-auth/ >> test.txt
   done
fi
