---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup {
      close_if_last_window = true, -- Fecha o Neo-tree se for a última janela aberta
      filesystem = {
        follow_current_file = false, -- Desativa "seguir o arquivo atual" para evitar conflitos
        hijack_netrw_behavior = "open_current", -- Substituir o Netrw
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree").close_all()
          end,
        },
      },
    }
  end,
}
