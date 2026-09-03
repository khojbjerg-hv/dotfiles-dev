-- Look for venv inside home instead of project dir
return {
  "linux-cultist/venv-selector.nvim",
  search = {
    home = {
      command = "fd '/bin/python$' $HOME/.venv --full-path --color never -I -H -L",
    },
  },
}
