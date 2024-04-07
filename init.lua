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
vim.opt.complete      = nil
vim.opt.completeopt   = 'menu,menuone,noselect'
vim.opt.grepprg       = 'rg --vimgrep --follow --no-heading'
vim.opt.hidden        = true
vim.opt.inccommand    = 'nosplit'
vim.opt.lazyredraw    = true
vim.opt.mouse         = 'a'
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

-- Plug manager is lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
--    config = function ()
--    require("neo-tree").setup({
--      config = function ()
--      enable_git_status = true,
--    })
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
  }
}
)

-- Plugin configuration
require('lualine').get_config()
require('lualine').setup()
