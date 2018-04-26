#
# Executes commands at logout.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Execute code only if STDERR is bound to a TTY.
[[ -o INTERACTIVE && -t 2 ]] && {

# Print the message.
cat <<-EOF

Don't forget. Always, somewhere, someone is fighting for you.
As long as you remember her, you are not alone.
  -- Magica Quartet
EOF

} >&2
