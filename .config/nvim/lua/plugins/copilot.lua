return {
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_no_tab_map = true

      vim.g.copilot_filetypes = {
        ["*"] = true,
        ["TelescopePrompt"] = false,
        ["NvimTree"] = false,
        ["lazy"] = false,
        ["mason"] = false,
      }

      vim.keymap.set('i', '<M-l>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false
      })
      vim.keymap.set('i', '<M-]>', '<Plug>(copilot-next)')
      vim.keymap.set('i', '<M-[>', '<Plug>(copilot-previous)')
    end,
  },
}
