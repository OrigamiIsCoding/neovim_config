local ok, project = pcall(require, 'project_nvim')

if not ok then
    vim.notify('project.nvim plugin not found')
    return
end

-- nvim-tree 支持
vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
    -- 检测项目的方法， pattern 表示使用下面的 patterns 来识别
    datection_methods = {
    },
    -- 当前目录有什么文件就识别为项目
    patterns = {
        '.git' ,
        'pom.xml',
        'package.json',
        'build.gradle',
        '_darcs',
        '.hg',
        '.bzr',
        '.svn',
        'Makefile',
        '.sln'
    },
    -- 项目历史存储在
    datapath = 'D:/environment/vim/telescope'
})

local ok, telescope = pcall(require, "telescope")
if not ok then
  vim.notify("telescope plugin not found")
  return
end
pcall(telescope.load_extension, "projects")
