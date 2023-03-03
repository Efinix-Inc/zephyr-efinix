
if [ -d "/zephyr/zephyr" ]; then
    echo -e "\e[32mZephyr repo already exists\e[0m\n"

else
echo -e "\e[32mCreating Zephyr init script ....\e[0m\n"
sudo -- sh -c "chgrp -R user /zephyr && chmod -R g+rwx /zephyr"
cd /zephyr && touch zephyr_efx_setup.sh && echo "west init -m git@github.com:manoj153/ps_can_bus_prj_r.git --mr wip/efinix_add_soc && west update" \
> zephyr_efx_setup.sh && chmod +x zephyr_efx_setup.sh && \
echo -e "\e[32mZephyr init script created!!!!\e[0m\n"
echo -e "\e[32mRun { cd /zephyr && ./zephyr_efx_setup.sh } - to setup zephyr repo\e[0m\n"
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

