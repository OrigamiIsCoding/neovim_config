
local colorscheme = 'monokai'
local ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)

if not ok then
    vim.notify('colorscheme ' .. colorscheme .. ' not found! see configuration: lua/colorscheme.lua')
    return
end

local export = {}

export.colorscheme = colorscheme

return export
