# 📝 **Tmux Cheat Sheet**

## 📂 **Session Management**

| Command | Description |
|---------|-------------|
| **`tmux`** | Start a new tmux session |
| **`tmux new-session -s <session_name>`** | Start a new session with a custom name |
| **`tmux attach`** | Attach to the most recent session |
| **`tmux attach -t <session_name>`** | Attach to a specific session |
| **`tmux list-sessions`** | List all tmux sessions |
| **`tmux kill-session -t <session_name>`** | Kill a specific session |
| **`tmux kill-session`** | Kill the current session |
| **`tmux rename-session -t <old_name> <new_name>`** | Rename the session |
| **`Ctrl + b` then `d`** | Detach from the current session |

## 🧑‍💻 **Window Management**

| Command | Description |
|---------|-------------|
| **`Ctrl + b` then `c`** | Create a new window |
| **`Ctrl + b` then `w`** | List all windows |
| **`Ctrl + b` then `n`** | Switch to the next window |
| **`Ctrl + b` then `p`** | Switch to the previous window |
| **`Ctrl + b` then `<window_number>`** | Switch to a specific window |
| **`Ctrl + b` then `,`** | Rename the current window |
| **`Ctrl + b` then `&`** | Close the current window |
| **`Ctrl + b` then `0-9`** | Switch to windows numbered 0-9 |

## 🔲 **Pane Management**

| Command | Description |
|---------|-------------|
| **`Ctrl + b` then `%`** | Split the window vertically (create a new pane) |
| **`Ctrl + b` then `"`** | Split the window horizontally (create a new pane) |
| **`Ctrl + b` then `o`** | Switch between panes |
| **`Ctrl + b` then `;`** | Toggle between the last two panes |
| **`Ctrl + b` then `x`** | Close the current pane |
| **`Ctrl + b` then `<arrow>`** | Navigate between panes (up, down, left, right) |
| **`Ctrl + b` then `z`** | Toggle zoom for the current pane (maximize it) |

## 🔁 **Pane Resizing**

| Command | Description |
|---------|-------------|
| **`Ctrl + b` then `Alt + <arrow>`** | Resize the current pane (up, down, left, right) |

## 🧑‍💻 **Session Navigation**

| Command | Description |
|---------|-------------|
| **`Ctrl + b` then `(`** | Switch to the previous session |
| **`Ctrl + b` then `)`** | Switch to the next session |
| **`Ctrl + b` then `:`** | Open command prompt for tmux commands |
| **`Ctrl + b` then `t`** | Show the current time in a popup |

## 📋 **Copy Mode**

| Command | Description |
|---------|-------------|
| **`Ctrl + b` then `[`** | Enter copy mode |
| **`<arrow keys>`** | Move the cursor in copy mode |
| **`Space`** | Start selection in copy mode |
| **`Enter`** | Copy the selected text |
| **`q`** | Exit copy mode |

## 🧹 **Other Useful Commands**

| Command | Description |
|---------|-------------|
| **`Ctrl + b` then `:` then `kill-window`** | Kill the current window |
| **`Ctrl + b` then `:` then `kill-pane`** | Kill the current pane |
| **`Ctrl + b` then `:` then `new-window`** | Create a new window |
| **`Ctrl + b` then `:` then `split-window -h`** | Split the current window horizontally |
| **`Ctrl + b` then `:` then `split-window -v`** | Split the current window vertically |

## ⚙️ **Customization**

| Command | Description |
|---------|-------------|
| **`tmux -f <file>`** | Load tmux configuration file |
| **`Ctrl + b` then `:` then `source-file ~/.tmux.conf`** | Reload tmux configuration |

## 📜 **Save and Restore Session**

| Command | Description |
|---------|-------------|
| **`tmuxinator`** | Use [tmuxinator](https://github.com/tmuxinator/tmuxinator) for session management (save and restore sessions easily) |
