# background.nvim
Simple plugin to automatically `set background` at after a certain hour.

## Install
#### Packer
```lua
use 'chris-burgin/background.nvim'
```
## Usage
```lua
require("background_nvim").setup()
```

### Advanced
```lua
require("background_nvim").setup({
  ms = 60000, -- default
  hour = 17 -- default
})
```
