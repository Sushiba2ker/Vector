# Extract the directory path and change directory 
MODDIR="${0%/*}"
cd "$MODDIR" || exit 1

# Start the daemon directly in the background within a private mount namespace
unshare -m -f "$MODDIR/daemon" --system-server-max-retry=3 "$@" &
