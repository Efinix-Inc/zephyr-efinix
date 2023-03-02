sudo -- sh -c "chgrp -R user /app/zephyrrtos && chmod -R g+rwx /app/zephyrrtos"
touch zephyr_efx_setup.sh && echo "west init -m git@github.com:manoj153/ps_can_bus_prj_r.git --mr wip/efinix_add_soc && west update \
&& echo -e \"\e[32m{cd zephyr} -- to work on zephyrRTOS \e[0m\n\"" \
> zephyr_efx_setup.sh && chmod +x zephyr_efx_setup.sh && \
echo -e "\e[32mRun ./zephyr_efx_setup.sh - to setup zephyr repo\e[0m\n"
