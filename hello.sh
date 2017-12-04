ls -a | grep -v "^\.git$" | grep "^\.[^\.].*$" | while read i ; do ln -s $PWD/$i ~ ; done
