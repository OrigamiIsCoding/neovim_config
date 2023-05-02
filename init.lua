-- Neovim configuration file


-- Basic Settings
require('basic')

-- Keymap Settings
require('keybindings')

-- Plugin Settings
require('plugins')

-- Colorschme Settings
require('colorscheme')

-- Plugin Config
local plg_cfg = 'plugin-config.'
require(plg_cfg .. 'nvim-tree')
require(plg_cfg .. 'bufferline')
require(plg_cfg .. 'lualine')
require(plg_cfg .. 'telescope')
-- require(plg_cfg .. 'dashboard-v2')
-- require(plg_cfg .. 'project')
require(plg_cfg .. 'nvim-treesitter')
require(plg_cfg .. 'indent-blankline')
require(plg_cfg .. 'comment')
require(plg_cfg .. 'noice')
-- require(plg_cfg .. 'copilot')
require(plg_cfg .. 'code_runner')

-- Lsp Config
local lsp_cfg = 'lsp.'
require(lsp_cfg .. 'setup')
require(lsp_cfg .. 'cmp')
require(lsp_cfg .. 'ui')
