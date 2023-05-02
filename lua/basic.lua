local v = vim
-- utf8
v.g.encoding = "UTF-8"
v.o.fileencoding = 'utf-8'

-- jkhl 移动时光标周围保留8行
v.o.scrolloff = 6
v.o.sidescrolloff = 6

-- 使用相对行号
v.wo.number = true
v.wo.relativenumber = true

-- 高亮所在行
v.wo.cursorline = true

-- 显示左侧图标指示列
v.wo.signcolumn = "yes"

-- 右侧参考线，超过表示代码太长了，考虑换行
-- vim.wo.colorcolumn = "80"


-- 缩进 tab_len 个空格等于一个Tab
local space_width = 4
v.o.tabstop = space_width
v.bo.tabstop = space_width
v.o.softtabstop = space_width
v.o.shiftround = true

-- >> << 时移动长度
v.o.shiftwidth = space_width
v.bo.shiftwidth = space_width

-- 空格替代tab
v.o.expandtab = true
v.bo.expandtab = true

-- 新行对齐当前行
v.o.autoindent = true
v.bo.autoindent = true
v.o.smartindent = true


-- 搜索大小写不敏感，除非包含大写
v.o.ignorecase = true
v.o.smartcase = true
-- 搜索不要高亮
v.o.hlsearch = false
-- 边输入边搜索
v.o.incsearch = true


-- 命令行高为2，提供足够的显示空间
v.o.cmdheight = 2

-- 当文件被外部程序修改时，自动加载
v.o.autoread = true
v.bo.autoread = true

-- 允许显示不下自动折行
v.wo.wrap = true

-- 光标在行首尾时<Left><Right>可以跳到下一行
v.o.whichwrap = '<,>,[,]'

-- 允许隐藏被修改过的buffer
v.o.hidden = true

-- 鼠标支持
v.o.mouse = "a"

-- 禁止创建备份文件
local enable_backup = false
v.o.backup = enable_backup
v.o.writebackup = enable_backup
v.o.swapfile = enable_backup
v.o.undofile = enable_backup

-- smaller updatetime
v.o.updatetime = 300

-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
v.o.timeoutlen = 500

-- split window 从下边和右边出现
v.o.splitbelow = true
v.o.splitright = true

-- 自动补全不自动选中
v.g.completeopt = "menu,menuone,noselect,noinsert"

-- 样式
v.o.background = "dark"
v.o.termguicolors = true
v.opt.termguicolors = true

-- 不可见字符的显示，这里只把空格显示为一个点
v.o.list = true
-- vim.o.listchars = "space:·"

-- 补全增强
v.o.wildmenu = true

-- Dont' pass messages to |ins-completin menu|
v.o.shortmess = v.o.shortmess .. 'c'

-- 补全最多显示10行
v.o.pumheight = 10

-- 永远显示 tabline
v.o.showtabline = 2

-- 使用增强状态栏插件后不再需要 vim 的模式提示
v.o.showmode = false

-- 互通系统剪切板
v.o.clipboard= "unnamed,unnamedplus"

if v.g.neovide then
    -- Helper function for transparency formatting
    -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
    v.g.neovide_transparency = 0.9
    v.g.transparency = 0.9
end
