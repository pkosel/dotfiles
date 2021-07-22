local utils = require('utils')
local gl = require('galaxyline')
local condition = require('galaxyline.condition')
local gls = gl.section
local cur_section
gl.short_line_list = {'NvimTree'}

local colors = {
    bg = utils.get_hl_color('StatusLine', 'bg'),
    fg = utils.get_hl_color('StatusLine', 'fg'),
    black = utils.get_xresources_color('color0'),
    red = utils.get_xresources_color('color1'),
    green = utils.get_xresources_color('color2'),
    yellow = utils.get_xresources_color('color3'),
    blue = utils.get_xresources_color('color4'),
    magenta = utils.get_xresources_color('color5'),
    cyan = utils.get_xresources_color('color6'),
    white = utils.get_xresources_color('color7')
}

local function mode_color()
    local mode_colors = {
        -- LuaFormatter off
        n = colors.blue, no = colors.blue, nov = colors.blue, noV = colors.blue,
        ['no'] = colors.blue, niI = colors.blue, niR = colors.blue, niV = colors.blue,
        v = colors.magenta, V = colors.magenta, [''] = colors.magenta,
        s = colors.magenta, S = colors.magenta, [''] = colors.magenta,
        i = colors.green, ic = colors.green, ix = colors.green,
        R = colors.red, Rc = colors.red, Rv = colors.red, Rx = colors.red,
        c = colors.yellow, cv = colors.yellow, ce = colors.yellow,
        r = colors.cyan, rm = colors.cyan, ['r?'] = colors.cyan, ['!'] = colors.cyan,
        t = colors.yellow
        -- LuaFormatter on
    }

    return mode_colors[vim.fn.mode()]
end

-- reset
gls.left = {}
gls.mid = {}
gls.right = {}
gls.short_line_left = {}
gls.short_line_right = {}

-- left
cur_section = gls.left

table.insert(cur_section, {
    RainbowRed = {
        provider = function() return '▊ ' end,
        highlight = {colors.blue, colors.bg}
    }
})

table.insert(cur_section, {
    ViMode = {
        provider = function()
            local alias = {
                -- LuaFormatter off
                n = 'NORMAL', no = 'NORMAL', nov = 'NORMAL', noV = 'NORMAL',
                ['no'] = 'NORMAL', niI = 'NORMAL', niR = 'NORMAL', niV = 'NORMAL',
                v = 'VISUAL', V = 'VISUAL LINE', [''] = 'VISUAL BLOCK',
                s = 'SELECT', S = 'SELECT LINE', [''] = 'SELECT BLOCK',
                i = 'INSERT', ic = 'COMPLETION', ix = 'COMPLETION',
                R = 'REPLACE', Rc = 'REPLACE', Rv = 'REPLACE', Rx = 'REPLACE',
                c = 'COMMAND', cv = 'EX', ce = 'NORMAL EX',
                r = 'PROMPT', rm = 'PROMPT', ['r?'] = 'CONFIRM', ['!'] = 'SHELL',
                t = 'TERMINAL'
                -- LuaFormatter on
            }
            vim.api.nvim_command('hi GalaxyViMode guifg=' .. mode_color())
            return alias[vim.fn.mode()] .. ' '
        end,
        highlight = {colors.red, colors.bg, 'bold'}
    }
})

table.insert(cur_section, {
    FileSize = {
        provider = 'FileSize',
        condition = condition.buffer_not_empty,
        highlight = {colors.fg, colors.bg}
    }
})

table.insert(cur_section, {
    FileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        highlight = {
            require('galaxyline.provider_fileinfo').get_file_icon_color,
            colors.bg
        }
    }
})

table.insert(cur_section, {
    FileName = {
        provider = 'FileName',
        condition = condition.buffer_not_empty,
        highlight = {colors.magenta, colors.bg, 'bold'}
    }
})

