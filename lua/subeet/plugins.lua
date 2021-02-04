vim.cmd [[packadd packer.nvim ]]

packer.startup(function()
    use {'wbthomason/packer.nvim', opt=true}
    use {
        'haorenW1025/completion-nvim',
        opt = true,
        requires = {{'hrsh7th/vim-vsnip', opt = true}, {'hrsh7th/vim-vsnip-integ', opt = true}}
    }
end)
