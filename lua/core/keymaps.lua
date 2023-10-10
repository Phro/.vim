local keymap = vim.keymap

vim.g.mapleader = " "
keymap.set("", " ", "<Nop>")

local function swap_keymaps(mode, map1, map2, opts)
        keymap.set(mode, map1, map2, opts)
        keymap.set(mode, map2, map1, opts)
end

-- Vertical motion should follow display lines, not true lines.
swap_keymaps("", "j", "gj")
swap_keymaps("", "k", "gk")

-- Jump to the exact position of a mark using ' instead of `.
swap_keymaps("", "'", "`")

-- Go to beginning of line with 0
swap_keymaps("", "0", "^")

-- Enter command line mode with ;
swap_keymaps("", ":", ";")

-- Move between windows with alt
keymap.set("n", "<a-h>", "<c-w>h")
keymap.set("n", "<a-j>", "<c-w>j")
keymap.set("n", "<a-k>", "<c-w>k")
keymap.set("n", "<a-l>", "<c-w>l")
keymap.set("t", "<a-h>", "<c-\\><c-n><c-w>h")
keymap.set("t", "<a-j>", "<c-\\><c-n><c-w>j")
keymap.set("t", "<a-k>", "<c-\\><c-n><c-w>k")
keymap.set("t", "<a-l>", "<c-\\><c-n><c-w>l")

-- Paste to current indent level with p.
keymap.set("", "p", "]p")
keymap.set("", "<c-p>", "p")

-- Insert lines above or below current line.
keymap.set("","<Leader>O", function()
        return "mo" .. vim.v.count1 .. "O<Esc>`o"
end, { expr = true, })
keymap.set("","<Leader>o", function()
        return "mo" .. vim.v.count1 .. "o<Esc>`o"
end, {expr = true, })

-- Move lines vertically.
keymap.set("n", "-", function()
        return "mz:silent! move+" .. vim.v.count1 .. "<cr>`z"
end, { expr = true, })
keymap.set("n", "_", function()
        return "mz:silent! move-" .. vim.v.count1 + 1 .. "<cr>`z"
end, { expr = true, })
keymap.set("v", "-", function()
        return
                ":<c-u>silent!'<,'>move'>+" ..
                vim.v.count1 ..
                "<cr>`<my`>mzgv`yo`z"
end, { expr = true, })
keymap.set("v", "_", function ()
        return
                ":<c-u>silent!'<,'>move'<-" ..
                vim.v.count1 + 1 ..
                "<cr>`>my`<mzgv`yo`z"
end, { expr = true, })

-- Toggle spell checking
keymap.set("", "<Leader>ss", ":setlocal spell!<CR>")

-- Redraw the screen
keymap.set("", "<Leader>r", ":mode<CR>")
