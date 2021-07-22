return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {'b3nj5m1n/kommentary', config = [[require('config.kommentary')]]} -- done
    use {'glepnir/galaxyline.nvim', config = [[require('config.galaxyline')]]} -- done
    use 'junegunn/vim-easy-align'
    use 'kyazdani42/nvim-web-devicons'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'machakann/vim-sandwich'
    use {'neovim/nvim-lspconfig', config = [[require('config.nvim-lspconfig')]]} -- done
    use {
        'nvim-treesitter/nvim-treesitter',
        config = [[require('config.nvim-treesitter')]],
        run = ':TSUpdate'
    } -- done

    use {'challenger-deep-theme/vim', as = 'challenger-deep'}
    use 'folke/tokyonight.nvim'
end)

