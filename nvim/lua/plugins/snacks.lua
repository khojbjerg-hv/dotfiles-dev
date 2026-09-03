return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      picker = {
        sources = {
          explorer = { hidden = true, ignored = true },
          files = { hidden = true, ignored = true },
        },
      },
    },
    config = function(_, opts)
      require("snacks").setup(opts)

      -- 2. Flatten and normalize path highlight groups
      local highlights = {
        Normal = {
          "SnacksPickerGitStatusAdded",
          "SnacksPickerGitStatusUntracked",
          "SnacksPickerGitStatusModified",
          "SnacksPickerGitStatusUnstaged",
          "SnacksPickerGitStatusStaged",
          "SnacksPickerGitStatusDeleted",
          "SnacksPickerGitStatusRenamed",
          "SnacksPickerGitStatusTypeChanged",
        },
        Comment = {
          "SnacksPickerPathIgnored",
          "SnacksPickerPathHidden",
          "SnacksPickerGitStatusIgnored",
        },
      }

      for link_to, groups in pairs(highlights) do
        for _, group in ipairs(groups) do
          vim.api.nvim_set_hl(0, group, { link = link_to })
        end
      end
    end,
  },
}
