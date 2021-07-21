local M = {}

function M.get_hl_color(group, attr)
    local id = vim.fn.synIDtrans(vim.fn.hlID(group))
    if not id then return end

    local color = vim.fn.synIDattr(id, attr)
    if not color or color == '' then return end

    return color
end

function M.get_xresources_color(c)
    local file = io.popen('xrdb -query | grep ' .. c .. ' -m 1 | cut -f 2')
    if not file then return end

    local color = file:read('*l')
    if not color or color == '' then return end

    return color
end

return M

