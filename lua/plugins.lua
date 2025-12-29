vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { "akinsho/toggleterm.nvim", tag = '*', config = function()
        require("toggleterm").setup()
    end }

    use 'folke/which-key.nvim'

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', 
        },
    }

    use { 'rebelot/kanagawa.nvim' }

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use 'zaldih/themery.nvim'

    use 'lewis6991/gitsigns.nvim' 
    use 'romgrk/barbar.nvim'
    use 'tpope/vim-fugitive'

    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            use { 'williamboman/mason.nvim' },
            use { 'williamboman/mason-lspconfig.nvim' },
            use { 'neovim/nvim-lspconfig' },
            use { 'hrsh7th/nvim-cmp' },
            use { 'hrsh7th/cmp-nvim-lsp' },
            use { 'L3MON4D3/LuaSnip' },
        }
    }
end)
