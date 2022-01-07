echo "Symlinking dotfiles..."

project_dir=$1

for filename in ${project_dir}/home/.[!.]*; do
  ln -sv $filename ${HOME}/
done

echo "Done with dotfiles"
