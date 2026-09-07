-- By default, pressing <CR> in Snacks' git log pickers (git_log, git_log_file,
-- git_log_line / <leader>gb) runs `git checkout <commit> -- <file>`, which
-- overwrites the working file. This replaces that action with a read-only
-- commit viewer.

---@param picker snacks.Picker
---@param item snacks.picker.Item
local function show_commit(picker, item)
  picker:close()
  if not (item and item.commit) then
    return
  end
  local lines = vim.fn.systemlist({ "git", "-C", item.cwd or vim.fn.getcwd(), "show", item.commit })

  vim.cmd("new")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.bo.filetype = "git"
  vim.bo.buftype = "nofile"
  vim.bo.bufhidden = "wipe"
  vim.bo.modifiable = false
  vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = 0 })
end

return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        git_log = { confirm = show_commit },
        git_log_file = { confirm = show_commit },
        git_log_line = { confirm = show_commit },
      },
    },
  },
}
