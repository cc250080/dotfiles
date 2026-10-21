return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local ok, configs = pcall(require, "nvim-treesitter.config")
    if not ok then
      vim.schedule(function()
        vim.notify("nvim-treesitter not available yet. Run :Lazy sync", vim.log.levels.WARN)
      end)
      return
    end

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "go", "yaml", "bash", "markdown" },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
 }


