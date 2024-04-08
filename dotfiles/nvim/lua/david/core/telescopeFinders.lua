-- some useful functions
local exec = function(command)
	local handle = io.popen(command)
	local result = handle:read("*a"):gsub("\n","")
	handle:close()
	return result
end

local getPwd = function()
	local isGit = exec('git rev-parse --is-inside-work-tree 2> /dev/null')
	if isGit == 'true' then
		pwd = exec('git rev-parse --show-toplevel 2> /dev/null')
	else 
		pwd = vim.fn.expand('%:p:h')
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
  print(ar)
  if aspectRatio() > 2.2 then
    return "horizontal"
  else
    return "vertical"
  end
end

local customFinders = {}
customFinders.search_project = function()
  require("telescope.builtin").find_files({
    prompt_title = "Files in Project"..getLayout_stategy(),
    cwd = getPwd(),
    hidden = true,
    layout_strategy=getLayout_stategy()
  })
end

customFinders.search_local = function()
  require("telescope.builtin").find_files({
    prompt_title = "Files in buffer folder",
    cwd = vim.fn.expand('%:p:h'),
    hidden = true,
    layout_strategy=getLayout_stategy(),
  })
end

customFinders.grep_project = function()
  require("telescope.builtin").live_grep({
    prompt_title = "Text in project files",
    cwd = getPwd(),
    hidden = true,
    layout_strategy=getLayout_stategy(),
  })
end

customFinders.grep_reference = function()
  require("telescope.builtin").live_grep({
    prompt_title = "<Find Files>",
    search = "test",
    cwd = getPwd(),
    hidden = true,
    layout_strategy=getLayout_stategy(),
  })
end

customFinders.goto_references = function()
  require("telescope.builtin").lsp_references({
    prompt_title = "<References>",
    layout_strategy=getLayout_stategy(),
  })
end

return customFinders
