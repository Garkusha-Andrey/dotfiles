-- gui
vim.opt.showmode      = false
vim.opt.cursorline    = true
vim.opt.number        = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.title         = true
vim.opt.foldenable    = false
vim.opt.linebreak     = true
vim.opt.pumblend      = 10
vim.opt.pumheight     = 15
vim.opt.wrap          = true
vim.opt.signcolumn    = 'number'
vim.opt.list          = true
vim.opt.listchars = {
    eol = ' ', -- ¬↴
    tab = '→ ', -- »-»
    extends = '…',
    precedes = '…',
    trail = '·', -- .
}

-- behavior
-- vim.opt.complete      = nil
vim.opt.completeopt   = 'menu,menuone,noselect'
vim.opt.grepprg       = 'rg --vimgrep --follow --no-heading'
vim.opt.hidden        = true
vim.opt.inccommand    = 'nosplit'
vim.opt.lazyredraw    = true
vim.opt.mouse         = 'c'
vim.opt.paste         = false
vim.opt.scrolloff     = 5
vim.opt.shortmess     = 'atToOc'
vim.opt.sidescrolloff = 10
vim.opt.timeoutlen    = 400
vim.opt.ttimeoutlen   = 50

-- tabs
vim.opt.tabstop       = 4
vim.opt.softtabstop   = 2
vim.opt.shiftwidth    = 2
vim.opt.expandtab     = true

-- mappings
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      --"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
        enable_git_status = true
      })
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true,  opts = ...},
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- Plugin configuration
require('lualine').get_config()
require('lualine').setup {}