table.insert(cur_section, {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.hide_in_width,
        icon = ' ',
        separator = '',
        highlight = {colors.green, colors.bg}
    }
})

table.insert(cur_section, {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.hide_in_width,
        icon = ' ',
        separator = '',
        highlight = {colors.blue, colors.bg}
    }
})

table.insert(cur_section, {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.hide_in_width,
        icon = ' ',
        separator = '',
        highlight = {colors.red, colors.bg}
    }
})

-- mid
cur_section = gls.mid

table.insert(cur_section, {
    ShowLspClient = {
        provider = 'GetLspClient',
        condition = function()
            local tbl = {['dashboard'] = true, [''] = true}
            if tbl[vim.bo.filetype] then return false end
            return vim.fn.winwidth(0) > 120
        end,
        icon = ' LSP:',
        highlight = {colors.cyan, colors.bg, 'bold'}
    }
})

-- right
cur_section = gls.right

table.insert(cur_section, {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        highlight = {colors.red, colors.bg, 'bold'}
    }
})

table.insert(cur_section, {
    DiagnosticWarn = {
        provider = 'DiagnosticWarn',
        icon = '  ',
        highlight = {colors.yellow, colors.bg, 'bold'}
    }
})

table.insert(cur_section, {
    DiagnosticHint = {
        provider = 'DiagnosticHint',
        icon = '  ',
        highlight = {colors.cyan, colors.bg, 'bold'}
    }
})

table.insert(cur_section, {
    DiagnosticInfo = {
        provider = 'DiagnosticInfo',
        icon = '  ',
        highlight = {colors.blue, colors.bg, 'bold'}
    }
})

table.insert(cur_section, {
    LineInfo = {
        provider = function()
            local line = vim.fn.line('.')
            local column = vim.fn.col('.')
            return string.format('%d:%d', line, column)
        end,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.fg, colors.bg}
    }
})

table.insert(cur_section, {
    PerCent = {
        provider = 'LinePercent',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.fg, colors.bg, 'bold'}
    }
})

table.insert(cur_section, {
    FileFormat = {
        provider = function()
            local format = vim.bo.fileformat
            if format == 'unix' then
                return ''
            elseif format == 'dos' then
                return ''
            elseif format == 'mac' then
                return ''
            end
            return ' ' .. format:upper()
        end,
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.green, colors.bg, 'bold'}
    }
})

table.insert(cur_section, {
    FileEncode = {
        provider = 'FileEncode',
        condition = condition.hide_in_width,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.green, colors.bg, 'bold'}
    }
})

table.insert(cur_section, {
    GitIcon = {
        provider = function() return '  ' end,
        condition = condition.check_git_workspace,
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.magenta, colors.bg, 'bold'}
    }
})

table.insert(cur_section, {
    GitBranch = {
        provider = 'GitBranch',
        condition = condition.check_git_workspace,
        highlight = {colors.magenta, colors.bg, 'bold'}
    }
})

table.insert(cur_section, {
    FillerSection = {
        provider = function() return '   ' end,
        highlight = {'NONE', colors.bg}
    }
})

-- short line left
cur_section = gls.short_line_left

table.insert(cur_section, {
    RainbowRed = {
        provider = function() return '▊ ' end,
        highlight = {colors.blue, colors.bg}
    }
})

table.insert(cur_section, {
    BufferType = {
        provider = 'FileTypeName',
        separator = ' ',
        separator_highlight = {'NONE', colors.bg},
        highlight = {colors.blue, colors.bg, 'bold'}
    }
})

table.insert(cur_section, {
    SFileName = {
        provider = 'SFileName',
        condition = condition.buffer_not_empty,
        highlight = {colors.fg, colors.bg, 'bold'}
    }
})

-- short line right
cur_section = gls.short_line_right

table.insert(cur_section, {
    BufferIcon = {provider = 'BufferIcon', highlight = {colors.fg, colors.bg}}
})

