###############################################################################
# This file creates dummies in empty visible folders so that git can track the
# directory structure. A normal user shouldn't run this file.
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

# Create dummy files.
for D in $(find $1 \( ! -regex '.*/\..*' \) -type d) ; do
  if [[ $(find $D -maxdepth 1 \( ! -regex '.*/\..*' \) -type f | grep -c "") -eq 0  ]]; then
    touch $D/$dummy 2> /dev/null
  fi
done
