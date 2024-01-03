# How to: Manage BIOS and Firmware

<img src="../../wiki_icons/pixelitos/cpu.png" width="50">

A BIOS or firmware is like the brain of a computer or electronic device. It helps the device start up and makes sure all its parts work together smoothly. In emulation, having the correct BIOS/firmware is important because it allows the software to pretend to be the real device and work properly.
That's why some emulators require BIOS and Firmware files to work correctly or at all.
Generally the bios files should be put in `~/retrodeck/bios` but there could be exceptions to this.

##  RetroArch (Libretro)
Some cores may need some BIOS files to work or run correctly.
[Official Libretro BIOS Guide](https://docs.libretro.com/guides/bios/)

## PPSSPP
[PPSSPP](https://docs.libretro.com/library/ppsspp/)<br/>
Starting everything should be included. <br/>
But if you want the original PSP fonts you can place them in `system/PPSSPP/flash0/font`

## MSX / SVI / ColecoVision / SG-1000
[MSX / SVI / ColecoVision / SG-1000](https://docs.libretro.com/library/bluemsx/#bios)<br/>
Content of [blueMSXv282full.zip](http://bluemsx.msxblue.com/download.html).<br/>
Not the zip itself, its contents must be extracted in `~/retrodeck/bios` folder, more info [here](https://docs.libretro.com/library/bluemsx/#bios).
Starting from v0.5.0b this is automatically provided.

## Yuzu
Yuzu needs the key files `prod.keys`, `title.keys` and the firmware files in the following directories:

**Yuzu keys:** `~/retrodeck/bios/switch/keys`

**Yuzu firmware:** `~/retrodeck/bios/switch/registered`

The directory tree should look like this example:
```
~/retrodeck/bios/switch
├── keys
│   ├── prod.keys
│   └── title.keys
└── registered
    ├── 02259fd41066eddbc64e0fdd217d9d2f.nca
    ├── 02582a2cd46cc226ce72c8a52504cd97.nca
    ├── 02b1dd519a6df4de1b11871851d328a1.nca
    ├── other 217 files...
    └── fd0d23003ea5602c24ac4e41101c16fd.nca
```

You can find a complete guide in the [Yuzu official wiki](https://yuzu-emu.org/help/quickstart/#downloading-and-installing-yuzu) on how to extract the BIOS from your Switch.

## XEMU (Xbox)

These files must be placed with the correct name in the given folders:
```
~/retrodeck/bios/mcpx_1.0.bin'
~/retrodeck/bios/Complex.bin'
~/retrodeck/saves/xbox-eeprom.bin'
[OPTIONAL] ~/retrodeck/bios/xbox_hdd.qcow2'
```
The hard disk is optional as RetroDECK already provides a pre-built 8G Xbox HDD image, free of any copyrighted content, and only containing a dummy dashboard.
So if you want to the complete experience you have to provide your own.

Usually those files are dumped/found as:
```
mcpx_1.0.bin
Complex.bin -> Complex_4627v1.03.bin or Complex_4627.bin
xbox-eeprom.bin -> eeprom.bin
xbox_hdd.qcow2 -> xbox_harddisk-D4920.qcow2
```
So don't forget to rename them for the RetroDECK standards.

## PICO-8

Pico-8 it's not freeware hence it cannot be included with RetroDECK, however it's supported by using these steps:

1. Download PICO-8 for `Linux 64-bit` from the [official website](https://www.lexaloffle.com/games.php?page=updates) or where you bought it.
2. Extract the zipfile somewhere on your desktop
3. Copy the content of the extracted pico-8 folder into `~/retrodeck/bios/pico-8/`

## MelonDS (Standalone), (NDS)

MelonDS by default needs those files:<br/>
- `~/retrodeck/bios/bios9.bin`<br/>
- `~/retrodeck/bios/bios7.bin`<br/>
- `~/retrodeck/bios/firmware.bin`

However there is a setting to disable the need of these files by going to: `Tools` -> `Start MelonDS` -> `Yes` -> `Config` -> `Emu settings` -> `DS-mode` and removing the check on `Use external BIOS/firmware files`.
Please be advised that this operation may prevent the games from running correctly.

## PCSX2 (PS2)

There a multitude of PS2 bios for a complete list with the hashes check <br>
[Gametechwiki](https://emulation.gametechwiki.com/index.php/File_hashes#Known_BIOS_Hashes)

The PS2 bios could be named in the following ways
<br>
By bios version: `ps2-0200a-20040614.bin`
<br>
By system name:`SCPH-70012.bin`

Put the bios inside the bios folder: `~/retrodeck/bios/SCPH-70012.bin`

Here is a list of common used bios with  `bios versions/system names/hashes`.

```
ps2-0200a-20040614 - SCPH-70001/SCPH-70011/SCPH-70012 - d333558cc14561c1fdc334c75d5f37b7 -PS2 US BIOS
ps2-0200e-20040614 - SCPH-70002/SCPH-70003/SCPH-70004/SCPH-70008 - dc752f160044f2ed5fc1f4964db2a095 - PS2 EU BIOS
ps2-0200j-20040614 - SCPH-70000 - 0eee5d1c779aa50e94edd168b4ebf42e - PS2 JP BIOS
```

## RPCS3 (PS3)
- Download the [latest PlayStation 3 firmware](https://www.playstation.com/en-us/support/hardware/ps3/system-software/).
- `Tools` -> `RetroDECK Configurator` -> `Change settings` -> `RPCS3` -> `File` -> `Install Firmware`.

For more information on how to load the games check the [official quickstart guide](https://rpcs3.net/quickstart).

## NeoGeo

- `neogeo.zip`

Should go into the `~/retrodeck/roms/neogeo/` folder and the `~/retrodeck/bios` folder. Depending on what emulator you use, the emulator looks for the BIOS in different directories. So the safest way it to just copy the BIOS and put it into both places.
