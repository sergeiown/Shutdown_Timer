# [![logo](https://github.com/user-attachments/assets/673b0697-16ed-4865-8cca-c1e0cbe66089) Shutdown Timer](https://github.com/sergeiown/Shutdown_Timer)

This project provides a simple and efficient batch script to schedule a system shutdown after a user-defined number of minutes. It also includes a utility script to create a shortcut to the main script in the Start Menu.

## Motivation

Windows does not include a straightforward, user-friendly way to schedule a shutdown with a countdown timer by default. While some third-party tools exist, they are often overly complex, filled with unnecessary features, or come with large installation sizes.

## Features

- **Shutdown Scheduling:** Enter the number of minutes, and the system will automatically shut down after that time.
- **Input Validation:** Ensures that the user input is a valid, positive number.
- **Countdown Display:** Shows a live countdown timer in the console, updating every second.
- **Notification:** A PowerShell message box confirms the timer start and minimizes all open windows.
- **Shortcut Creation:** An additional script to create a Start Menu shortcut for easy access to the shutdown timer.

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

### Running the Shutdown Timer

- **Run `shutdown_timer.bat`**:
    - Double-click `shutdown_timer.bat` or run it from the command line.
    - The script will ask for the number of minutes until shutdown.
    - It will then validate the input, start the countdown, and finally shut down the system when the timer expires.

![image](https://github.com/user-attachments/assets/3cc73bfd-1e48-4278-9d1e-19008f49dc96)

### Creating a Start Menu Shortcut

- **Run `startmenu_shortcut.bat`**:
    - This will create a shortcut named "Shutdown Timer" in your Start Menu for easy access.
    - The shortcut will automatically be linked to the `shutdown_timer.bat` script, and an appropriate icon will be assigned.

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/sergeiown/Shutdown_Timer/blob/main/LICENSE) file for more details.
