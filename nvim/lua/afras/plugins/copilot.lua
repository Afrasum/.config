return {
  "github/copilot.vim",
  config = function()
    if vim.fn.has("termguicolors") == 1 then
      vim.o.termguicolors = true
    end

    vim.g.copilot_no_tab_map = true
    
    -- Bruk den beste tilgjengelige modellen
    vim.g.copilot_model = "gpt-4o-copilot"
    
    -- Aktiver firetypes (sett til * for alle, eller spesifiser)
    vim.g.copilot_filetypes = { ["*"] = true }
    
    -- Full accept
    vim.api.nvim_set_keymap("i", "xx", 'copilot#Accept("<CR>")', { expr = true, noremap = true, silent = true })

    -- Next word
    vim.api.nvim_set_keymap("i", "<M-l>", "copilot#AcceptWord()", { expr = true, noremap = true, silent = true })
    vim.api.nvim_set_keymap("i", "<M-Right>", "copilot#AcceptWord()", { expr = true, noremap = true, silent = true })

    -- Full line
    vim.api.nvim_set_keymap("i", "<D-l>", "copilot#AcceptLine()", { expr = true, noremap = true, silent = true })
    vim.api.nvim_set_keymap("i", "<D-Right>", "copilot#AcceptLine()", { expr = true, noremap = true, silent = true })
  end,
}
