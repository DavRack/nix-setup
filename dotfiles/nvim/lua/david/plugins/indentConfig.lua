return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		vim.opt.list = true
		
		require("ibl").setup {
		  scope = {
		    enabled = true,
		    highlight = { "Function", "Label" },
		  }
		}
	end
}
