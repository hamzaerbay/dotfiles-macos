# Write Handy Functions

function exists() {
  command -v $1 >/dev/null 2>&1
}
. "$HOME/.cargo/env"
