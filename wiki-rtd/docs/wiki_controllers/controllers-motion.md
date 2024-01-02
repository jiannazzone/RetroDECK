# Motion Controllers

Motion Controllers is a small category of specialized first and third party controllers that are designed to primarily be interactive with motion.

## Nintendo Motion Controllers

### Wii Remote (Wiimote) & Nunchuck

<img src="../../wiki_images/controllers/wii-mote.png" width="250"><img src="../../wiki_images/controllers/wii-nunchuck.png" width="250">

The main input for the Nintendo Wii.

#### Prerequisites Dolphin: Hardware

In addition to the controllers:

- You need to have a bluetooth dongle or built-in bluetooth adapter.
- You will need to have a Wii IR Bar. This could be a 3rd party solution wired or battery powered.

#### How to configure Dolphin: Official Wii Remote

WIP

#### How to configure Dolphin: 3rd Party Wii Remote


##### Make a Bluetooth Passthrough udev rule

**🛑 Warning 🛑**<br>
This method will make the bluetooth adapter unusable for other devices while playing Wii Games and not other devices can connect to it except Wiimotes. <br>

If you need other devices connected, it is recommended to buy a separate bluetooth dongle that works on Linux and use that.

Source: [Dolphin Wiki: Bluetooth_Passthrough](https://wiki.dolphin-emu.org/index.php?title=Bluetooth_Passthrough)

**How to:**

REWRITE

A udev rule has to be installed so Dolphin can use a Bluetooth adapter without having to get root privileges.

1. Paste the following into `/etc/udev/rules.d/52-dolphin.rules`. Replace `YOURVID` and `YOURPID` with the `Vendor ID` and `Product ID` respectively.

`SUBSYSTEM=="usb", ATTRS{idVendor}=="YOURVID", ATTRS{idProduct}=="YOURPID", TAG+="uaccess`

2. Reload udev rules with: `sudo udevadm control --reload-rules`

3. Reinsert the adapter.

Dolphin should be able to automatically unload the USB Bluetooth kernel module (assuming you have permission to; you typically need to be in the plugdev group). If not, unload it with `modprobe -r btusb`.


##### Enable Bluetooth Passthrough in Dolphin

<img src="../../wiki_images/emulators/dolphin/dolphin-bluetooth-pass.png" width="450">

Open `RetroDECK Configurator` -> `Open Emulator` -> `Dolphin` -> `Options` -> `Controller Settings`

Change to `Passthrough a Bluetooth Adapter`

Press the `Sync Button` on the Wiimote and press the `Sync Button` in the Dolphin Interface.<br>
It should now be connected and be enabled to be used with the Wii games.


### Wii Balance Board

<img src="../../wiki_images/controllers/wii-balance-board.png" width="250">

Used for various fitness games on the Nintendo Wii the most famous being `Wii Fit`.

#### How to configure

WIP


### Ring Fit

<img src="../../wiki_images/controllers/ring-fit.png" width="250">

Used for `Ring Fit Adventure` the fitness game on the Nintendo Switch.

#### How to configure

WIP

## PlayStation Motion Controllers



### PlayStation EyeToy

<img src="../../wiki_images/controllers/playstation-eye-toy.png" width="250">

Used for various titles on the PlayStation 2 the most famous being the `EyeToy` game series.

#### How to emulate in PCSX2

You need to have a `USB Webcam` connected or an `Integrated Webcam`.

- Open `RetroDECK Configurator`
- Open `PCSX2`
- Go to `Settings` -> `Controllers` -> Select `USB Port` -> Select `Webcam (EyeToy)` from the Dropdown list -> Select the `Device Name` of your connected Camera from the Dropdown list.

### PlayStation Eye & PlayStation Move

<img src="../../wiki_images/controllers/playstation-eye.png" width="250"><img src="../../wiki_images/controllers/playstation-move.png" width="250">

Used for various titles on the PlayStation 3.


#### How to configure / emulate

WIP


## Xbox Motion Controllers

### Xbox 360 Kinect

<img src="../../wiki_images/controllers/xbox-kinect-360.png" width="250">

Used for various titles on the Xbox 360.

#### How to configure / emulate

WIP

### Xbox One Kinect

<img src="../../wiki_images/controllers/xbox-kinect-one.png" width="250">

Used for various titles on the Xbox One.

#### How to configure / emulate

## Other Motion Controllers

### RIDE Balance Board

<img src="../../wiki_images/controllers/ride-controller.png" width="250">

Used for the Activision games `Tony Hawk Ride` and `Tony Hawk Shread`.

#### How to configure

WIP
