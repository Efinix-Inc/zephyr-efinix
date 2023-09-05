# Debugging Guide

## Debugging Steps for the Application
Ensure that:
- You are inside the development container environment
- The bitstream and the latest built application is combined and uploaded to the board

1. Launch the terminal in VS Code:
   - Use the command palette and enter `Terminal: Create New Terminal (In Active Workspace)`
2. Run these commands in the terminal:

   - `cd /zephyr/ && ./soc_debugger/soc_debug.sh -b ti180 -c 4 -z`  # This script initiates the openocd server
```bash
Usage

-b, board         Board can be t120, ti60 or ti180
-c, cpu count     Number of CPU. Default is 1
-i, interface     Debug interface. Default is 1
                  1 - RISCV Standard Debug Interface
                  0 - Vexriscv Debug Interface
-s, soft tap      Using soft tap instead of hard JTAG. Default is using
                  hard JTAG.
-d, debug         Show debug message
-z, Zephyr Debug  Enable debug for Zephyr 
-l  Linux Debug   Enable debug for Linux 
-t, Tap port      FPGA tap port number. Default is 1. Range is 1 to 4. 

Example,
./soc_debugger/soc_debug.sh -b ti180 -c 4 -z

```

3. Debug the application using VS Code:
   - Access the Command Palette by pressing `Ctrl + Shift + P`
   - Enter `Debug: Start Debugging`