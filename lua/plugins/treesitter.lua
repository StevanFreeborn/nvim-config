return { 
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
  
    config.setup({
      auto_install = true,
      indent = { enabled = true },
      highlight = { enabled = true }
    })
  end
}
