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


    -- fix window focusing when moving different windows like fugitive
    local group = vim.api.nvim_create_augroup("nnp_refocus_safe", { clear = true })
    local refocusing = false

    local function is_float(win) return vim.api.nvim_win_get_config(win).relative ~= "" end
    local function is_nnp(win)
      local buf = vim.api.nvim_win_get_buf(win)
      return vim.bo[buf].filetype == "no-neck-pain"
    end
    local function real_windows()
      local wins = {}
      for _, w in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        local c = vim.api.nvim_win_get_config(w)
        local b = vim.api.nvim_win_get_buf(w)
        if (c.relative == "" or c.relative == nil) and vim.bo[b].filetype ~= "no-neck-pain" then
          table.insert(wins, w)
        end
      end
      return wins
    end

    vim.api.nvim_create_autocmd("WinEnter", {
      group = group,
      callback = function()
        if refocusing then return end
        -- ignore floats
        local cfg = vim.api.nvim_win_get_config(0)
        if cfg and cfg.relative ~= "" then return end
        -- only try to refocus when there is exactly one real window
        if #real_windows() ~= 1 then return end
        -- only act when we actually landed in a side padding window
        if vim.bo.filetype ~= "no-neck-pain" then return end

        refocusing = true
        vim.schedule(function()
          local target
          local ok, nnp = pcall(require, "no-neck-pain")
          if ok and nnp and nnp.buffers and nnp.buffers.main and nnp.buffers.main.win
            and vim.api.nvim_win_is_valid(nnp.buffers.main.win) then
            target = nnp.buffers.main.win
          else
            -- fallback to first real window
            local wins = real_windows()
            target = wins[1]
          end
          if target then pcall(vim.api.nvim_set_current_win, target) end
          refocusing = false
        end)
      end,
    })


  end,
}
