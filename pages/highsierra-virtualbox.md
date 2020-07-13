## High Sierra 13.0 on Virtual Box

## Get sierra.iso (You need to get the installer first)
- Create installer to ISO
 - [Visit this link to create ](https://github.com/geerlingguy/macos-virtualbox-vm)
 - [prepare-iso.sh](https://github.com/geerlingguy/macos-virtualbox-vm/blob/master/prepare-iso.sh) 
 - $ chmod +x prepare-iso.sh
 - $ ./prepare-iso.sh Install macOS Sierra.app
 - Note: This will generate sierra.iso at your Desktop

# Create ISO

## get VM with name as HighSierra13x64 and run the following command to set things up:
- Note: There will be no output for the any of the following commands:
- $ VBoxManage modifyvm HighSierra13x64 --cpuidset 00000001 000306a9 04100800 7fbae3ff bfebfbff
- $ VBoxManage setextradata HighSierra13x64 "VBoxInternal/Devices/efi/0/Config/DmiSystemProduct" "MacBookPro11,3"
- $ VBoxManage setextradata HighSierra13x64 "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
- $ VBoxManage setextradata HighSierra13x64 "VBoxInternal/Devices/efi/0/Config/DmiSystemVersion" "1.0"
- $ VBoxManage setextradata HighSierra13x64 "VBoxInternal/Devices/efi/0/Config/DmiBoardProduct" "Mac-2BD1B31983FE1663"
- $ VBoxManage setextradata HighSierra13x64 "VBoxInternal/Devices/smc/0/Config/DeviceKey" "ourhardworkbythesewordsguardedpleasedontsteal(c)AppleComputerInc"
- $ VBoxManage setextradata HighSierra13x64 "VBoxInternal/Devices/smc/0/Config/GetKeyFromRealSMC" 1

# Setup your Virtual Box Config and start the VM creation:

## Setup sierra.iso as boot drive and start installations
 - Display memory 128mb
 - Choose VDI and use fixed disk size 30-40 GB
 - Ram - 4GB
 - Enable Audio, Drag and Drop (Host to Guest), Clipboard (bidirectional)
 - Get the installations going

# Now boot the VM first time:

##  Remove sierra.iso from the boot list and set HDD as boot 
After VM is working, chainging > resolution:
- $ VBoxManage setextradata HighSierra13x64 VBoxInternal2/EfiGraphicsResolution 1920x1080
- Youur options are as below:
- 1  800×600
- 2 1024×768
- 3 1280×1024
- 4 1440×900
- 5 1920×1200

# Enjoy using it.
@avkashchauhan
