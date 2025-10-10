# Neovim Config

## Installation
```sh
gh repo clone eliasericsson/nvim ~/.config/nvim
```

## Essential Keymaps

**Leader key:** `<Space>`

### Navigation & Editing
- `jj` - Exit insert mode
- `<leader>pv` - File explorer (netrw)
- `J/K` (visual) - Move lines up/down
- `<C-d>/<C-u>` - Half page down/up (centered)
- `n/N` - Next/prev search (centered)

### Copy/Paste
- `<leader>y` - Yank to system clipboard
- `<leader>p` (visual) - Paste without yanking
- `<leader>d` - Delete without yanking

### File Operations
- `<leader>w` - Save
- `<leader>q` - Quit
- `<leader>f` - Format buffer

### Telescope
- `<Space>fd` - Find files
- `<Space>fg` - Live grep (multigrep)
- `<Space>fh` - Help tags
- `<Space>en` - Edit nvim config

### Harpoon
- `<leader>a` - Add file to harpoon
- `<C-e>` - Toggle harpoon menu
- `H/L/N/S` - Navigate to files 1-4

### Git (Fugitive)
- `<leader>gs` - Git status
- `<leader>gp` - Git push
- `<leader>gP` - Git pull
- `<leader>nc/pc` - Next/prev conflict

### Diagnostics (Trouble)
- `<leader>xx` - Toggle diagnostics
- `<leader>xs` - LSP symbols
- `gR` - LSP references

### Todos
- `<leader>tc` - Search todos (telescope)
- `<leader>tn/tp` - Next/prev todo

### Other
- `<leader>u` - Undotree
- `<leader>z` - Focus mode (no-neck-pain)
- `<leader>s` - Search & replace word under cursor

