 #!/bin/bash

  DOT_FILES=(.vim .bash_profile .vimrc GNUPLOT.INI)

 for file in ${DOT_FILES[@]}
 do
     ln -s $HOME/dotfiles/$file $HOME/$file
 done
