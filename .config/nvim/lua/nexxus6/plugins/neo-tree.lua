return {
     "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        source_selector = {
            winbar = true,
            statusline = false
        }
      })
    end
}
