return {
  "shortcuts/no-neck-pain.nvim",
  version = "*",
  opts = {
    width = 200,                 -- centered editing column
    buffers = { left = { enabled = true }, right = { enabled = true } },
    autocmds = { enableOnVimEnter = true },
    integrations = { NeoTree = { position = "centered" } },
    mappings = { enabled = false },
  },

  config = function(_, opts)
    require("no-neck-pain").setup(opts)

    -- add autocmd to refocus main buffer if we land in a side no-neck-pain window
    vim.api.nvim_create_autocmd("WinEnter", {
      callback = function()
        local ft = vim.bo.filetype
        if ft == "no-neck-pain" then
          local ok, nnp = pcall(require, "no-neck-pain")
          if ok and nnp and nnp.buffers and nnp.buffers.main and nnp.buffers.main.win then
            if vim.api.nvim_win_is_valid(nnp.buffers.main.win) then
              vim.api.nvim_set_current_win(nnp.buffers.main.win)
              return
            end
          end

          -- fallback: jump to first non no-neck-pain window
          for _, win in ipairs(vim.api.nvim_list_wins()) do
            local buf = vim.api.nvim_win_get_buf(win)
            if vim.bo[buf].filetype ~= "no-neck-pain" then
              vim.api.nvim_set_current_win(win)
              break
            end
          end
        end
      end,
    })
  end,
}
