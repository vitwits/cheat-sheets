# 📝 **Vim Cheat Sheet**

## 📂 **Basics**

| Command | Description |
|---------|-------------|
| **`:e <file_name>`** | Open a file for editing |
| **`:q`** | Quit Vim (if no changes have been made) |
| **`:q!`** | Quit without saving changes |
| **`:w`** | Save the current file |
| **`:wq`** | Save and quit the file |
| **`:x`** | Save and quit (same as `:wq`) |
| **`ZZ`** | Save and quit (same as `:wq`) |
| **`u`** | Undo the last action |
| **`Ctrl + r`** | Redo the last undone action |
| **`/ <pattern>`** | Search forward for a pattern |
| **`? <pattern>`** | Search backward for a pattern |
| **`n`** | Go to the next search result |
| **`N`** | Go to the previous search result |

## ⚙️ **Cursor Movement**

| Command | Description |
|---------|-------------|
| **`h`** | Move cursor left (one character) |
| **`j`** | Move cursor down (one line) |
| **`k`** | Move cursor up (one line) |
| **`l`** | Move cursor right (one character) |
| **`w`** | Move cursor to the beginning of the next word |
| **`b`** | Move cursor to the beginning of the previous word |
| **`0`** | Move cursor to the beginning of the current line |
| **`$`** | Move cursor to the end of the current line |
| **`gg`** | Move cursor to the beginning of the file |
| **`G`** | Move cursor to the end of the file |
| **`<line_number>G`** | Move cursor to the specified line number |
| **`Ctrl + d`** | Scroll down half a page |
| **`Ctrl + u`** | Scroll up half a page |

## 🧑‍💻 **Editing**

| Command | Description |
|---------|-------------|
| **`r <char>`** | Replace the character under the cursor with the specified character |
| **`cw`** | Change (replace) the current word |
| **`C`** | Change (replace) from the cursor to the end of the line |
| **`o`** | Open a new line below and enter insert mode |
| **`O`** | Open a new line above and enter insert mode |
| **`i`** | Enter insert mode before the cursor |
| **`I`** | Enter insert mode at the beginning of the line |
| **`a`** | Enter insert mode after the cursor |
| **`A`** | Enter insert mode at the end of the line |
| **`d`** | Start delete command |
| **`d <movement>`** | Delete text according to movement (e.g., `dw` to delete a word) |
| **`dgg`** | Delete everything from the cursor to the beginning of the file |
| **`dG`** | Delete everything from the cursor to the end of the file |
| **`dd`** | Delete the current line |
| **`4dd`** | Delete 4 lines starting from the current line |
| **`yy`** | Yank (copy) the current line |
| **`4yy`** | Yank (copy) 4 lines starting from the current line |
| **`yw`** | Yank (copy) the current word |
| **`p`** | Paste the yanked or deleted text after the cursor |
| **`P`** | Paste the yanked or deleted text before the cursor |

## ✨ **Useful Commands**

| Command | Description |
|---------|-------------|
| **`:set number`** | Show line numbers |
| **`:set paste`** | Paste text with original formatting |
| **`V`** | Select the current line |
| **`<` or `>`** | Shift selected text left or right |
| **`:s/old/new/g`** | Replace all occurrences of "old" with "new" in the current line |
| **`:%s/old/new/g`** | Replace all occurrences of "old" with "new" in the entire file |
| **`:noh`** | Clear search highlighting |
| **`:w <file_name>`** | Save the file with a new name |
| **`:!<command>`** | Run an external command from within Vim |

## 🔍 **Search and Replace**

| Command | Description |
|---------|-------------|
| **`/ <pattern>`** | Search forward for a pattern |
| **`? <pattern>`** | Search backward for a pattern |
| **`n`** | Go to the next search result |
| **`N`** | Go to the previous search result |
| **`:s/<old>/<new>/g`** | Replace all occurrences of "old" with "new" in the current line |
| **`:%s/<old>/<new>/g`** | Replace all occurrences of "old" with "new" in the entire file |

## 🔢 **Commands with Numbers**

| Command | Description |
|---------|-------------|
| **`<number>j`** | Move the cursor down by the specified number of lines |
| **`<number>k`** | Move the cursor up by the specified number of lines |
| **`<number>dd`** | Delete the specified number of lines |
| **`<number>yy`** | Yank (copy) the specified number of lines |
| **`<number>d`** | Delete the specified number of characters, words, or lines, depending on movement |
| **`<number>p`** | Paste the copied/deleted text after the cursor a specified number of times |

## 🚀 **Advanced Commands**

| Command | Description |
|---------|-------------|
| **`Ctrl + w`** | Window commands (e.g., split, close, etc.) |
| **`:split`** | Split the window horizontally |
| **`:vsplit`** | Split the window vertically |
| **`:resize <number>`** | Resize the window by the specified number of lines |
| **`:vertical resize <number>`** | Resize the window vertically by the specified number of columns |
| **`:tabnew`** | Open a new tab |
| **`:tabn`** | Switch to the next tab |
| **`:tabp`** | Switch to the previous tab |
| **`:tabnew <file>`** | Open a new tab with the specified file |

