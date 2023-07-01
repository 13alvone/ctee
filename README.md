# CTEE
CTEE is a Linux Only bash script that records all subsequent Bash activity in a given shell. The script uses the Linux `script` utility to save all terminal output to a file, which can be useful for logging, debugging, or sharing previous terminal sessions.

## Requirements

The script should run on any Linux system which includes the `script` utility. This includes most mainstream distributions such as Ubuntu, CentOS, Fedora and others.

## Usage

1. Clone this repository or download the script to your local machine and run the `install.sh` script.

    ```
    git clone https://github.com/13alvone/ctee.git && cd ctee && sudo ./install.sh
    ```

2. You can now call ctee from anywhere you happen to be in the filesystem so that the bash recording begins upon entry:

    ```
    $ pwd
    /home/<user>
    $ ctee
    CTEE [REC] $ echo "Quick Demonstration."
    Quick Demonstration.
    CTEE [REC] $ exit
    exit
    Recording saved in /home/<user>/.ctee/cli_record_20230630231818
    $ cat /home/<user>/.ctee/cli_record_20230630231818
    Script started on 2023-06-15 23:18:18-07:00 [COMMAND="bash --rcfile /tmp/tmp.O9AdxLXW3b" TERM="xterm-256color" TTY="/dev/pts/11" COLUMNS="136" LINES="41"]
    CTEE [REC] $ echo "Quick Demonstration."
    Quick Demonstration.
    CTEE [REC] $ exit
    exit
    
    Script done on 2023-06-15 23:18:42-07:00 [COMMAND_EXIT_CODE="0"]
    $ 
    ```

3. After running the script, your command prompt will change to include the prefix `CTEE [REC] $ `. This indicates that your terminal session is currently being recorded to a plaintext log file written to your ~/.ctee/ directory for each session.

4. To stop recording, use the `stop_recording` command or the normal shell `exit` command to achieve closing and exiting the recording shell/process.

## Caveats

> This script creates a new bash session when you start recording. Any environment variables or settings from your previous session will not be carried over, though there are a few specialized ones that I do update from time to time. The following are installed in the new bash environment when `ctee` is called:

> Defines the new visual prompt
1. PS1='CTEE [REC] \$ '

> Defined the unique `stop_recording` command here, but remember that `exit` works as well:
2. alias stop_recording='echo Recording Ended; exit'

> Added optional alias for cspeakes_enumerator. Not default installed, but works if so.
3. alias target="/usr/local/bin/create_target.sh"

> If you are doing any pentesting and need a decently robust, but quick enumeration script that works well within `ctee`, feel free to use this installer on your Kali machine AND install `ctee` as well (Order of installation does not matter).
[Get & Install Cspeakes Enumerator](https://github.com/13alvone/cspeakes_enumerator)

Please use this tool responsibly and ensure that any recorded sessions do not contain sensitive information such as passwords or personal data as this WILL be stored in your `~/.ctee/` directory files in CLEARTEXT.
