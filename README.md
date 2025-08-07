# WiFindr 🔍
A lightweight and portable batch script that extracts saved Wi-Fi network names (SSIDs) and their corresponding passwords on Windows.

---

## 📦 Features

- ✅ Displays all saved Wi-Fi profiles
- ✅ Extracts passwords (if available)
- ✅ Saves output to a neatly formatted `.txt` file
- ✅ No installation required – just run and go!
- ✅ Fully offline; no internet access required

---

## 🚀 How to Use

1. **Download or Clone this Repo:**
   ```bash
   git clone https://github.com/yourusername/WiFindr.git
   ```

2. **Navigate to the Folder**:
   ```bash
   cd WiFindr
   ```

3. **Run the Script**:
   - Double-click `WiFindr.cmd` **OR**
   - Run from Command Prompt:
     ```cmd
     WiFindr.cmd
     ```

4. **Check the Output**:
   - A file named `wifi_passwords.txt` will be generated in the same folder.
   - It contains your saved Wi-Fi networks and their passwords (if available).

---

## 🛠 Requirements

- 🖥️ **Windows 7/10/11**
- 🔒 Admin privileges **NOT required** (but some networks may not show passwords without them)
- 🧠 Basic command-line understanding is helpful

---

## ⚠️ Notes

- This tool only works on **Windows**, as it uses the built-in `netsh` command.
- Only profiles **previously connected and saved** will appear.
- For security reasons, some enterprise networks may not expose their saved passwords.

---

## 🧑‍💻 Author

**Mark Chito**  
[GitHub Profile](https://github.com/markchitoanteja)

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🌟 Show Your Support

If you found this useful, consider giving it a ⭐ on GitHub!
