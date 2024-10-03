Day-11 session-11(26/08/2024)
-----------------------------

### Shell Scripting Notes

#### 1. Variables:
- **DRY (Don’t Repeat Yourself):** Variables help avoid repetition and reduce human errors.
- **Usage of Variables:**
  1. **Inside Script:** Declared and used within the script.
  2. **Passed as Argument:** Passed to the script as arguments during execution.
  3. **Sent Through Script Interaction:** Values captured during script execution.

#### Example of Array:
```bash
FRUITS=("Apple" "Jack" "Banana")
# Array index:    0      1        2
```

#### Running a Command and Storing Value in Variable:
```bash
VARIABLE=$(command)
```

#### Shortcut:
- `Ctrl + R`: Recall previous commands.

#### Special Variables (Important for Interviews):
1. `$@`: All variables passed to the script.
2. `$#`: Number of variables passed to the script.
3. `$0`: Script name.
4. `$PWD`: Current working directory.
5. `$HOME`: Current user's home directory.
6. `$$`: Process ID of the script.
7. `$!`: Process ID of the last background command.

---

#### 2. Conditions:
- **Syntax:**
  ```bash
  if [expression]
  then
      # execute if expression is true
  else
      # execute if expression is false
  fi
  ```
- **Example 1:**
  ```bash
  if [ "$today" = "Mon" ] || [ "$today" = "Tue" ] || [ "$today" = "Wed" ] || [ "$today" = "Thu" ] || [ "$today" = "Fri" ]
  then
      echo "attend the class"
  else
      echo "no class"
  fi
  ```

- **Example 2:**
  ```bash
  if [ "$today" != "Sat" ] && [ "$today" != "Sun" ]
  then
      echo "attend class"
  else
      echo "no session"
  fi
  ```

#### Example: Checking Number Greater Than 20:
```bash
if [ "$number" -gt 20 ]
then
    echo "The number is greater than 20"
else
    echo "The number is less than 20"
fi
```

---

#### 3. Installing MySQL via Shell Script:
1. Check if the user has root access.
2. If yes, proceed; else throw an error.
3. Check if MySQL is installed; if yes, inform the user.
4. If not installed, install it.
5. Check for installation success or failure.

---

#### Handling Errors in Shell Scripting:
- **Exit Status (`$?`):**
  - `$?`: Contains the status of the last executed command.
  - `0`: Success.
  - `1-127`: Failure.

#### Example:
```bash
if [ $? -eq 0 ]
then
    echo "Command executed successfully"
else
    echo "Command failed"
fi
```

---

#### 4. Functions:
- **Definition:**
  - Functions perform repetitive tasks and can be reused anytime in the script.
- **Syntax:**
  ```bash
  function_name() {
      # commands
  }
  function_name
  ```

#### Example Function:
```bash
login(username, password) {
    select * from user where user="$username" and password="$password"
    if [ $? -eq 0 ]
    then
        echo "login success"
    else
        echo "login failure"
    fi
}
```

---

#### 5. Color Coding in Shell:
- **Colors:**
  - Red: `\e[31m`
  - Green: `\e[32m`
  - Yellow: `\e[33m`

#### Example:
```bash
echo -e "\e[32m Success message in green"
```

---

#### Git Workflow:
1. **Add Files to Staging Area:**
   ```bash
   git add <file-name>
   ```
2. **Commit Files:**
   ```bash
   git commit -m "Commit message"
   ```
3. **Push to Remote Repository:**
   ```bash
   git push origin main
   ```

#### One-liner for Adding, Committing, and Pushing:
```bash
git add . ; git commit -m "Commit message" ; git push origin main
```
