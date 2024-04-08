
-- some useful functions
local exec = function(command)
	local handle = io.popen(command)
	local result = handle:read("*a"):gsub("\n","")
	handle:close()
	return result
end

local getPwd = function()
	local isGit = exec('git rev-parse --is-inside-work-tree 2> /dev/null')
	local pwd = vim.fn.expand('%:p:h')
	if isGit == 'true' then
		pwd = exec('git rev-parse --show-toplevel 2> /dev/null')
	end
	return pwd
end

local function aspectRatio()
  -- height and width are in terminal columns and rows
    local winwidth = vim.fn.winwidth(0)
    local winheight = vim.fn.winheight(0)
    return winwidth/winheight
end

local function getLayout_stategy()
  local ar = aspectRatio()
  if aspectRatio() > 2.2 then
    return "horizontal"
  else
    return "vertical"
  end
end

CustomFinders = {}
CustomFinders.search_project = function()
  require("telescope.builtin").find_files({
    prompt_title = "Files in Project"..getLayout_stategy(),
    cwd = getPwd(),
    hidden = true,
    layout_strategy=getLayout_stategy()
  })
end

CustomFinders.search_local = function()
  require("telescope.builtin").find_files({
    prompt_title = "Files in buffer folder",
    cwd = vim.fn.expand('%:p:h'),
    hidden = true,
    layout_strategy=getLayout_stategy(),
  })
end

CustomFinders.grep_project = function()
  require("telescope.builtin").live_grep({
    prompt_title = "Text in project files",
    cwd = getPwd(),
    hidden = true,
    layout_strategy=getLayout_stategy(),
  })
end

CustomFinders.grep_reference = function()
  require("telescope.builtin").live_grep({
    prompt_title = "<Find Files>",
    search = "test",
    cwd = getPwd(),
    hidden = true,
    layout_strategy=getLayout_stategy(),
  })
end

CustomFinders.goto_references = function()
  require("telescope.builtin").lsp_references({
    prompt_title = "<References>",
    layout_strategy=getLayout_stategy(),
  })
end

return {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'tpope/vim-fugitive',
    "BurntSushi/ripgrep",
    "sharkdp/fd",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require('telescope').load_extension('fzf')
      end
    }
  },
  config = function()
    require('telescope').setup({
      defaults = {
        file_ignore_patterns = {".git/","node_modules", "env/*"},
        color_devincons = true,
        file_sorter = require('telescope.sorters').get_fzf_sorter,
        layout_config = {
          vertical = {
            width = 0.98,
          },
          horizontal = {
            width = 0.98,
          },
        },
      },
      pickers = {},
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }
    })
  end
}
