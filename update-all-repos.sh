for directory in h5p-*/ ; do
  echo "Updating $directory"
  git fetch
  git pull --rebase
done
