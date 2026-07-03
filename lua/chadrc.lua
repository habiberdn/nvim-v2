local M = {}

M.ui = {
  theme = "onedark",
  statusline = {
    modules = {
      file = function()
        local path = vim.fn.expand "%:."
        if path == "" then
          return " [No Name] "
        end

        local devicons_present, devicons = pcall(require, "nvim-web-devicons")
        local icon = ""
        if devicons_present then
          local ext = vim.fn.expand "%:e"
          icon = devicons.get_icon(path, ext, { default = true }) .. " "
        end

        local modified = vim.bo.modified and " ◉" or ""
        return "%#St_file# " .. icon .. path .. modified .. " "
      end,
    },
  },
}

return M
