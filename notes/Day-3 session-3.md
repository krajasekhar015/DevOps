
**Day-3 Session-3 Summary (14/08/2024)**
----------------------------------------
### **Recap**

## Key Actions
1. **Created Keys**: Generated SSH key pairs for secure communication.
2. **Imported Public Key into AWS**: Added the public key to AWS for EC2 instance access.
3. **Created Security Group**: Configured a security group to manage network access.
4. **Created EC2 Instance**: Launched a new EC2 instance.
5. **Connected with EC2 Instance**: Used SSH to access the EC2 instance.
6. **Practiced Commands**: Executed basic Linux commands.
7. **Learned About Absolute and Relative Paths**: Differentiated between absolute and relative file paths.
8. **Explored Ports and Protocols**: Examined protocols like SSH, which uses port 22.

### Syntax to Connect to an EC2 Instance

To connect to an EC2 instance using SSH, use the following command:
```
ssh -i <private-key-path> ec2-user@<IP-address>
```
**Example:**
```
ssh -i demo-key.pem ec2-user@52.205.59.244
```
- **Explanation**: This command connects to an EC2 instance using the specified private key and the `ec2-user` account.

## Basic Commands

### Terminal Commands
1. **`clear`**: Clears the terminal screen.
   - **Usage**: `clear`

2. **`pwd`**: Displays the present working directory.
   - **Usage**: `pwd`

3. **`cd`**: Changes the current directory.
   - **Usage**: `cd /path/to/directory`

4. **`ls -l`**: Lists files in long format with detailed information.
   - **Usage**: `ls -l`

5. **`ls -ltr`**: Lists files with details based on modification time in reverse order.
   - **Usage**: `ls -ltr`

6. **`ls -la`**: Lists all files including hidden files with detailed information.
   - **Usage**: `ls -la`

7. **`cat`**: Displays the content of a file or creates a file.
   - **Usage**: `cat file.txt` or `cat > file.txt`

8. **`touch`**: Creates a new, empty file or updates the timestamp of an existing file.
   - **Usage**: `touch newfile.txt`

9. **`mkdir`**: Creates a new directory.
   - **Usage**: `mkdir new-directory`

10. **`rmdir`**: Removes an empty directory.
    - **Usage**: `rmdir empty-directory`

11. **`rm`**: Removes files or directories.
    - **Usage**: `rm file.txt` or `rm -r directory/`

12. **`mv`**: Moves or renames files and directories.
    - **Usage**: `mv oldname.txt newname.txt` or `mv file.txt /path/to/directory/`

## System Information

1. **`uname`**: Shows system kernel information.
   - **Usage**: `uname`

2. **`uname -a`**: Provides complete system information including OS name, computer name, and architecture.
   - **Usage**: `uname -a`

3. **`uname --help`**: Displays help information for the `uname` command.
   - **Usage**: `uname --help`

## File Operations

- **Copy Files**:
  - **Command**: `cp <source-file> <destination-file>`
  - **Example**: `cp /etc/passwd users`
  - **Explanation**: Copies `passwd` file from `/etc` to the `users` directory.

- **Move/Cut Files**:
  - **Command**: `mv <source-file> <destination-directory>`
  - **Example**: `mv file.txt /path/to/directory/`
  - **Explanation**: Moves `file.txt` to the specified directory.

## Searching and Replacing in Files

- **Search for a Word**:
  - **Command**: `grep <word-to-find> <file>`
  - **Example**: `grep sbin file.txt`
  - **Explanation**: Searches for occurrences of `sbin` in `file.txt`.

- **Replace a Word**:
  - **Command**: `:s/<old-word>/<new-word>/g`
  - **Example**: `:s/sbin/SBIN/g`
  - **Explanation**: Replaces all occurrences of `sbin` with `SBIN` in the current line.

- **Replace a Word in a Specific Line**:
  - **Command**: `:<line-number>s/<old-word>/<new-word>/g`
  - **Example**: `:3s/sbin/SBIN/g`
  - **Explanation**: Replaces `sbin` with `SBIN` in line 3.

- **Replace a Word in the Entire File**:
  - **Command**: `:%s/<old-word>/<new-word>/g`
  - **Example**: `:%s/sbin/SBIN/g`
  - **Explanation**: Replaces `sbin` with `SBIN` throughout the entire file.

- **Find the Replaced Word**:
  - **Command**: `:/<word-to-find>`
  - **Example**: `:/SBIN`
  - **Explanation**: Searches for `SBIN` in the file.

- **Delete a Specific Line**:
  - **Command**: `:<line-number>d`
  - **Example**: `:2d`
  - **Explanation**: Deletes line 2 from the file.

## VI Editor Commands

1. **Undo**: `u`
   - **Usage**: Reverts the last change.

2. **Go to Bottom**: `Shift+g`
   - **Usage**: Moves the cursor to the end of the file.

3. **Go to Top**: `gg`
   - **Usage**: Moves the cursor to the beginning of the file.

4. **Copy Line**: `yy`
   - **Usage**: Copies the current line.

5. **Paste**: `p`
   - **Usage**: Pastes the copied or cut line.

6. **Paste Multiple Times**: `<count>p` (e.g., `10p`)
   - **Usage**: Pastes the copied or cut line multiple times.

7. **Delete Line**: `dd`
   - **Usage**: Deletes the current line.

## Permissions

- **File Permission Representation**: `-rw-r--r--`
  - **Explanation**: The file permission string is composed of:
    - **Hyphen (-)**: File type (e.g., `-` for a regular file).
    - **`rw-`**: User (owner) permissions (read and write).
    - **`r--`**: Group permissions (read only).
    - **`r--`**: Others permissions (read only).

### Change Permissions
- **Add Permissions**:
  - **Command**: `chmod o+w <file-name>`
  - **Explanation**: Adds write permission for others.

- **Remove Permissions**:
  - **Command**: `chmod o-rwx <file-name>`
  - **Explanation**: Removes read, write, and execute permissions for others.

- **Give All Permissions to All Members**:
  - **Command**: `chmod ugo+rwx <file-name>`
  - **Explanation**: Grants read, write, and execute permissions to the user, group, and others.

### Numeric Permissions
- **Read (R)**: 4
- **Write (W)**: 2
- **Execute (X)**: 1
- **Examples**:
  - **777**: Full access for everyone.
  - **750**: Full access for owner, read and execute for group, no access for others.

## Additional Notes

- **Moving a Directory**:
  - **Command**: `mv <old-directory> <new-directory>`
  - **Example**: `mv devops devops-1`
  - **Explanation**: Renames or moves the `devops` directory to `devops-1`.

- **Echo Command Example**:
  - **Command**: `echo Hello > hello.txt`
  - **Explanation**: Writes "Hello" to `hello.txt`. Using `cat hello.txt` displays "Hello".

- **SSH Key Generation Help**:
  - **Command**: `ssh-keygen --help`
  - **Explanation**: Displays help information for the `ssh-keygen` command.

- **VI vs. VIM**:
  - **Note**: VI is a basic text editor, while VIM (Vi Improved) offers additional features such as color syntax highlighting and more advanced editing capabilities.

---

