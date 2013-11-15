###############################################################################
# This file cleans up any dummy files created to maintain the app structure in
# the git versioning system. You should run this file every time you use a
# bootstrap directory for the first time.
#
# Diogo Teixeira, 2013
###############################################################################

# Configuration.
dummy="dummy"

# Check arguments.
if [[ -z $1 ]]; then
  echo "You must define a path."
  exit
fi

# Remove dummy files.
for D in $(find $1 \( ! -regex '.*/\..*' \) -type d) ; do
  if [[ $(find $D -maxdepth 1 \( ! -regex '.*/\..*' \) -type f | grep -c "") -gt 1  ]]; then
    rm "$D/$dummy" -v 2> /dev/null
  fi
done
