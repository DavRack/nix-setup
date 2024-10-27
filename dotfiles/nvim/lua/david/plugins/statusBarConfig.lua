local exec = function(command)
	local handle = io.popen(command)
	local result = handle:read("*a"):gsub("\n","")
	handle:close()
	return result
end

getProjectName = function ()
	local basename = exec('basename $(git rev-parse --show-toplevel 2> /dev/null || pwd)""')
	return basename
end
return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'kyazdani42/nvim-web-devicons',
	},
	config = function()
		require('lualine').setup({
			options = {
				theme = bubbles_theme,
				component_separators = '|',
				section_separators = { left = '', right = '' },
			},
			sections = {
				lualine_a = {
					{ 'mode', separator = { left = '' }, right_padding = 2 },
				},
				lualine_b = {getProjectName, 'branch', 'diff', 'diagnostics' },
				lualine_c = { {'filename', path = 1} },
				lualine_d = {},
				lualine_x = {},
				lualine_y = { 'filetype' },
				lualine_z = {
					{ 'location', separator = { right = '' }, left_padding = 2 },
				},
			},
			tabline = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { require'tabline'.tabline_buffers },
				lualine_x = { require'tabline'.tabline_tabs },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end
}
