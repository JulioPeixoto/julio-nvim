return {
  -- Exemplos de Adição de Plugins
  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },
  -- Adicionar Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua",        -- Linguagens que você deseja instalar
        "vim",
        "javascript", -- Adicione outras linguagens conforme necessário
        "python",
      },
      highlight = {
        enable = true, -- Ativa o realce de sintaxe
      },
    },
    config = function()
      require('nvim-treesitter.install').compilers = { 'clang' } -- Configura o compilador
    end,
  },
  -- Exemplo de Sobrescrita de Plugins
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      opts.section.header.val = {
        " █████  ███████ ████████ ██████   ██████",
        "██   ██ ██         ██    ██   ██ ██    ██",
        "███████ ███████    ██    ██████  ██    ██",
        "██   ██      ██    ██    ██   ██ ██    ██",
        "██   ██ ███████    ██    ██   ██  ██████",
        " ",
        "    ███    ██ ██    ██ ██ ███    ███",
        "    ████   ██ ██    ██ ██ ████  ████",
        "    ██ ██  ██ ██    ██ ██ ██ ████ ██",
        "    ██  ██ ██  ██  ██  ██ ██  ██  ██",
        "    ██   ████   ████   ██ ██      ██",
      }
      return opts
    end,
  },
  -- Desabilitar Plugins Padrão
  { "max397574/better-escape.nvim", enabled = false },
  -- Customizar Configurações Adicionais de Plugins
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require("astronvim.plugins.configs.luasnip")(plugin, opts)
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require("astronvim.plugins.configs.nvim-autopairs")(plugin, opts)
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules({
        Rule("$", "$", { "tex", "latex" })
          :with_pair(cond.not_after_regex "%%")
          :with_pair(cond.not_before_regex("xxx", 3))
          :with_move(cond.none())
          :with_del(cond.not_after_regex "xx")
          :with_cr(cond.none()),
      }, Rule("a", "a", "-vim"))
    end,
  },
  -- Adicionar o Plugin de Autocompletar Comandos
  {
    "smolck/command-completion.nvim",
    event = "CmdlineEnter",
    config = function()
      require("command-completion").setup {
        -- Configurações opcionais
        border = "single",       -- Tipo de borda para a janela de conclusão
        max_col_num = 5,         -- Número máximo de colunas na janela de conclusão
        min_col_width = 20,      -- Largura mínima das colunas
        use_matchfuzzy = true,   -- Usar correspondência fuzzy para ordenar resultados
        highlight_selection = true, -- Realçar item selecionado
        highlight_directories = true, -- Realçar diretórios
        tab_completion = true,   -- Habilitar conclusão com Tab
      }
    end,
  }
}
