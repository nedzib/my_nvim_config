function get_git_commit()
    local filename = vim.fn.expand('%:p')
    local line_number = vim.fn.line('.')

    local git_blame_output = vim.fn.systemlist("git blame -L " .. line_number .. "," .. line_number .. ' ' .. filename .. ' | grep -Eo "^\\w+" | awk \'{print $1}\'')

    return git_blame_output[1]
end

function get_remote_url()
    return vim.fn.systemlist('git config --get remote.origin.url')[1]
end

function open_github_commit()
    local github_url = get_remote_url() .. '/commit/' .. get_git_commit()
    vim.fn.jobstart({'xdg-open', github_url})
end

function is_wsl()
    local file = io.open("/proc/sys/kernel/osrelease", "r")
    if file then
        file:close()
        return true
    else
        return false
    end
end

vim.api.nvim_set_keymap('n', '<leader>gc', ':lua open_github_commit()<CR>', {noremap = true, silent = true})
