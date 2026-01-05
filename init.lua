vim.g.mapleader = " "
require("plugins")
require("telescope").setup({
    defaults = {
        find_command = {
            "fd",
            "--type", "f",
            "--color", "never",
            "--no-require-git",

            -- exclude folders for python/odoo project
            "--exclude", "venv",
            "--exclude", ".venv",
            "--exclude", "__pycache__",
            "--exclude", "env",
            "--exclude", ".env",
            "--exclude", "filestore",
            "--exclude", "sessions",
            "--exclude", "database",
            "--exclude", ".git",
        },
        file_ignore_patterns = {
            "__pycache__",
            "filestore",
            "sessions",
            ".tmp",
            "temp",
            "%.tx",
            "%.zed",
            "%.vim",
            "%.vscode",
            "%.idea",
            "node_modules",
            "%.next",
            "%dist",
            "%.git",
            "%.cache",
            "%venv",
            "%.venv",
            ".mypy_cache",
            ".pytest_cache",
            ".ruff_cache",
            ".eggs",
            ".nuxt",
            ".svelte-kit",
            ".vite",
            ".turbo",
            ".parcel-cache",
            ".eslintcache",
            ".docker",
            ".dockerignore",
            "terraform/.terraform",
            "vendor"
        },
        pickers = {
            find_files = {
                find_command = { "fd", "--type", "f", "--color", "never", "--no-require-git" }
            }
        }
    },
})
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


-- LSP
require('mason-lspconfig').setup({
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
    },
})

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
    filetypes = { 'lua' },
})

vim.lsp.config('prettier', {
    filetypes = { 'javascript', 'typescript', 'typescriptreact' },
})

vim.lsp.config('lemminx', {
    filetypes = { 'xml' }
})

require('copilot').setup({
    suggestion = { enabled = true },
    panel = { enabled = false },
})

require('smear_cursor').setup({
    smear_between_buffers = true,

    smear_between_neighbor_lines = true,

    scroll_buffer_space = true,

    legacy_computing_symbols_support = false,

    smear_insert_mode = true,

    cursor_color = '#d3cdc3',
})


require('blink.cmp').setup({
    keymap = {
        preset = 'default',
        ['<C-y>'] = { 'accept', 'fallback' },
        -- ['<CR>'] = { 'accept', 'fallback' },
    },

    appearance = {
        nerd_font_variant = 'mono',
        use_nvim_as_default = true
    },

    completion = {
        documentation = { auto_show = true }
    },

    fuzzy = {
        implementation = "lua"
    },
    opts_extend = { "sources.default" },
    signature = { enabled = true },
    providers = {
        copilot = { name = "copilot", module = "copilot.suggestion", async = true }
    }
})

local dap = require('dap')
local dapui = require('dapui')
local dap_python = require('dap-python')

dapui.setup()

require('dap.ext.vscode').load_launchjs(nil, {
    python = { 'python' }
})

dap_python.setup("C:/Users/ahmad/OneDrive/Documents/odoo-fixco/.venv/Scripts/python.exe")

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

vim.g.VM_maps = {
    ['Find Under'] = '<C-n>',
    ['Find Subword Under'] = '<C-n>',
}


vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)

vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>B', function()
    dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end)

vim.keymap.set('n', '<leader>dr', dap.repl.open)
vim.keymap.set('n', '<leader>dc', dap.terminate)


-- LSP Keymaps
local opts = { noremap = true, silent = true, buffer = bufnr }

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)

vim.keymap.set('n', '<leader>f', function()
    vim.lsp.buf.format({ async = true })
end, opts)


-- Custom Keymaps Commands
vim.keymap.set("n", "<leader>ps", ":PackerSync<CR>")
vim.keymap.set("n", "<leader>so", ":source<CR>")

-- Tree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- GIT
vim.keymap.set("n", "<leader>gs", ":Git<CR>")
vim.keymap.set("n", "<leader>gm", ":Git commit<CR>")
vim.keymap.set("n", "<leader>gp", ":Git push<CR>")

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

vim.keymap.set("n", "<leader>ft", function()
    require("telescope.builtin").colorscheme({ enable_preview = true })
end)

-- Theme
-- vim.cmd("colorscheme kanagawa")


-- Copy & Paste
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })


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

vim.api.nvim_set_keymap(
    "i",
    "<C-CR>",
    'copilot#Accept("<CR>")',
    { silent = true, expr = true }
)
