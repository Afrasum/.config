return {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "github/copilot.vim" },
    { "nvim-lua/plenary.nvim" },
  },
  build = "make tiktoken",
  config = function()
    require("CopilotChat").setup({
      debug = false,
      -- Model kan endres til nyere versjon når disse blir tilgjengelige
      model = "claude-3.7-sonnet", -- Bruk beste tilgjengelige modell
      prompt_prefix = "", -- Kan endres til noe hvis du vil ha prefiks
    })

    -- Tastebindinger for Copilot Chat
    vim.api.nvim_set_keymap("n", "<leader>cpc", ":CopilotChat<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>cpe", ":CopilotChatExplain<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>cpf", ":CopilotChatFix<CR>", { noremap = true, silent = true })
  end,
}

