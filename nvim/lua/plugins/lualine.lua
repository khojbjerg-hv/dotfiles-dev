return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.sections.lualine_z = {} -- Removes the clock in the status bar
  end,
}
