-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- unnamedplus: use system clipboard by default; osc52: use terminal OSC 52 as the clipboard provider (yanking inside docker shell or ssh)
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = "osc52"
