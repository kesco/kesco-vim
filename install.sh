#! /bin/sh

# Check the vundle exist.
echo "Checking whether the Vundle Plugin exist..."
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  echo "The Vundle Plugin didn't install. Installing it..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  echo "Vundle Plugin Installed..."
else
  echo "OK... Detect the Vundle Plugin."
fi

echo "Checking the Vim temp directory exist..."
if [ ! -d ~/.vim/tmp ]; then
  echo "The temp directory didn't exist. Make the temp directory..."
  mkdir ~/.vim/tmp
  echo "Done..."
fi

# Copy vimrc files
for file in vimrc*; do
  echo "copy $file to ~/.$file ..."
  cp "$file" "${ZDOTDIR:-$HOME}/.${file}"
  echo "done."
done

echo "Kesco-vim installation complete."

