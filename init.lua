  -- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

vim.opt.relativenumber = false -- Disable relative numbers
-------------- MACROS --------------
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true }) -- Copiar no modo visual
vim.api.nvim_set_keymap("n", "<C-c>", "ggVGy", { noremap = true, silent = true }) -- Copiar todo o arquivo no modo normal
-- Mapear Ctrl+Z para desfazer (undo) - geralmente já configurado
vim.api.nvim_set_keymap("n", "<C-z>", "u", { noremap = true, silent = true })
-- Mapear Ctrl+Y para refazer (redo)
vim.api.nvim_set_keymap("n", "<C-y>", "<C-r>", { noremap = true, silent = true })

vim.api.nvim_set_keymap(
  "n",
  "<C-LeftMouse>",
  "<Cmd>lua vim.lsp.buf.definition()<CR>",
  { noremap = true, silent = true }
)

require "lazy_setup"
require "polish"
