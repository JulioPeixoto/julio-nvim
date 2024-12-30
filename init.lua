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
-------------- MACROS --------------
-- Mapear Ctrl+A para selecionar tudo no arquivo
vim.api.nvim_set_keymap("n", "<C-a>", "ggVG", { noremap = true, silent = true })

-- Copiar no modo visual com Ctrl+C
vim.api.nvim_set_keymap("v", "<C-c>", '"+y', { noremap = true, silent = true })

-- Copiar todo o arquivo no modo normal com Ctrl+C
vim.api.nvim_set_keymap("n", "<C-c>", "ggVGy", { noremap = true, silent = true })

-- Mapear Ctrl+Z para desfazer (undo) - geralmente já configurado
vim.api.nvim_set_keymap("n", "<C-z>", "u", { noremap = true, silent = true })

-- Mapear Ctrl+Y para refazer (redo)
vim.api.nvim_set_keymap("n", "<C-y>", "<C-r>", { noremap = true, silent = true })

-- Salvar com Ctrl+S
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

-- Ir para a definição com Ctrl + Clique Esquerdo
vim.api.nvim_set_keymap(
  "n",
  "<C-LeftMouse>",
  "<Cmd>lua vim.lsp.buf.definition()<CR>",
  { noremap = true, silent = true }
)

-- Seleciona toda a linha
vim.api.nvim_set_keymap("i", "<C-l>", "<Esc>^vg_<Esc>a", { noremap = true, silent = true })

require "lazy_setup"
require "polish"
