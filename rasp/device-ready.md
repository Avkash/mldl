## Steps to get RaspberryPi ready for OpenCV ##


1: Get Raspbian Stretch
  - For microSD cards above 32+ GB use Etcher to flash the image and you will have full 32/64GB disk available for you
  - enable ssh, just add an empty ssh file into the SD card root partition (Thats it)
2: Start RaspberryPi
  - Check disk usage (Make sure you have all SD card space is enabled)
    - $ df -h
3: Update RaspberryPi Firmware
    - $ sudo apt-get update
    - $ sudo apt-get upgrade
    - $ sudo rpi-update
 4: Make sure you have ssh working 
 5: Enable Touch Screen on RaspberryPi
