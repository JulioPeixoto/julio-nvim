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
        follow_current_file = true, -- Seguir o arquivo atual
        hijack_netrw_behavior = "open_current", -- Substituir o Netrw
      },
    }

    -- Abrir Neo-tree ao abrir um arquivo e fechar instâncias anteriores
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = function()
        if vim.bo.filetype ~= "neo-tree" and vim.bo.filetype ~= "" then
          require("neo-tree.command").execute { action = "show", toggle = false, dir = vim.fn.expand("%:p:h") }
        end
      end,
    })
  end,
}
