
if [ -d "/zephyr/zephyr" ]; then
    echo -e "\e[32mZephyr repo already exists\e[0m\n"

else 
sudo -- sh -c "chgrp -R user /zephyr && chmod -R g+rwx /zephyr"
cd /zephyr && touch zephyr_efx_setup.sh && echo "west init -m git@github.com:manoj153/ps_can_bus_prj_r.git --mr wip/efinix_add_soc && west update" \
> zephyr_efx_setup.sh && chmod +x zephyr_efx_setup.sh && \
echo -e "\e[32mRun { cd /zephyr && ./zephyr_efx_setup.sh } - to setup zephyr repo\e[0m\n"
fi
