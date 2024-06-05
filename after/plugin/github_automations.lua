function get_git_commit()
    local filename = vim.fn.expand('%:p')
    local line_number = vim.fn.line('.')

    local git_blame_output = vim.fn.systemlist("git blame -L " .. line_number .. "," .. line_number .. ' ' .. filename .. ' | grep -Eo "^\\w+" | awk \'{print $1}\'')

    return git_blame_output[1]
end

function get_remote_url()
    remote_url = vim.fn.systemlist('git config --get remote.origin.url')[1]
    if is_ssh_url(remote_url) then
        return ssh_to_http(remote_url)
    end
    return remote_url
end

function open_github_commit()
    local github_url = get_remote_url() .. '/commit/' .. get_git_commit()
    print(github_url)
    vim.fn.jobstart({'xdg-open', github_url})
end

function ssh_to_http(url)
    local http_url = url:gsub("git@github.com:", "https://github.com/")
    return http_url:gsub("%.git$", "")
end


function is_ssh_url(url)
    if url:match("^git@") then
        return true
    else
        return false
    end
end

vim.api.nvim_set_keymap('n', '<leader>gc', ':lua open_github_commit()<CR>', {noremap = true, silent = true})
