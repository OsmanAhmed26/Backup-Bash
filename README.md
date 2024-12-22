# Backup-Bash
Key Features:

    Separate Conditions for Each Folder:
        The script checks if the SOURCE_DIR exists first. If it doesn’t, the script exits immediately with an error.
        Next, it checks if the BACKUP_DIR exists. If it doesn’t, the script also exits with an error.

    Error Messages:
        Custom error messages for each condition help the user identify which directory is missing.

    Improved Readability:
        Each check is handled independently, making it easier to debug.

