local ok, telescope = pcall(require, 'telescope')
if not ok then
    vim.notify('telescope plugin not found')
    return
end

telescope.setup({
    defaults = {
        -- 打开弹窗后进入的初始模式，默认为 insert，也可以是 normal
        initial_mode = 'insert',
        -- 窗口内快捷键
        mappings = require('keybindings').telescope_list
    },
    pickers = {
        -- 内置 pickers 配置
        find_files = {
            -- 查找文件皮肤，有 dropdown, cursor, ivy
            theme = 'ivy'
        }
    },
    extensions = {
        -- 扩展插件配置
    }
})

-- telescope extensions
local ok, _ = pcall(telescope.load_extension, 'env')
if not ok then 
    vim.notify('telescope env extension load failed')
end
