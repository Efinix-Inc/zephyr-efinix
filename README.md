This is a guide for setting up the development environment for the Efinix FPGA to develop Zephyr project
==================================================

Prerequisites
--------------

Before proceeding with the setup, ensure that the following software are installed on your computer:

- Visual Studio Code
- Docker Desktop
- Git

Setup
------

1. Clone the repository to your local machine:

    - Launch VS Code and Clone the repository to your local machine:
    - Open the Command Palette by pressing `Ctrl + Shift + P`
    - Type "Git: Clone" and hit enter
    -  Enter the current URL of the repository and hit enter
    - Choose the directory where you want to clone the repository and hit enter
    - When prompted, click on the "Open" button

2. Install recommended VS Code extensions

    - Open the Command Palette, Type "Extensions: Show Recommended Extensions" and hit enter
    - Install all the recommended extensions shown in the list on top left corner of the screen

3. Build the Docker image:

    - Open the Command Palette in Visual Studio Code by pressing Ctrl + Shift + P and type `docker build image`

    - Tag the image as `efinix/zephyr:latest` and wait for the build process to complete.

4. Start and Connect to the container:

    - Click on the "Remote Explorer" extension icon on the left sidebar.
    - Click on "Open Folder In Container".
    - Select the current folder/directory (cloned repo)
    - Wait for the container to start and load the workspace.
    - You may be asked to `Reload Window` to complete the setup. Click on `Reload Window` to complete the setup.

5. Initial setup of the development environment:

    - Open the terminal in VS Code, In the command palette, type `Terminal: Create New Integrated Terminal` and hit enter.
    - Execute the following commands:
        - `cd /zephyr`
        - `./zephyr_efx_setup.sh` --> This script will pull the Zephyr project repo with Efinix board support
<br>

### This will start the development environment for the Efinix Zephyr project using Docker. You can now start developing and testing your project.


