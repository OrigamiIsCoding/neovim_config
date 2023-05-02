local ok, copilot = pcall(require, 'copilot')

if not ok then
    vim.notify('copilot plugin not found')
    return
end

copilot.setup({

})
