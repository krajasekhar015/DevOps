**Day-12 session-12(27/08/2024)**
-----------------------------------

### Shell Scripting Concepts and Notes

#### 1. **Variables:**
- **DRY (Don’t Repeat Yourself):** If you notice a value being repeated, store it in a variable and use that variable throughout the script. This way, if you need to change it, you only modify the variable, and the changes will reflect everywhere in the script.
- **Benefits:** Centralized management; changing a single variable updates it wherever it’s used.

---

#### 2. **Data Types:**
- Shell scripting primarily handles strings, but variables can store integers, arrays, and other data types depending on how you use them.

---

#### 3. **Conditions:**
- Conditions depend on logical decisions. They are a key part of controlling the flow of a script.
- **Generic Usage:** Check expressions and perform different actions based on the result.
  
**Syntax Example:**
```bash
if [ condition ]
then
    # If condition is true
else
    # If condition is false
fi
```

---

#### 4. **Functions:**
- **Purpose:** Used to perform repetitive tasks. Functions encapsulate logic that you may need to use multiple times in the script.
- **Example:** If you need to log in to a service multiple times in your script, you can encapsulate that logic into a function.
  
**Syntax Example:**
```bash
function_name() {
    # function code here
}
function_name
```

---

#### 5. **Loops:**
- **Purpose:** Loops help perform repetitive tasks in coding by iterating over a range of values or conditions.

**Shell Script Loop Example:**
```bash
for i in 1 2 3 4 5 6 7 8
do
    echo $i
done
```

**General Loop (Other Languages):**
```c
for (int i = 0; i < 100; i++) {
    print(i);
}
```

---

#### 6. **Exit Status:**
- **Success:** Exit status is `0`.
- **Failure:** Exit status ranges from `1` to `127`.
- **Command for Last Exit Status:** `$?`

---

#### 7. **Colors:**
- **Purpose:** Enhances the user experience by visually differentiating output messages.
- **Color Codes:**
  - `\e[31m`: Red
  - `\e[32m`: Green
  - `\e[33m`: Yellow

**Example:**
```bash
echo -e "\e[32mSuccess message"
```

---

#### 8. **Redirections:**
- Redirection helps capture output (both success and error) to a file.
  
**Examples:**
1. **Redirect Success Output:**
   ```bash
   ls -l > output.txt
   ```
2. **Redirect Error Output:**
   ```bash
   ls -l 2> error.txt
   ```
3. **Redirect Both Success and Error Output:**
   ```bash
   ls -l &> output.txt
   ```

**File Name for Logs:**
```bash
/var/log/shell-script/16-redirectors-<timestamp>.log
```

---

#### 9. **Tee Command:**
- **Purpose:** Writes output to multiple destinations, including both the terminal and a file.
  
**Example:**
```bash
command | tee output.txt
```

---

#### 10. **Idempotency:**
- **Definition:** Running a program multiple times should yield the same result without changing the state. This is important for tasks like creation, update, and delete operations.

**CRUD Operations Example:**
- **Create:** Check if the entity is already created; if so, skip the creation.
- **Read:** No issues with read commands; they do not modify state.
- **Update:** Ensure the updates modify the correct state.
- **Delete:** Safe even if the entity is already deleted or non-existent.

---

#### 11. **MySQL Root Password Setup:**
- Check if the MySQL root password is already set up. If it is, inform the user that it’s already configured. If not, proceed with the setup.
