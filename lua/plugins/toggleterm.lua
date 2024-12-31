---@type LazySpec
return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup {
        open_mapping = [[<C-/>]], -- Mapeia Ctrl + t
        direction = "horizontal",
        size = 15,
        shade_terminals = true,
        persist_size = true,
        start_in_insert = true
      }
    end
  }
  