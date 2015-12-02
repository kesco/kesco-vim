#! /bin/sh

echo "Copy newest vimrc files..."
current_dir=$(pwd)
for file in ~/.vimrc*; do
  fbname=$(basename "$file" | cut -c 2-)
  echo "Copy $file to $current_dir/$fbname ..."
  cp "$file" "$current_dir/$fbname"
  echo "done."
done

# Add to git tree
echo "Add to git repo..."
git add .

# git commit
echo "Git commit..."
git commit 
git push


