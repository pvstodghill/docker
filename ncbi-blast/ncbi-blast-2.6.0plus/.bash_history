cd /usr/local/bin
ls
ls /usr/local/bin
cd /usr/local/bin/
for d in * ; do echo --- $d ----------------- ; ./$d < /dev/null ; sleep 1 ; done
cd /usr/local/bin/
for d in * ; do echo '' ; echo --- $d ----------------- ; ./$d < /dev/null ; sleep 1 ; done
