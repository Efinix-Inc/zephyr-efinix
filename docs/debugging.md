# Debugging Guide

## Debugging Steps for the Application
Ensure that:
- You are inside the development container environment
- The bitstream and the latest built application is combined and uploaded to the board

1. Launch the terminal in VS Code:
   - Use the command palette and enter `Terminal: Create New Terminal (In Active Workspace)`
2. Run these commands in the terminal:
   - `cd /zephyr/ && ./openocd_cfg/start_openocd.sh`  # This script initiates the openocd server
3. Debug the application using VS Code:
   - Access the Command Palette by pressing `Ctrl + Shift + P`
   - Enter `Debug: Start Debugging`