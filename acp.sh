function acp() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Oops! You forgot something :( Usage: acp <file_path> <commit_message>"
    return 1
  fi

  git add "$1"
  git commit -m "$2"
  git push
}
