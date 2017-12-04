ls -a | grep -v "^\.git$" | grep "^\.[^\.].*$" | while read i ; do rm -f ~/$i ; done
