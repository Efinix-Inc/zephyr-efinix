This is a guide for setting up the development environment for the Efinix FPGA to develop Zephyr project
--------------------------------------------------------------------------------------------------------

Introduction
-------------
 Welcome to the development environment for the Zephyr RTOS project, designed to run seamlessly on the Efinix FPGA platform. This project serves as a starting point for building and debugging Zephyr projects using Docker containers, which provide a self-contained environment to facilitate installation and development. The VS Code IDE is utilized for developing the Zephyr project, providing a seamless and user-friendly experience. Furthermore, the Sapphire SoC is utilized as a configurable RISC-V core generated by Efinix efinity tool. With this project, you can jumpstart your Zephyr project development and enjoy a streamlined workflow.

Prerequisites
--------------

Please ensure that you have the following hardware and software requirements:

### Hardware:
- [Titanium Ti60F225 Development Kit](https://www.efinixinc.com/products-devkits-titaniumti60f225.html)

### Software:

Before proceeding with the setup, ensure that the following software are installed on your computer:

#### For all platforms:
- [Visual Studio Code](https://code.visualstudio.com/)
- [Docker Desktop](https://www.docker.com/products/docker-desktop)

#### For Windows:

- [Windows Subsystem for Linux (WSL) with Ubuntu 22.04.2 LTS environment](https://apps.microsoft.com/store/detail/ubuntu-22042-lts/9PN20MSR04DW)
- [usbipd-win 2.4.1](https://github.com/dorssel/usbipd-win/releases/download/v2.4.1/usbipd-win_2.4.1.msi)
- [Git](https://git-scm.com/downloads)

Setup
------

1. **Clone the repository to your local machine**

    - Launch VS Code and Clone the repository to your local machine:
    - Open the Command Palette by pressing `Ctrl + Shift + P`
    - Type `"Git: Clone"` and hit enter
    - Enter the current URL of the repository and hit enter
    - Choose the directory where you want to clone the repository and hit enter
    - When prompted, click on the "Open" button

2. **Install recommended VS Code extensions**

    - Open the Command Palette, Type `"Extensions: Show Recommended Extensions"` and hit enter
    - Install all the recommended extensions shown in the list on top left corner of the screen

3. **Build the Docker image:**

    - Open the Command Palette and type `docker build image`

    - Tag the image as `efinix/zephyr:latest` and wait for the build process to complete.

4. **Start and Connect to the container**

    - Click on the "Remote Explorer" extension icon on the left sidebar.
    - Click on "Open Folder In Container"
    - Select the current folder/directory (cloned repo)
    - Wait for the container to start and load the workspace
    - You may be asked to `Reload Window` to complete the setup. Click on `Reload Window` to complete the setup

5. **Initial setup of the development environment**

    - Open the terminal in VS Code, In the command palette, type `Terminal: Create New Terminal (In Active Workspace)` and hit enter
    - Execute the following commands:
        - `cd /zephyr`
        - `./zephyr_efx_setup.sh` --> This script will pull the Zephyr project repo with Efinix board support

- **The development environment Zephyr project with Efinix support is ready. You can now start developing and testing your project**

USBIP Setup for Windows:
------------------------
1. Launch terminal as run as administrator
2. Run `usbipd list` --> This command will list all the USB devices connected to the host machine, note down the BUS ID of the development board, it should be something like `Titanium Ti60F225 Development Kit`
3. Run `usbipd wsl attach -b <BUS ID> --distribution Ubuntu-22.04` --> replace <BUS ID> with the actual BUS ID of the development board


Development Process
--------------------
1. To acquire the Efinix Sapphire RISC-V SoC bitstream, there are two available methods: utilizing a pre-configured version or creating a customizable one on your own.

- **Pre-configured Bitstream:** 
   - Locate the archived file in the cloned repository at `volume/soc_efinity/sapphire_soc.zip`. Extract the archive, and find the compiled SoC bitstream at `sapphire_soc/ip/sapphire_soc/Ti60F225_devkit/outflow/soc.hex`. This bitstream is a pre-configured SoC.

**OR**

- **Generate a customized SoC yourself:**
    - Refer to the [Sapphire RISC-V SoC Hardware and Software User Guide](#resources) for guidance on creating your own SoC. Review Chapter 1, 2, and 3 of the User Guide to gain a thorough understanding of the customization process.

2. Obtain the zephyr firmware, run the command `west build -b titanium_ti60_f225 /samples/hello_world -p always` from the `/zephyr/zephyr` directory to build a sample "hello world" project. The resulting firmware will be located at `/zephyr/zephyr/build/zephyr/zephyr.bin`, You need to download the `zephyr.bin` file to your host machine.

3. Combine both the bitstream and firmware, and flash the resulting image, Refer to the [Sapphire RISC-V SoC Hardware and Software User Guide](#resources). Page 63, the section `Copy a User Binary to Flash (Efinity Programmer)`
4. Verify that everything went smoothly by checking the serial console, where you should see the message "Hello World!" It should look like in the image shown below

 <img src="docs/images/boot_banner_hello_world.png" title="expected console output" alt="expected console output" width="616">


What's Next?
-------------
- You may want debugging capabilities for your project. Refer to the [Debugging Guide](docs/debugging.md) for more information.
Resources
----------
1. [Sapphire RISC-V SoC Hardware and Software User Guide](https://www.efinixinc.com/support/docsdl.php?s=ef&pn=SAPPHIREUG)