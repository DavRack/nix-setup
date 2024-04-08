return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = {"BufReadPre", "BufNewFile"},
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects"
  },
  config = function()
    local treesitter = require('nvim-treesitter.configs')
    treesitter.setup({
      -- A list of parser names, or "all"
      ensure_installed = "all",

      -- exclude php due to error downloading
      ignore_install = { "phpdoc" },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
          scope_incremental = "grc"
        },
        module_path = "nvim-treesitter.incremental_selection"
      },
      textobjects = {
        select = {
          enable = true,  -- you can also use a table with list of langs here (e.g. { "python", "javascript" })
          keymaps = {
            -- You can use the capture groups defined here:
            -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/blob/master/queries/c/textobjects.scm
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ab"] = "@block.outer",
            ["ib"] = "@block.inner",
            ["as"] = "@statement.outer",
            ["is"] = "@statement.inner",
            ["ia"] = "@parameter.inner",
            ["aa"] = "@assignment.outer",
            ["is"] = "@scopename.inner",
            ["ic"] = "@call.inner",
            ["ac"] = "@call.inner",
            ["ik"] = "@class.inner",
            ["ak"] = "@class.inner",
          },
        },
      },
    })
  end,
}
