-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- List all functions/classes/methods in the current file via LSP.
-- Populates and opens the location list; move with ]l / [l, close with :lclose.
vim.keymap.set("n", "gs", vim.lsp.buf.document_symbol, { desc = "Document symbols (location list)" })
