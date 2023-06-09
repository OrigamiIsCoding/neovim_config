local ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not ok then
    vim.notify('nvim-treesitter plugin not found')
    return
end

treesitter.setup({
    -- 安装 language parser
    -- :TSInstallInfo 查看支持的语言
    ensure_installed = {
        -- C
        'c',
        'cpp',
        'cmake',

        -- Script
        'vim',
        'lua',
        'python',
        'javascript',
        'typescript',
        'bash',

        -- FrontEnd
        'vue',
        'html',

        -- Config File
        'json',
        'toml',
        'yaml',
        'dockerfile',

        -- Jvm
        'java',
        'kotlin',
        'scala',

        -- Other
        'rust',
        'go',
        'gomod',

        -- regex
        'regex'
    },
    -- 启用代码高亮模块
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    -- 启用增量选择模块
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>'
        }
    },
    -- 启用代码缩进模块 (=)
    indent = {
        enable = true,
    }
})


-- 开启 Folding 模块
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不要折叠
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99
