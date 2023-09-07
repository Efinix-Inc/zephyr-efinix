
if [ -d "/zephyr/zephyr" ]; then
    echo -e "\e[32mZephyr repo already exists\e[0m\n"

else
    echo -e "\e[32mCloning Zephyr repo from https://github.com/Efinix-Inc/zephyr.git....\e[0m\n"
    sudo -- sh -c "chgrp -R user /zephyr && chmod -R g+rwx /zephyr"
    cd /zephyr && west init -m https://github.com/Efinix-Inc/zephyr.git --mr main && west update
    if [ -d "/zephyr/zephyr"]; then
        echo -e "\e[32mZephyr repo clone completed.\e[0m\n"
    else 
        echo -e "\e[32mZephyr repo failed to clone.\e[0m\n"
    fi
fi

# add submodule soc-debugger
if [ -d "/zephyr/soc_debugger" ]; then
    echo -e "\e[32msoc_debugger repo already exists\e[0m\n"
else
    cd /zephyr && 
    echo -e "\e[32m Cloning efinix/sapphire-soc-debugger repo into soc_debugger folder.\e[0m\n" && \
    git clone https://github.com/Efinix-Inc/sapphire-soc-debugger.git soc_debugger 
    if [ -d "/zephyr/soc_debugger"]; then
        echo -e "\e[32mefinix/sapphire-soc-debugger repo clone completed.\e[0m\n"
    else 
        echo -e "\e[32mefinix/sapphire-soc-debugger repo failed to clone.\e[0m\n"
    fi
fi

# add submodule dt-generator
if [ -d "/zephyr/dt-generator" ]; then
    echo -e "\e[32mdt-generator repo already exists\e[0m\n"
else
    cd /zephyr && 
    echo -e "\e[32m setup efinix/sapphire-soc-dt-generator repo\e[0m\n" && \
    git clone https://github.com/Efinix-Inc/sapphire-soc-dt-generator.git dt-generator
    if [ -d "/zephyr/soc_debugger"]; then
        echo -e "\e[32mefinix/sapphire-soc-dt-generator repo clone completed.\e[0m\n"
    else 
        echo -e "\e[32mefinix/sapphire-soc-dt-generator repo failed to clone.\e[0m\n"
    fi
fi

if [ -d "/zephyr/openocd_cfg" ]; then
    echo -e "\e[32mOpenocd config directory already exists\e[0m\n"

else
    echo -e "\e[32mCreating Openocd config directory ....\e[0m\n"
    mkdir /zephyr/openocd_cfg && \
    cp -r /app/zephyrrtos/assets/openocd_cfg/* /zephyr/openocd_cfg && \
    echo -e "\e[32mDone Creating Openocd config directory!!!\e[0m\n"
fi


if [ -d "/zephyr/vscode_cfg" ]; then
    echo -e "\e[32mVSCode config directory already exists\e[0m\n"

else
    echo -e "\e[32mCreating VSCode config directory ....\e[0m\n"
    mkdir /zephyr/vscode_cfg && \
    cp -r /app/zephyrrtos/assets/vscode_cfg/* /zephyr/vscode_cfg && \
    echo -e "\e[32mDone Creating VSCode config directory!!!\e[0m\n"
fi

# add vscode_cfg/settings.json
if [ -f "/home/user/.vscode-server/data/Machine/settings.json" ]; then
    echo -e "\e[32mVSCode settings.json already exists\e[0m\n"
else
    echo -e "\e[32mCopying VSCode settings.json ....\e[0m\n" && \
    mkdir -p /home/user/.vscode-server/data/Machine && \
    cp /zephyr/vscode_cfg/settings.json /home/user/.vscode-server/data/Machine/settings.json && \
    echo -e "\e[32mDone Copied VSCode settings.json!!!\e[0m\n"
fi

#add .vscode/launch.json
if [ -f "/zephyr/.vscode/launch.json" ]; then
    echo -e "\e[32mVSCode launch.json already exists\e[0m\n"
else
    mkdir -p /zephyr/.vscode && \
    echo -e "\e[32mCopying VSCode launch.json ....\e[0m\n" && \
    cp /zephyr/vscode_cfg/launch.json /zephyr/.vscode/launch.json && \
    echo -e "\e[32mDone Copied VSCode launch.json!!!\e[0m\n"
fi

#add .vscode/settings.json
if [ -f "/zephyr/.vscode/settings.json" ]; then
    echo -e "\e[32mVSCode settings.json already exists\e[0m\n"
else
    echo -e "\e[32mCopying VSCode settings.json ....\e[0m\n" && \
    cp /zephyr/vscode_cfg/settings.json /zephyr/.vscode/settings.json && \
    echo -e "\e[32mDone Copied VSCode settings.json!!!\e[0m\n"
fi

#check if openocd is installed
if [ -f "/zephyr/bin/openocd" ]; then
    echo -e "\e[32mOpenocd already installed\e[0m\n"
else
    echo -e "\e[32mCopying Openocd ....\e[0m\n" && \
    mkdir -p /zephyr/bin && \
    unzip /app/zephyrrtos/assets/bin/openocd_linux.zip -d /zephyr/bin && \
    chmod +x /zephyr/bin/openocd && \
    echo -e "\e[32mDone Copied Openocd!!!\e[0m\n"
fi

echo -e "\e[32mZephyr Initialization Completed!\e[0m\n"
