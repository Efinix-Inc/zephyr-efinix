#sudo is needed because usb devices is owned by root
sudo -- sh -c "/opt/openocd -f ftdi_ti60.cfg -f debug_ti.cfg"
