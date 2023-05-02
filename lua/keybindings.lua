-- `leader key` 就是常用的前缀，这里设置为空格
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 插件快捷键
local plugin_key = {}

-- Gloabl Keymap
local map = vim.api.nvim_set_keymap

local opt = { noremap = true, silent = true }
-- define mode
-- n : Normal, t : Terminal, v : Visual, i : Insert
local n, t, v, i = "n", "t", "v", "i"

-- 窗口管理快捷键映射

-- 取消 s 默认功能
map(n, "s", "", opt)

-- 分屏快捷键
map(n, "sv", ":vsp<CR>", opt)
map(n, "sh", ":sp<CR>", opt)
-- 关闭当前
map(n, "sc", "<C-w>c", opt)
-- 关闭其他
map(n, "so", "<C-w>o", opt)
-- Alt + hjkl 窗口之间跳转
map(n, "<A-h>", "<C-w>h", opt)
map(n, "<A-j>", "<C-w>j", opt)
map(n, "<A-k>", "<C-w>k", opt)
map(n, "<A-l>", "<C-w>l", opt)

-- 调整窗口比例
-- ":vertical resize -2<CR>" or ":resize -2<CR>"
local function resize(direction, op, val)
    if (direction == "v") then
        return ":vertical resize " .. op .. val .. "<CR>"
    else
        return ":resize " .. op .. val .. "<CR>"
    end
end

-- 左右比例
-- ctrl +  左右
map(n, "<C-Left>", resize("v", "+", 2), opt)
map(n, "<C-Right>", resize("v", "-", 2), opt)
map(n, "s,", resize("v", "-", 20), opt)
map(n, "s.", resize("v", "+", 20), opt)
-- 上下比例
-- ctrl + 上下
map(n, "<C-Down>", resize("h", "+", 2), opt)
map(n, "<C-Up>", resize("h", "-", 2), opt)
map(n, "sk", resize("h", "+", 10), opt)
map(n, "sj", resize("h", "-", 10), opt)
-- 等比例
map(n, "s=", "<C-w>=", opt)

-- Terminal 窗口
-- 打开 Terminal 窗口，默认打开 powershell
map(n, "<leader>t", ":sp | terminal powershell.exe<CR>", opt)
map(n, "<leader>vt", ":vsp | terminal powershell.exe<CR>", opt)
-- 退出 Terminal 窗口
map(t, "<Esc>", "<C-\\><C-n>", opt)
-- alt + hjkl 也可以退出
map(t, "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map(t, "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map(t, "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map(t, "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)


-- Visule 模式下的快捷键

-- 回撤 u 操作
map(v, "<leader>u", "<C-R>", opt)

-- visual 模式下缩进代码
map(v, "<S-Tab>", "<gv", opt)
map(v, "<Tab>", ">gv", opt)

-- 上下移动选中文本
map(v, "J", ":move '>+1<CR>gv-gv'", opt)
map(v, "K", ":move '<-2<CR>gv-gv'", opt)

-- 上下滚动浏览
map(n, "<C-j>", "4j", opt)
map(n, "<C-k>", "4k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map(n, "<C-u>", "9k", opt)
map(n, "<C-d>", "9j", opt)

-- insert 模式下，跳到行首行尾
map(i, "<C-h>", "<ESC>I", opt)
map(i, "<C-l>", "<ESC>A", opt)


-- bufferline
-- 左右 Tab 切换
map(n, "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map(n, "<C-l>", ":BufferLineCycleNext<CR>", opt)
-- 关闭 tab
map(n, "<C-w>", ":Bdelete!<CR>", opt)
map(n, "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map(n, "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map(n, "<leader>bc", ":BufferLinePickClose<CR>", opt)


-- telescope
-- 查找文件
map(n, '<C-p>', ":Telescope find_files<CR>", opt)
-- 全局搜索
map(n, '<C-f>', ':Telescope live_grep<CR>', opt)
-- telescop 列表中插入模式快捷键
plugin_key.telescope_list = {
    i = {
        -- 上下移动
        ['<C-j>'] = 'move_selection_next',
        ['<C-k>'] = 'move_selection_previous',
        ['<Down>'] = 'move_selection_next',
        ['<Up>'] = 'move_selection_previous',
        -- 历史记录
        ['<C-n>'] = 'cycle_history_next',
        ['<C-p>'] = 'cycle_history_prev',
        -- 关闭窗口
        ['<C-c>'] = 'close',
        -- 预览窗口上下移动
        ['<C-u>'] = 'preview_scrolling_up',
        ['<C-d>'] = 'preview_scrolling_down',
    }
}


-- nvim-tree
-- alt+m 打开关闭 tree
map(n, "<A-m>", ":NvimTreeToggle<CR>", opt)

-- copilot

-- code_runner
map(n, "<leader>rr", ":RunCode<CR>", opt)
map(n, "<leader>rc", ":RunClose<CR>", opt)

-- 列表快捷键
plugin_key.nvim_tree_list = {
    -- 打开文件或文件夹
    { key = { '<CR>', 'o', '<2-LeftMouse>' }, action = 'edit' },
    -- 分屏打开文件
    { key = 'v', action = 'vsplit' },
    { key = 'h', action = 'split' },
    -- 显示隐藏文件
    { key = 'i', action = 'toggle_custom' }, -- 对应 nvim-tree.lua 的 filters 中的 custom
    { key = 'i', action = 'toggle_dotfiles' },
    -- 文件操作
    { key = '<F5>', action = 'refresh' },
    { key = 'a', action = 'create' },
    { key = 'd', action = 'remove' },
    { key = 'r', action = 'rename' },
    { key = 'x', action = 'cut' },
    { key = 'p', action = 'paste' },
    { key = 's', action = 'system_open' }
}


map("n", "<leader>rn", ":Lspsaga rename<CR>", opt)
map("n", "<leader>ca", ":Lspsaga code_action<CR>", opt)
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opt)
map("n", "gh", ":Lspsaga hover_doc<cr>", opt)
map("n", "gr", ":Lspsaga lsp_finder<CR>", opt)
map("n", "gp", ":Lspsaga show_line_diagnostics<CR>", opt)
map("n", "gj", ":Lspsaga diagnostic_jump_next<cr>", opt)
map("n", "<leader>f", ":lua vim.lsp.buf.format { async = true } <CR>", opt)
map("n", "gk", ":Lspsaga diagnostic_jump_prev<cr>", opt)

plugin_key.map_lsp = function(mapbuf)
    -- rename
    --[[
        Lspsaga 替换 rn
        mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    --]]
    mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
    -- code action
    --[[
        Lspsaga 替换 ca
        mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    --]]
    mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
    -- go xx
    --[[
        mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
    --]]
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    --[[
        Lspsaga 替换 gh
        mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    --]]
    mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
    --[[
        Lspsaga 替换 gr
        mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    --]]
    mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
    --[[
        Lspsaga 替换 gp, gj, gk
        mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
        mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
        mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    --]]
    -- diagnostic
    mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
    mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
    mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.format { async = true } <CR>", opt)
    -- 未用
    -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

-- nvim-cmp
-- nvim-cmp 自动补全
plugin_key.cmp = function(cmp)
    return {
        -- 出现补全
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- 取消
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        -- 上一个
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- 下一个
        ["<C-j>"] = cmp.mapping.select_next_item(),
        -- 确认
        ["<Tab>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        -- 如果窗口内容太多，可以滚动
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    }
end


return plugin_key
