# Cheatsheet

## COMMANDS
| Command | Description |
| :--- | :--- |
| `bpill` | - |
| `bonsai` | - |
| `neofetch` | - |
| `ollama_serve` | - |
| `e_cs` | edit cs |
| `e_zsh` | edit zshrc |
| `dev_env` | opens tmux session with dev environment |

## TMUX
| Action | Keybinding |
| :--- | :--- |
| split panel | `ctrl+b %` (vertical), `ctrl+b "` (horizontal) |
| rename tmux pane | `ctrl+b ,` |

## NVIM
| Action | Command / Keybinding |
| :--- | :--- |
| mark file | `m` |
| search for file | `spc f f` |
| cheatsheet | `spc c h` |
| vertical and horizontal split | `:vps` and `:sp` |
| show numbers | `spc n` |
| search, text | `/texto_a_buscar` (n for next, N for prev) |
| search, word over cursor | `*` |
| comment python | visual mode, select line(s) and `gc` |
| refresh NVIM | `:e!` (current), `:bufdo e!` (all buffers) |
| go to end and beguining of line | `$` and `0` |
| go to next function | `]m` (start) `]M` (end) |
| go to prev function start | `[m` (start) `[M` (end) |
| go to next and prev section | `]]` and `[[` |
| find, first char | `fchar` |
| find, repeat last search and go back | `;` and `,` |
| create new line below and above | `o` and `O` |
| move to a line | `number g` |
| check current line | `ctrl+g` |
| substitute word | `:s/old/new` |
| substitute word in the whole line (globally) | `:s/old/new/g` |
| substitute word in the whole file | `:%s/old/new` |
| Telescope keymaps | `:Telescope keymaps` |
| Telescope, find help | `<space>fh` | 
| Telescope, find nvim config| `<space>fc` |
| Telescope, grep word | `<space>fw` |
| Telescope, quick fix list | `<C-q>` |
| search text | `/texto_a_buscar` . Siguiente con n para siguiente y N para anterior |
| terminal, open terminal | `spc v` (vertical term) or `spc h` (horizontal) |
| terminal, open floating terminal | `alt+i` |
| code, go to definition | `gd` # se mete en la función |
| code, search work in files (list references) | `gr r` |
| code, auto indent to righ | (gg - go to top) `=G` (indent till last line) |
| code, indent to righ or left | `>g` or `G` and `<g` or `G` |
| code, format code | `<space>fm` |
| git, telescope commits (checkout to that commit) | `spc cm` |
| buffers, see open buffers | `:ls` |
| buffers, go to next or prev buffers | `:bnext or :bprev` |
| tabs, open tab | `:tabedit` |
| tabs, go to next or prev tab | `gt or gT` |
| commands, list prev commands | `q:` |
| commands, repeat prev command | `@:` |

## NVIM - QUICKFIX LIST
| Action | Command / Keybinding |
| :--- | :--- |
| Open list | `:copen` |
| Close list | `:cclose` |
| Next item | `:cn` |
| Previous item | `:cp` |
| First item | `:cfirst` |
| Last item | `:clast` |
| Go to item number | `:cc [N]` (or `<CR>` inside list) |
| Older list | `:colder` |
| Newer list | `:cnewer` |
| Run cmd on all items | `:cdo <cmd>` |
| Run cmd on all files | `:cfdo <cmd>` |
| **Populate / Add** | |
| Search pattern (current file) | `:vimgrep /pat/ %` |
| Search pattern (all files) | `:vimgrep /pat/ **` |
| Search & Append to list | `:vimgrepadd ...` |
| Add file (error format) | `:caddfile <file>` |
| Add buffer (error format) | `:caddbuffer` |
| Telescope: Send to list | `<C-q>` |
| **Manage / Remove** | |
| Clear list | `:cexpr []` |
| Filter (keep pattern) | `:Cfilter /pat/` (needs `packadd cfilter`) |
| Filter (drop pattern) | `:Cfilter! /pat/` (needs `packadd cfilter`) |

## NVIM - FUGITIVE (Git)
| Action | Command / Keybinding |
| :--- | :--- |
| Open Git status | `:Git` or `:G` |
| Stage file/hunk (in status) | `s` |
| Unstage file/hunk (in status) | `u` |
| Toggle staged/unstaged (in status) | `-` |
| Discard changes (in status) | `X` |
| Commit staged changes (in status) | `cc` |
| Amend previous commit (in status) | `ca` |
| Stage current file | `:Gwrite` or `:Gw` |
| Revert current file (checkout) | `:Gread` |
| Delete file and buffer | `:GDelete` or `:GRemove` |
| Rename/move file | `:GRename` or `:GMove` |
| View diff (staged vs working) | `:Gdiffsplit` or `:Gvdiffsplit` |
| Three-way diff (merge conflicts) | `:Gdiffsplit!` |
| Diff obtain (stage from other) | `do` (in diff mode) |
| Diff put (unstage to other) | `dp` (in diff mode) |
| View blame for current file | `:Git blame` or `:Gblame` |
| View commit under cursor (in blame) | `<CR>` |
| Open file at specific commit | `:Gedit HEAD~3:%` |
| View log | `:Git log` |
| View log for current file | `:0Gllog` |
| Push (async) | `:Git! push` |
| Pull/fetch | `:Git pull` or `:Git fetch` |
| Create/switch branch | `:Git switch -c branchname` |
| Search in repo | `:Ggrep pattern` |
| Open file on GitHub/GitLab | `:GBrowse` |

## FZF
| Action | Command / Keybinding |
| :--- | :--- |
| fuzzy find history commands | `ctrl+r` |
| fuzzy find command options | command then `tab`, i.e. `git <tab>` |
| find files and open with vim | `fv` |

## GHOSTTY
| Action | Keybinding |
| :--- | :--- |
| open ghostty terminal | `ghostty` |
| reload changes | `ctrl+shft+,` |
| check commands | `ghostty +list-keybinds \| fzf` |


## OPENCODE
| Action | Keybinding |
| :--- | :--- |
| Undo Changes | `/undo` or `Ctrl+X U` |
| Redo Changes | `/redo` or `Ctrl+X R` |
