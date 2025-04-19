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
vim.opt.clipboard = "unnamedplus"

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
    {
      "vim-test/vim-test",
    },
    {"tpope/vim-rails"},
    {"tpope/vim-fugitive"}, -- :Git commandが利用できる
    {"airblade/vim-gitgutter"}, -- 画面の中で差分に+, - が表示される
    {"nathanaelkane/vim-indent-guides"},
    {"tpope/vim-endwise"}, -- rails endを自動生成
    {"tpope/vim-surround"}, -- ' → "に変更が容易にできる
    {"bronson/vim-trailing-whitespace"},
    {"github/copilot.vim"}, -- whitespaceをhighlightする
    {"kamykn/spelunker.vim"},
    --
    --
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  { enabled = true, notify = false }
})

-- ==================================
-- setting
-- ==================================
vim.o.history = 1000
vim.o.timeoutlen = 100
vim.o.ttimeoutlen = 50
vim.o.autoread = true
vim.o.autowrite = true
vim.o.mouse = "a"
vim.o.ruler = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.number = true
vim.o.background = "dark"
vim.o.encoding = "utf8"
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.smartindent = true
vim.o.splitright = true

-- =============================
-- self settings
-- ============================
vim.g.loaded_matchparen = 1
vim.o.lazyredraw = true
vim.o.ttyfast = true
vim.o.synmaxcol = 150
vim.o.showcmd = true
vim.o.laststatus = 2
vim.o.smartcase = true
vim.o.autoindent = true
vim.o.expandtab = true
vim.o.clipboard = "unnamed"
vim.o.colorcolumn = "100"
vim.o.backspace = "indent,eol,start"

vim.opt.termguicolors = true

-- fzf-lua
-- https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#quickstart
vim.keymap.set("n", "<Space>f", ":FzfLua files<CR>")
vim.keymap.set("n", "<Space>r", ":FzfLua live_grep<CR>")
vim.keymap.set("n", "<Space>b", ":FzfLua buffers<CR>")
vim.keymap.set("n", "<Space>h", ":FzfLua oldfiles<CR>")
vim.keymap.set("n", "<Space>g", ":FzfLua grep<CR>")
vim.keymap.set("n", "<Space>k", ":FzfLua builtin commands<CR>")

-- keymap
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set("n", "<C-j>", "5j")
vim.keymap.set("n", "<C-k>", "5k")
vim.keymap.set("n", "<C-l>", "5l")
vim.keymap.set("i", "jj", "<Esc>", { silent = true })
vim.keymap.set("n", "yt", "viwy")
vim.keymap.set("n", "yr", 'viw"1y')
vim.keymap.set("n", "y1", '"1yy')
vim.keymap.set("n", "y2", '"2yy')
vim.keymap.set("n", "<C-r>1", '"1p')
vim.keymap.set("n", "<C-r>2", '"2p')
vim.keymap.set("n", "<C-w>g", "<C-w>gt")
vim.keymap.set("n", "<C-w>2", "<C-w>gT")
vim.keymap.set("n", "<C-w>t", ":tab term<CR>")
vim.keymap.set("n", "<C-w>e", ":term<CR>")
vim.keymap.set("n", "<C-w>gd", ":term ++close git diff<CR>")
vim.keymap.set("n", "<S-Tab>", "<C-w>:tabNext<CR>", { silent = true })
vim.keymap.set("n", "yl", ':let @+ = substitute(expand("%"), "spec/", "rspec spec/", "g")<cr>')
vim.keymap.set("n", "yk", 'viwy: %s/')

vim.keymap.set("n", "<Tab>l", "10<C-w>>")
vim.keymap.set("n", "<Tab>h", "10<C-w><")
vim.keymap.set("n", "<Tab>k", "10<C-w>+")
vim.keymap.set("n", "<Tab>j", "10<C-w>-")

-- Ntree
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>")

-- dadbod_ui
vim.g.dbs = {
  { name = 'dev', url = 'postgresql://127.0.0.1:5432/development?user=root&password=password' },
}

