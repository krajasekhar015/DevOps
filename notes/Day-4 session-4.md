**Day-4 session-4(15/08/2024)**
----------------------------
**Recap**
# Linux User Management and Authentication

## Vim Editor Commands

### Basic Navigation
- `Esc`: Exit insert mode and return to command mode.
- `yy`: Copy the current line.
- `dd`: Cut the current line.
- `p`: Paste the copied or cut line.
- `Shift+G`: Move the cursor to the end of the file.
- `gg`: Move the cursor to the beginning of the file.

### Command Mode
- `:q`: Quit the editor.
- `:wq`: Write changes and quit.
- `:q!`: Force quit without saving changes.
- `:/<pattern>`: Search for `<pattern>` from the top of the file.
- `:?<pattern>`: Search for `<pattern>` from the bottom of the file.
- `:set nu`: Show line numbers.
- `:set nonu`: Hide line numbers.
- `:noh`: Remove highlighting of search results.
- `:%d`: Delete all lines in the file.
- `:1d`: Delete the first line.
- `:s/old/new/g`: Replace all occurrences of `old` with `new` on the current line.
- `:%s/old/new/g`: Replace all occurrences of `old` with `new` in the entire file.

## File Permissions and Ownership

### Changing Permissions
- `chmod ugo+rwx <file-name>`: Give read, write, and execute permissions to the user, group, and others.
  - `R` (Read) = 4
  - `W` (Write) = 2
  - `X` (Execute) = 1

### Changing Ownership
- `chown <owner>:<group> <file-name>`: Change the owner and/or group of a file or directory.
  - Example: `chown suresh:suresh .ssh` changes ownership of `.ssh` directory to user `suresh`.

## Linux Administration

### Switching to Root
- `sudo su`: Switch to the root user.
- `sudo su -`: Switch to the root user with a login shell, changing to the root user's home directory.

### User Management
- **Creating a User**:
  - `useradd <user-name>`: Create a new user.
  - Example: `useradd ramesh` creates a user named `ramesh`.

- **Checking User Information**:
  - `id <user-name>`: Display user ID (UID), group ID (GID), and group membership.
  - Example: `id ramesh` shows information for user `ramesh`.

- **Setting a Password**:
  - `passwd <user-name>`: Set or change the user's password.
  - Example: `passwd ramesh` sets the password for user `ramesh`.

### Group Management
- **Creating a Group**:
  - `groupadd <group-name>`: Create a new group.
  - Example: `groupadd devops` creates a group named `devops`.

- **Adding a User to a Group**:
  - **Primary Group**: `usermod -g <group-name> <user-name>`
    - Example: `usermod -g devops ramesh` sets `devops` as the primary group for `ramesh`.

  - **Secondary Group**: `usermod -aG <group-name> <user-name>`
    - Example: `usermod -aG testing ramesh` adds `ramesh` to the `testing` group.

- **Removing a User from a Group**:
  - `gpasswd -d <user-name> <group-name>`
    - Example: `gpasswd -d ramesh testing` removes `ramesh` from the `testing` group.

### Deleting a User
- **Removing a User**:
  - `usermod -g <new-primary-group> <user-name>`: Change the user's primary group before deletion.
    - Example: `usermod -g ramesh ramesh` changes `ramesh` to their original primary group before deletion.
  - `userdel <user-name>`: Delete the user.
    - Example: `userdel ramesh` removes user `ramesh`.

- **Deleting a Group**:
  - `groupdel <group-name>`: Remove the specified group.
    - Example: `groupdel ramesh` deletes the `ramesh` group.

## SSH Authentication

### Password-Based Authentication
- **Configuring Password Authentication**:
  - Edit SSH configuration file: `vim /etc/ssh/sshd_config`
  - Ensure `PasswordAuthentication yes` to allow password-based logins.
  - Restart SSH service: `systemctl restart sshd`

### Key-Based Authentication
- **Generating SSH Key Pair**:
  - `ssh-keygen -f <file-name>`: Create a new SSH key pair.
    - Example: `ssh-keygen -f suresh` generates keys for user `suresh`.

- **Adding Public Key to Server**:
  - Create `.ssh` directory: `mkdir /home/<user-name>/.ssh`
  - Set permissions: `chmod 700 /home/<user-name>/.ssh`
  - Create `authorized_keys` file: `touch /home/<user-name>/.ssh/authorized_keys`
  - Set permissions: `chmod 600 /home/<user-name>/.ssh/authorized_keys`
  - Add public key to `authorized_keys` file.
    - Example: `vim /home/suresh/.ssh/authorized_keys` and paste the public key.

- **Configuring SSH for Key-Based Authentication**:
  - Edit SSH configuration file: `vim /etc/ssh/sshd_config`
  - Set `PasswordAuthentication no` and `PubkeyAuthentication yes`.
  - Restart SSH service: `systemctl restart sshd`

## Summary
Effective user and group management, along with secure authentication configurations, are crucial for maintaining a secure and organized Linux environment. Proper use of user and group commands ensures appropriate access levels, while secure SSH configurations protect against unauthorized access.

---

