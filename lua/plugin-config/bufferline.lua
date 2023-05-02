local ok, bufferline = pcall(require, 'bufferline')

if not ok then
    vim.notify('bufferline plugin not found')
    return
end

bufferline.setup({
    options = {
        -- 关闭 Tab 的命令，这里使用 moll/vim-bbyte 的 :Bdelete 命令
        close_command = 'Bdelete! %d',
        right_mouse_command = 'Bdelete! %d',
        -- 侧边栏设置
        -- 左边让出 nvim-tree 的位置，显示文字 File Explorer
        offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                highlight = 'Directory',
                text_align = 'left'
            }
        },
        diagnostics = 'nvim_lsp',
        -- 显示 LSP 报错图标
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = " "
                for e, n in pairs(diagnostics_dict) do
                    local sym = e == "error" and " " or (e == "warning" and " " or "")
                    s = s .. n .. sym
                end
            return s
        end,
    },
})
