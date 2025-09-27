# Awesome_bash_scripts 🚀
A handy collection of Bash scripts I use daily to supercharge my terminal workflow.  
Simple tweaks, but they save a ton of time!


## How to Get Started ⚡
1. Locate your `.bashrc` file in your home directory:
   ```
   ls -a ~
   ````

2. Open it with your favorite editor (example with Vim):

   ```bash
   vim ~/.bashrc
   ```
3. Add any of the scripts below into the file.
4. Reload your terminal (or just run):

   ```bash
   source ~/.bashrc
   ```

---

## Bash Scripts That Will Make Your Life Easier ✨

### 1. Quick Git Workflow (add → commit → push)

Tired of typing three commands every time? Just run `acp` with the file and commit message:

**Example usage:**

```bash
acp fileName.py "a python file got created!"
```
- You can find the function by the name: acp.sh

---

### 2. Smarter Directory Navigation 🧭

Jump around folders without endless `cd ../../..`.
The `go` command searches **up to 10 levels back** and **5 levels deep forward**.
- Want to increase the search depth? Just tweak the numbers inside the loop.


**Example usage:**

```bash
go dirName
```
- You can find the function by the name: directory_jumps.sh

---

✍️ Written by **Omnia Ahmed**
