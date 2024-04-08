return {
  'kdheepak/tabline.nvim',
  dependencies = {
    'hoob3rt/lualine.nvim',
    'kyazdani42/nvim-web-devicons',
  },
  config = function()
    require('tabline').setup({
      enable = true
    })
  end
}
