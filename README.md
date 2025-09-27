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

**Script:**

```bash
function acp() {
  if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Oops! You forgot something 🤔 Usage: acp <file_path> <commit_message>"
    return 1
  fi

  git add "$1"
  git commit -m "$2"
  git push
}
```

---

### 2. Smarter Directory Navigation 🧭

Jump around folders without endless `cd ../../..`.
The `go` command searches **up to 10 levels back** and **5 levels deep forward**.

**Example usage:**

```bash
go dirName
```

Want to increase the search depth? Just tweak the numbers inside the loop.

**Script:**

```bash
go() {
    # check if argument contains slashes
    if [[ "$1" != */* ]]; then
        dir="$1"

        # check current directory first
        if [ -d "$dir" ]; then
            cd "$dir"
            return 0
        fi

        # backward search up to 10 levels
        prefix=".."
        for ((i=1; i<=10; i++)); do
            if [ -d "$prefix/$dir" ]; then
                cd "$prefix/$dir"
                return 0
            fi
            prefix="../$prefix"
        done

        # forward search up to 5 levels deep
        results=$(find . -type d -name "$dir" -maxdepth 5 -printf '%d %p\n' 2>/dev/null | sort -n | cut -d' ' -f2-)
        if [ -n "$results" ]; then
            first=$(echo "$results" | head -n1)
            cd "$first"
            return 0
        else
            echo "Error: Directory '$dir' not found in current, backward (10 levels), or forward (5 levels)."
            return 1
        fi
    else
        # if argument contains slashes, treat as a path and cd directly
        if [ -d "$1" ]; then
            cd "$1"
        else
            echo "Error: Directory '$1' not found."
            return 1
        fi
    fi
}
```

---

✍️ Written by **Omnia Ahmed**
