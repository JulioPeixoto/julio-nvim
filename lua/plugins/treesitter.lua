-- Customize Treesitter

---@type 
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      -- add more arguments for adding more treesitter parsers
    },
    highlight = {
      enable = true, -- Habilitar realce de sintaxe
    },
  }
}