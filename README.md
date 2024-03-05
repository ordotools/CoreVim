# CoreVim

![code size](https://img.shields.io/github/repo-size/corei8/CoreVim?style=flat-square)
![language](https://img.shields.io/github/languages/top/corei8/CoreVim?style=flat-square)
![frequency](https://img.shields.io/github/commit-activity/m/corei8/CoreVim?style=flat-square)

## About

This configuration is undergoing some major changes now, but will be optimized soon.

Currently Neovim starts in <75ms.

## Usage

Clone into `~/.config/nvim`:

```bash
git clone https://github.com/corei8/CoreVim/ ~/.config/nvim
```

## Keymapping

Collection of my most used key combinations.

| Key(s)          | Action                  |
|---:             |:---                     |
| ```<space>```   | leader                  |
| ```jj```        | Toggle Insert Mode      |
| ```<space>cc``` | comment out line        |
| ```<space>cu``` | uncomment line          |
| ```<space>ga``` | git add                 |
| ```<space>gc``` | git commit with message |
| ```<space>gp``` | git push                |
| ```<space>gl``` | git pull                |
| ```<space>ff``` | telescope find file     |
| ```<space>fb``` | telescope find buffer   |

LSP completion is by `<CR>`, and you can `<TAB>` and `<Shift+TAB>` to cycle through the suggestions

