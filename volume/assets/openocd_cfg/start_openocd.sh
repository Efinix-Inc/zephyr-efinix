#sudo is needed because usb devices is owned by root

script_path='/zephyr/openocd_cfg'

sudo -- sh -c "/zephyr/bin/openocd -f $script_path/ftdi_ti60.cfg -f $script_path/debug_ti.cfg"
