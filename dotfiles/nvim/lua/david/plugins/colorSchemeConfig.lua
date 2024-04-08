return {
	"joshdick/onedark.vim",
	config = function()
		pcall(vim.cmd, 'colorscheme onedark')
		vim.g.onedark_termcolors=256
	end,
}


