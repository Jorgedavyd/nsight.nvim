---@class CudaProfConfigManager
---@field opts CudaProfConfig
---@field setup fun(opts: CudaProfConfig?): nil
local M = {}

---@class CudaProfConfig
---@field session CudaProfSessionConfig
---@field extensions CudaProfExtensionConfig
---@field keymaps fun(buf): nil Configure the keymaps on CUDA file attachement.

---@class CudaProfExtensionConfig
---@field cli [string]

---@class CudaProfSessionConfig
---@field window CudaProfWindowConfig
---@field keymaps fun(bufnr: integer): nil
---@field resolve_triggers [string]

---@class CudaProfWindowConfig
---@field border? any this value is directly passed to nvim_open_win
---@field title_pos? any this value is directly passed to nvim_open_win
---@field title? string this value is directly passed to nvim_open_win
---@field height_in_lines? number this value is directly passed to nvim_open_win
---@field width_in_columns? number this value is directly passed to nvim_open_win
---@field style? string this value is directly passed to nvim_open_win

M.opts = {
    session = {
        window = {
            title = "Cuda Profiler",
            title_pos = "left",
            width_in_columns = 12,
            height_in_lines = 8,
            style = "minimal",
            border = "single"
        },
        keymaps = function (bufnr)
            vim.keymap.set("n", "<leader>cu", "echo Hola", {buffer = bufnr})
        end,
        resolve_triggers = {}
    },
    extensions = {
        cli = {}
    },
    keymaps = function (bufnr)
        vim.keymap.set("n", "<leader>cu", "echo Hola", {buffer = bufnr})
    end
}

function M.setup(opts)
    opts = opts or {}
    M.opts = vim.tbl_deep_extend('keep', opts, M.opts)
end

return M
