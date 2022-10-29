# Windows Account Password Remover

A simple script for deleting Windows user passwords. Tested on Kali Linux

## Installation

Clone the repository and run the script.

```bash
git clone https://github.com/VladTop46/WAPR-Kali
cd WAPR-Kali
./removepass.sh
```

## Usage

Wait for the script to load, then select the Windows disk (Microsoft Basic Data)

```
Please select disk with Windows files ("Microsoft basic data"):
/dev/nvme0n1p3
```

Wait for the script to perform the necessary actions to work with the disk. 
When the table with users appears, select the user whose password you want to delete.
After selecting the user, confirm the selection, then follow the instructions in the script.

As soon as the password is deleted, you will see a message:
```
Successfully deleted password for *user*
```
Then boot into Windows and log in to your account!
