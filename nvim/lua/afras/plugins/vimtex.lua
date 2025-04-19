-- Set the local leader key before loading plugins
vim.g.maplocalleader = ","

vim.env.NVIM_LISTEN_ADDRESS = "/tmp/nvimsocket"

return {
  {
    "lervag/vimtex",
    lazy = false, -- Load VimTeX immediately
    init = function()
      -- Use Skim as the PDF viewer on macOS
      vim.g.vimtex_view_method = "skim"

      -- Set the main file explicitly
      vim.g.vimtex_mainfile = "main.tex"

      -- Compilation method (auto compile on save)
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        continuous = 1, -- Automatically recompile on save
      }

      -- Quickfix window for compilation errors
      vim.g.vimtex_quickfix_mode = 2

      -- Mapping for compiling and opening PDF
      vim.api.nvim_set_keymap("n", "<leader>lc", ":VimtexCompile<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("n", "<leader>lv", ":VimtexView<CR>", { noremap = true, silent = true })
    end,
  },
  -- Add more plugins here, like snippets or LSP completion plugins
}
