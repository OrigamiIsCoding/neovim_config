local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap

if fn.empty(fn.glob(install_path)) > 0 then
    vim.notify("正在安装Pakcer.nvim，请稍后...")
    paccker_bootstrap = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
        install_path,
    })

    -- https://github.com/wbthomason/packer.nvim/issues/750
    local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
    if not string.find(vim.o.runtimepath, rtp_addition) then
        vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
    end
    vim.notify("Pakcer.nvim 安装完毕")
end

local packer = require('packer')

packer.startup({
    function(use)
        -- 插件可以管理自己
        use 'wbthomason/packer.nvim'
        -- My plugins here

        -- colorscheme
        use 'tanvirtin/monokai.nvim'
        use 'folke/tokyonight.nvim'
        use 'ful1e5/onedark.nvim'

        -- 侧边栏插件
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
                'nvim-tree/nvim-web-devicons'
            }
        }
        -- tabs 插件
        use {
            'akinsho/bufferline.nvim',
            requires = {
                'kyazdani42/nvim-web-devicons',
                'moll/vim-bbye'
            }
        }

        -- lualine
        use {
            'nvim-lualine/lualine.nvim',
            requires = {
                'kyazdani42/nvim-web-devicons'
            }
        }
        use 'arkav/lualine-lsp-progress'

        -- telescope
        use {
            'nvim-telescope/telescope.nvim',
            requires = {
                'nvim-lua/plenary.nvim'
            }
        }
        -- telescope extensions
        use 'LinArcX/telescope-env.nvim'

        -- Dashboard
        -- use {
        --    'glepnir/dashboard-nvim',
        --     event = 'VimEnter',
        --     requires = {
        --         'nvim-tree/nvim-web-devicons'
        --     }
        -- }
        -- Dashboard 项目管理 BUG
        -- use 'ahmedkhalf/project.nvim'

        -- treesitter 语法高亮
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate"
        }

        -- Lsp config
        use 'williamboman/mason.nvim'
        use 'williamboman/mason-lspconfig.nvim'
        use 'neovim/nvim-lspconfig'
        -- Lsp Cmp
        -- 补全引擎
        use 'hrsh7th/nvim-cmp'
        -- snippet 引擎
        use 'hrsh7th/vim-vsnip'
        -- 补全源
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/cmp-nvim-lsp' -- { name = nvim_lsp }
        use 'hrsh7th/cmp-buffer' -- { name = 'buffer' },
        use 'hrsh7th/cmp-path' -- { name = 'path' }
        use 'hrsh7th/cmp-cmdline' -- { name = 'cmdline' }
        -- 增强 lsp 的 rename 等功能
        use 'tami5/lspsaga.nvim'

        -- 常见编程语言代码段
        use 'rafamadriz/friendly-snippets'

        -- 图标 ui
        use 'onsails/lspkind-nvim'

        -- 缩进线
        use 'lukas-reineke/indent-blankline.nvim'

        -- auto pairs
        use 'jiangmiao/auto-pairs'

        -- 注释增强
        use 'numToStr/Comment.nvim'

        -- surround
        use 'kylechui/nvim-surround'

        -- copilot
        -- use 'github/copilot.vim'

        -- notice.nvim 提示框
        use {
            'folke/noice.nvim',
            requires = {
                'MunifTanjim/nui.nvim',
                'rcarriga/nvim-notify',
            }
        }

        -- code runner
        use { 'CRAG666/code_runner.nvim', requires = 'nvim-lua/plenary.nvim' }

        if paccker_bootstrap then
            packer.sync()
        end
    end,

    config = {
        -- 并发数限制
        max_jobs = 16,
        -- 自定义 Github 源
        git = {
            -- default_url_format = "https://hub.fastgit.xyz/%s",
            -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
            -- default_url_format = "https://gitcode.net/mirrors/%s",
            -- default_url_format = "https://gitclone.com/github.com/%s",
            clone_timeout = 300
        },
        -- 安装路径
        -- package_root = 'D:/environment/vim/packer-plugins',
        display = {
            -- 以浮动窗口打开安装列表
            -- open_fn = function()
            --     return require('packer.util').float({ border = 'single' })
            -- end
        }
    }
})


-- 每次保存 plugins.lua 自动安装插件
-- pcall(
--    vim.cmd,
--    [[
--      augroup packer_user_config
--      autocmd!
--      autocmd BufWritePost plugins.lua source <afile> | PackerSync
--      augroup end
--    ]]
-- )
