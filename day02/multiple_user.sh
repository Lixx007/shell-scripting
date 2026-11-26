#!/bin/bash

sudo useradd suhas
sudo useradd lix
sudo useradd rahul

echo "Users created successfully"


<<comment


Example 2: Create multiple users using a loop
#!/bin/bash

for user in suhas lix rahul
do
    sudo useradd "$user"
    echo "$user created successfully"
done

comment
