vim.g.mapleader = " "
require("plugins")
require("telescope").setup({})
require("nvim-tree").setup()
require("gitsigns").setup()
require("mason").setup()
require("themery").setup({
    themes = { {
        name = "Day",
        colorscheme = "kanagawa-lotus",
    },
        {
            name = "Night",
            colorscheme = "kanagawa-dragon",
        } },
})
-- require("mason-lspconfig").setup({
--   ensure_installed = { "lua_ls", "ts_ls" },
--   handlers = {
--     lsp.default_setup,
--   },
-- })



-- Custom Keymaps Commands
vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>")
vim.keymap.set("n", "<leader>so", ":source<CR>")

-- Tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- GIT
vim.keymap.set("n", "<leader>gs", ":Git<CR>")

-- Barbar
vim.keymap.set("n", "<A-,>", ":BufferPrevious<CR>")
vim.keymap.set("n", "<A-.>", ":BufferNext<CR>")
vim.keymap.set("n", "<A-w>", ":BufferClose<CR>")
vim.keymap.set("n", "<A-1>", ":BufferGoto 1<CR>")
vim.keymap.set('n', '<A-2>', ':BufferGoto 2<CR>')
vim.keymap.set('n', '<A-3>', ':BufferGoto 3<CR>')
vim.keymap.set('n', '<A-4>', ':BufferGoto 4<CR>')
vim.keymap.set('n', '<A-5>', ':BufferGoto 5<CR>')
vim.keymap.set('n', '<A-6>', ':BufferGoto 6<CR>')
vim.keymap.set('n', '<A-7>', ':BufferGoto 7<CR>')
vim.keymap.set('n', '<A-8>', ':BufferGoto 8<CR>')
vim.keymap.set('n', '<A-9>', ':BufferGoto 9<CR>')

-- Telescope
vim.keymap.set("n", "<leader>ff", function()
  require("telescope.builtin").find_files()
end)

vim.keymap.set("n", "<leader>fg", function()
  require("telescope.builtin").live_grep()
end)
 
 -- Theme
 vim.cmd("colorscheme kanagawa")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true


vim.opt.tabstop = 4
vim.opt.softtabstop = 4

vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.updatetime = 50
