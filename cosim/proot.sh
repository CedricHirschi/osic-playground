# one-time prep
echo "Copying ngspice files..."
mkdir -p "$HOME/.local/lib/ngspice"
cp --update=older /foss/tools/ngspice/lib/ngspice/ivlng.vpi "$HOME/.local/lib/ngspice/"
ln -sf ivlng.vpi "$HOME/.local/lib/ngspice/ivlng"   # optional

if ! command -v proot >/dev/null 2>&1 && [ ! -f "$HOME/bin/proot" ]; then
    echo "Installing proot..."
    mkdir -p "$HOME/bin"
    curl -L -o "$HOME/bin/proot" https://proot.gitlab.io/proot/bin/proot
    chmod +x "$HOME/bin/proot"
else
    echo "proot already available, skipping installation."
fi

# wrapper
echo "Creating xschem-proot wrapper..."
mkdir -p "$HOME/bin"
cat > "$HOME/bin/xschem-proot" <<'SH'
#!/usr/bin/env bash
LIB="$HOME/.local/lib/ngspice"
# let vvp find its loader too (usually already OK)
export LD_LIBRARY_PATH="/foss/tools/iverilog/lib:${LD_LIBRARY_PATH}"
exec "$HOME/bin/proot" \
  -b "$LIB:/usr/local/lib/ngspice" \
  xschem "$@"
SH
chmod +x "$HOME/bin/xschem-proot"
export PATH="$HOME/bin:$PATH"

echo "Done!
Use the new \`xschem-proot\` wrapper to run xschem with cosimulation support."