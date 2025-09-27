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
