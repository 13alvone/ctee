
```
 ██████╗████████╗███████╗███████╗
██╔════╝╚══██╔══╝██╔════╝██╔════╝
██║        ██║   █████╗  █████╗  
██║        ██║   ██╔══╝  ██╔══╝  
╚██████╗   ██║   ███████╗███████╗
 ╚═════╝   ╚═╝   ╚══════╝╚══════╝
```
# Command Line Session Recorder

CTEE is a powerful suite of tools designed to enhance your experience with the command-line interface on Linux and MacOS systems. It allows you to record and replay your CLI sessions, take and store notes related to your CLI activities, manipulate the timing of your replayed sessions, and perform other related tasks. CTEE consists of several interconnected scripts and utilities working together to provide an efficient and user-friendly way to handle command-line activities.

Here's a brief overview of each component:

1. `ctee`: This is the main script that sets up the CTEE environment. It handles tasks like creating necessary directories, starting a new session, recording the session, and cleaning up when the session ends.

2. `cxrmclear`: This script sanitizes the output of the recorded sessions by removing control characters and handling backspaces.

3. `cxtiming`: This Python script modifies the timing of a previously recorded script, either by scaling the timing down by a certain coefficient or normalizing it to a fixed interval.

4. `cxwrite`: This Python script allows users to write notes about their CLI activities, which are then stored in an SQLite database.

5. `install.sh`: This shell script handles the installation process for the CTEE environment. It ensures that the necessary files are copied to the correct locations and that permissions are correctly set.

6. `uninstall.sh`: This shell script cleanly uninstalls the CTEE environment and its associated tools. It also backs up the SQLite database containing the user's notes to the `/tmp` directory.

---

## How to Use CTEE

Start by installing CTEE by running the `install.sh` script as a standard, non-root, non-sudo user. This places the necessary scripts and binaries in `/usr/local/bin` and creates the `~/.ctee/` directory where CTEE stores its data:

	./install.sh

To start a new session, simply run `ctee` from the command line from anywhere:

	ctee

This begins a new recording session where your activities in the CLI are recorded. You can perform any actions in this session, just like in a normal shell.

To take notes related to your activities, use the `cxwrite` command:

	cxwrite "This is a note about my CLI activity."

These notes are stored in an SQLite database and can be queried later.

To replay a previously recorded session, use the `cxrun` command:

	cxrun

This plays back your CLI actions, letting you see exactly what you did in a previous session.

To modify the timing of a replayed session, use the `cxtiming` command:

	cxtiming -f path/to/script -c 10

This reduces the time between actions in the replayed script by a factor of 10, making the replay go 10 times faster.

To sanitize a recorded script file, use the `cxrmclear` command:

	cxrmclear -f path/to/script

This removes control characters and handles backspaces in the recorded script file, making it cleaner and easier to read.

When you're done with CTEE, you can cleanly uninstall it by running the `uninstall.sh` script:

	./uninstall.sh

This removes all CTEE components and backs up your notes database to `/tmp`.


## CTEE Home Directory 
    The home directory can be found here: ~/.ctee/
> This directory contains all recorded sessions, but there is a cleanup function that runs each time ctee is called, removing any recordings that are either older than 7 days, or when the count of recorded sessions exceeds 20. This is done as a general safety feature, to ensure OLD sessions that you forgot are no longer sitting around with sensitive data. Generally, there is no need to access these files because the 'cxrun' CLI command will run the most recently recorded CLI event in plaintext and free of extraneous control sequences that don't print to stdout, as long as it is younger than 7 days, and NOT the victim of a standard cleanout function due to exceeding the ctee session log count in the ctee home directory.

---

## Considerations
CTEE is a powerful tool for any user who frequently works with the command-line interface. It allows you to record your activities, replay them, adjust their timing, and even take notes about what you're doing. This makes CTEE a useful tool for learning, teaching, troubleshooting, and documenting your CLI activities.

Please use this tool responsibly and ensure that any recorded sessions do not contain sensitive information such as passwords or personal data as this WILL be stored in your `~/.ctee/` directory files in CLEARTEXT.

---

## Optional Considerations (For My Fellow Pentesters)

> If you are doing any pentesting and need a decently robust, but quick enumeration script that works well within `ctee`, feel free to use this installer on your Kali machine AND install `ctee` as well (Order of installation does not matter).
[Get & Install Cspeakes Enumerator](https://github.com/13alvone/cspeakes_enumerator)



