ls -a | grep -v "^\.git$" | grep "^\.[^\.].*$" | while read i ; do [ ! -e "$HOME/$i" ] && ln -s $PWD/$i $HOME ; done
