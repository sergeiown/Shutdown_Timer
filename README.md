# [![logo](https://github.com/user-attachments/assets/673b0697-16ed-4865-8cca-c1e0cbe66089) Shutdown Timer](https://github.com/sergeiown/Shutdown_Timer)

This project provides a simple and efficient batch script to schedule a system shutdown after a user-defined number of minutes. It also includes a utility script to create a shortcut to the main script in the Start Menu.

## Motivation

Windows does not include a straightforward, user-friendly way to schedule a shutdown with a countdown timer by default. While some third-party tools exist, they are often overly complex, filled with unnecessary features, or come with large installation sizes. This script offers a lightweight and direct solution.

## Features

- **Shutdown Scheduling:** Input the desired number of minutes, and the system will automatically shut down after that time.
- **Input Validation:** Ensures that the user input is a valid number within the specified range.
- **Countdown Display:** Shows a live countdown timer in the console, updating every second.
- **Notification:** A PowerShell message box confirms the timer start and minimizes all open windows.
- **Shortcut Creation:** A utility script that creates a Start Menu shortcut for easy access to the shutdown timer, including an optional hotkey assignment.

## Requirements

- **Operating System:** Windows
- **PowerShell:** Pre-installed on most Windows systems (used for message box notifications).
- **Administrator Rights:** Required to initiate a shutdown.

## Installation

- **Clone the repository** or download the scripts:
    ```sh
    git clone https://github.com/sergeiown/Shutdown_Timer.git
    ```

## Usage

|  |  |
|:------|:----------:|
| **Run `shutdown_timer.bat`:** <br> - Double-click `shutdown_timer.bat` or run it from the command line. <br> - The script will prompt for the number of minutes until shutdown. <br> - After validating the input, the countdown will start, and the system will shut down when the timer expires. | ![image](https://github.com/user-attachments/assets/3cc73bfd-1e48-4278-9d1e-19008f49dc96) |
| **Run `startmenu_shortcut.bat`:** <br> - This will create a shortcut named "Shutdown Timer" in your Start Menu for easy access. <br> - The shortcut will be linked to the `shutdown_timer.bat` script, with an appropriate icon. <br> - **Hotkey:** By default, the shortcut is set with the `Ctrl + Alt + T` combination. You can quickly access the Shutdown Timer by pressing these keys. | ![image](https://github.com/user-attachments/assets/d5d44932-8ceb-4d05-8d03-e123af76f18b) |


## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/sergeiown/Shutdown_Timer/blob/main/LICENSE) file for more details.
