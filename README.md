# ctee
CTEE is a Linux Only bash script that records all subsequent Bash activity in a given shell for further review and later recall and/or sharing.
The script uses the Linux `script` utility to save all terminal output to a file, which can be useful for logging, debugging, or sharing terminal sessions.

## Requirements

The script should run on any Linux system which includes the `script` utility. This includes most mainstream distributions such as Ubuntu, CentOS, Fedora and others.

## Usage

1. Clone this repository or download the script to your local machine.
2. Make the script executable with the following command:

    ```
    chmod +x record_session.sh
    ```

3. Run the script with the following command:

    ```
    ./record_session.sh [filename]
    ```

    Replace `[filename]` with the name of the file where you'd like to save your session. If you don't provide a filename, the script will generate one for you in the format `cli_record_<timestamp>`.

4. After running the script, your command prompt will change to include the prefix `[RECORDING]`. This indicates that your terminal session is currently being recorded.
5. To stop recording, use the `stop_recording` command. This will end the recording and return your command prompt to its previous state.

## Caveats

This script creates a new bash session when you start recording. Any environment variables or settings from your previous session will not be carried over. If you need to maintain your environment between sessions, you may need to modify the script to source your `.bashrc` or other configuration files. 

Please use this tool responsibly and ensure that any recorded sessions do not contain sensitive information such as passwords or personal data.

## Troubleshooting

If the recording session does not stop as expected when you run `stop_recording`, you may need to manually kill the script process. You can do this by finding the process ID with `ps` and then using the `kill` command. 

For example:

  ```bash
  ps aux | grep record_session.sh
  kill -9 <PID>
  ```
Replace <PID> with the process ID from the output of the ps command.
