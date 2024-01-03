# FAQs: Frequently asked questions

What follows is questions and answers to a variety of topics.


## RetroDECK: General Questions

<img src="../../wiki_icons/retrodeck/rd_icon_circle_192x192.png">

### What does the "b" stand for in the versioning number?
It stands for Beta.

<br>

### What is RetroDECK cooker?
Cooker is a bleeding edge snapshot of the current commits, the action of uploading code to GitHub is called commit.
As you can understand, the code may not be always reviewed and so the cooker it's unstable by its nature,  it's just suggested to testers or developer to try bleeding edge function or to contribute.

More info on the pinned post in #💙-i-want-to-help on our [Discord Server](discord.gg/Dz3szYsP8g).
We don't support the cooker on user side.

#### Why the name cooker? 🍲
That's what cooking in the pot at this moment and not yet ready to be served (released). This name was also used by Linux Mandrake and Mandriva for the bleeding edge channel.

<br>

### What emulators and software is included in RetroDECK?
Check: [RetroDECK: What's included?](../wiki_general/what-is-included.md)

<br>

### Does RetroDECK include any games?
No games are included in RetroDECK at this momment.

<br>

### Will you include Open Source games in the future?
We are looking into a ports downloader for a future update.

<br>

### Does RetroDECK include any Firmware or BIOS?
RetroDECK only includes those BIOS and Firmware that are Open Source. All others can never be done for legal reasons.

#### Can you at least point me towards where I find none Open Source: Games, Firmeware or BIOS?
For purchased titles we recommend that you use your own game backups and look into how to extract the Firmware or BIOS from your own consoles.

<br>

### When does the next version of RetroDECK come out?
When it's ready.

#### When does the version after the upcoming version come out?
After the upcoming version.

#### When does the version 1.0 of RetroDECK come out?
In the future.

<br>



## RetroDECK: Usage Questions

### Do I have to partition or format my disk/sdcard to install RetroDECK?
No, partitioning or formatting is not needed at all. RetroDECK (differently from AmberELEC, Batocera and others) comes as a flatpak. Just install it as any other application and launch it from your desktop and/or Steam library.

<br>

### Where is RetroDECK installed?

There are two primary folders:

`~/retrodeck`

- The location of this folder is where you set it during installation.
- This cointains all of the userdata that the users put into RetroDECK like: ROMs, Mods, Texturepacks, Downloaded Content, Themes etc.
- The folder is not deleted during a uninstallation of RetroDECK and must be manually deleted, as all the users valuble files are there.

`~/.var/app/net.retrodeck.retrodeck/`

- This is the main flatpak folder, under the hidden `./var/app/` folder you need to show hidden folders and files to see it.
- This cointains all of the emulators, emulationstation and other settings that make RetroDECK work.
- During uninstallation this folder is removed.

### Can I move the ROMs folder to another place?
Yes, you can do so inside the configurator and the `Move RetroDECK` option.

<br>

### Is there a way to reset RetroDECK?
Yes, you can reset various parts of the software using the RetroDECK Configurator's reset functions.<br>
Read more on: [RetroDECK Configurator 🛠️](../wiki_general/configurator.md)

Or if you want to reset from CLI you can read up on:<br>
`Development 🖥️` - [CLI Guide](../wiki_development/cli-guide.md)


 <br>

### How do I uninstall RetroDECK?
**On the Steam Deck:**

Put the Steam Deck into Desktop Mode `Steam button`  `Power`  `Switch to Desktop`

* Go into Discover
* Press the `Installed` tab and find RetroDECK
* Press the `Uninstall` button
* Manually backup then remove the `~\retrodeck` folder. Warning! Make a backup your data roms/bios/saves etc if you want to save them else they will be gone.

<br>

### Does uninstalling RetroDECK remove my roms, bios and saves?
No, as long as you don't manually don't delete the `~\retrodeck` folder and it's content your data is safe. You could uninstall RetroDECK and install it again and keep going.

<br>

### How can I move RetroDECK do a different device like Steam Deck OLED or a new Linux PC?
Yes, check over at [How to: Move RetroDECK to a new device](../wiki_howto_faq/retrodeck-move.md)

<br>

### Where can I find the logfiles?
In `~/retrodeck/logs/retrodeck.log`

<br>

### Can I add a single game to my Steam Library?
We are working on this feature. Meanwhile you can achieve this manually.
Example of a launch script to launch to launch a Wii game called Baloon World:

 ```
 flatpak run --command=dolphin-emu-wrapper net.retrodeck.retrodeck -e "/run/media/mmcblk0p1/retrodeck/roms/wii/Baloon World.rvz" -b
 ```

<br>

### After installing RetroDECK manually, Discover is not opening or giving me some errors?
This bug is appearing only when installing RetroDECK manually and not from Discover. The discover release is suggested for all the users.
However you can run this to fix it: `flatpak remote-delete retrodeck-origin`

<br>






## Feature Requests & Bug Reports

### How to report bugs?

Check [Reporting bugs and issues](../wiki_bugs/report-bugs.md)
<br>

### Will you implement X/Y/Z emulator?
Our goal is to implement and configure a selection of the best emulators for each system supported by ES-DE. If your favorite system is not integrated you can request its integration by opening an issue on this github page.

<br>

### Will you implement none emulator software inside of RetroDECK like Batocera?
We do have plans for a ports downloader / manager in the future.

<br>

### I have a good idea on a new feature, how do I suggest it?
Check if the request already exists in the issue list on github, if not you can make a new issue and suggest it.
If you want to discuss before submitting feel free to post your ideas in our discord community.

<br>

### Will you add Windows versions of the emulators as well and run them via Wine/Proton?
We know that some emulators like CEMU runs better with the Windows version via Proton, but the entirety of Proton/Wine and DXVK must be added to the project and then configured to get it to work at all.
This is no easy feat and most emulators are better and equally performant as their Windows counterparts with the Linux versions.

So there are no plans currently to support this and it also comes with lot of risk adding such big dependencies as Wine into the project.

<br>

## RetroDECK: Updating

<img src="../../wiki_images/logos/discover-logo.png">

<br>

### How do I update RetroDECK?
Updates to RetroDECK is handled automatically via your software manager when there is a new version released.

Or if you want to update from the terminal you can type:
`flatpak update`

<br>

### How do I update a specific emulator in RetroDECK?
You can't in a easy way do that without breaking several things. RetroDECK builds many emulators and add RetroDECK specific features on top of them and makes it into one application as is the goal of the project.

But that said we are looking into a allowing a limited scrope of custom emulator installation for those that have early access versions that are payed like Yuzu and the users really want to add in.

The custom installation will still be more limited then the one we ship with RetroDECK by default and might have less features then normal Yuzu in term of hotkey support and other things that the user will need to configure manually.

<br>

### Do you only ship stable versions of the emulators or nightly versions?
RetroDECK ships with the version that is the best for running the games on a case-by-case basis.

For all  bleeding edge emulators like Yuzu or RPCS3 it's nightly version we ship.

But for things like RetroArch it is only the stable release of the application we ship.
When it comes to RetroArch Cores they always use their stable version, but if there is no stable version of a core within a stable release of RetroArch the nightly version of that core will be used instead.

Even before we release a new update for RetroDECK the nightly versions of the emulators will be tested to make sure they work and no major issues are known to exist in them.

There have been instances where the nightly version of a emulator have been completly broken and we want to avoid to ship that with RetroDECK.

<br>




## Documentation & Wiki

<img src="../../wiki_images/logos/mkdocs-material-logo.svg" width="150">

<br>

### What is sudo?
The command stands for "superuser do" and in the windows world it is called "run as administrator".
Su in "sudo" refers to the "superuser" or in the windows called the "administrator".

<br>

### Whats the meaning of the ~ character mean in documentation and examples?
The tilde character ~  is the a short way of saying the logged in users home directory in the UNIX world.<br>
So for example the Steam Deck:<br>

`~ = /home/deck`

Read more on [Wikipedia](https://en.wikipedia.org/wiki/Home_directory)

<br>

### Whats the meaning of the SA acronym in documentation and examples?
SA means Standalone and the emulator is not inside RetroArch/LibRetro but a separate program launched within RetroDECK.

<br>

### Whats the meaning of the CLI acronym in documentation and examples?
CLI stands for command-line interface and is often refereed commands you can run in the the Linux Terminal

<br>



## Other Emulation Solutions

<img src="../../wiki_images/logos/batocera-logo.png" width="300">

<br>

### Are you related anyway to Batocera?
 No, but RetroDECK had some dialog before the project started with some of the Batocera crew if there where any plans to start a Batocera non-OS application (there where no plans at that moment and their focus is to make the best retro gaming operative system). RetroDECK and Batocera also have good dialog together with representatives of each projects inside the internal development channels.

<br>

### Are you related to EmuDeck?
No, the two projects are not related.

<br>

#### So what's the difference between RetroDECK and EmuDeck?
Apart of that from the user point of view EmuDeck and RetroDECK may sound similar but technically they're completely different.

EmuDeck is a shell script that you run in the Steam Decks desktop mode that downloads and configures all the separate emulators & plugins for you from various sources using a built in electron based gui.

RetroDECK is an all-in-one application contained in a sandboxed environment called "flatpak", that is downloaded from Discover (Flathub). This is Valves and other Linux desktops recommended way of distributing applications on the Steam Deck and Linux desktop in a safe way. It grantees for example even if Valve makes major changes to the file system in a SteamOS update, RetroDECK and it’s configurations will not be touched and will be safe.

RetroDECK only writes in these two folders: `~/retrodeck` for roms/configurations/bios etc.. And an hidden flatpak folder located in `~/.var/net.retrodeck.retrodeck`.

As everything is contained within those two folders it will not have conflict if you decide to install an emulator from another source like Yuzu or RetroArch with your RetroDECK setup. Even if you uninstall RetroDECK all your roms/bios/saves/etc.. are safe until you remove the `~/retrodeck` folder. So if you for some reason don't like the application after playing for a while you can easily move out your important files after an uninstall (or you can just reinstall RetroDECK again and start where you left off).

This approach of everything is in a all-in-one package will also allow RetroDECK to do tighter integrations with each bundled emulator in the future and expose all those settings when you are inside RetroDECK, so you do not need to go into Steam Decks desktop mode to do changes and tweaks. All things should be, in the long term, inside the application itself and you can already see a part of that inside the RetroDECK Configurator in the Tools menu.

<br>

#### Can I install RetroDECK if I have EmuDeck already?
Yes, as RetroDECK is completely standalone.

<br>

#### Why create RetroDECK when EmuDeck and other solutions exists?
RetroDECK is older then EmuDeck, EmuDeck was created later.

<br>


### Batocera or EmuDeck or RetroDECK I still don't get it?
- Batocera is a retro emulation operative system that you need to boot into separately (like from an SDCard) or replace your current OS.  For the Steam Deck you lose access to the SteamOS features and your emulation gaming is separate from your SteamOS gamemode gaming. That said; Batocera has many years of development time, is a great mature OS with a lot of features.

- EmuDeck is a shell script that you download and run. The script downloads & configures all the separate emulators & plugins for you from various sources for various operative systems.

- RetroDECK is an all-in-one application that already provides everything you need without to many extra steps for the user.It is on Flathub and thus allows the users to update the application via standard safe operative system update methods.
You can see RetroDECK as the in between of EmuDeck and Batocera. We hope that one day we can offer a complete Batocera-like experience right inside your operative system.

<br>

### What is your relationship with EmulationStation Desktop Edition (ES-DE)?
ES-DE and RetroDECK are separate projects, but we collaborate to give the best possible user experience.
We have a unique partnership where inside the ES-DE code is a section just for RetroDECK specific features. 
[Read more on ES-DE FAQs](https://gitlab.com/es-de/emulationstation-de/-/blob/master/FAQ.md#what-is-the-relationship-between-es-de-and-retrodeck)

<br>


## Flatpak Questions

<img src="../../wiki_images/logos/flatpak-logo.png" width="150">

### Retrodeck is a flatpak, what is it?
[Flaptak](https://docs.flatpak.org/en/latest/introduction.html) is like sandboxed application, with its own read only filesystem that is different from your computer's filesystem. That's why flatpak is safer than installing something directly in your filesystem as everything it needs is contained within the flatpak.


#### How is a flatpak made?
A flatpak is generated from a manifest file. A software called  flatpak-builder reads the  manifest, then starts downloading dependencies and starts building the software. After the build process is done it generates the software in a .flatpak file. This file can then be hosted on Flathub or distributed on the web.


#### How does the RetroDECK flatpak manifest look like?
You can find out manifest here:  https://github.com/XargonWan/RetroDECK/blob/main/net.retrodeck.retrodeck.yml

<br>


## Emulation & Games

<img src="../../wiki_images/logos/retroarch-logo.png" width="150">

### Why are games call ROMs?
ROM stands for "Read Only Memory" and was a common method to store games.
The games where later dumped from their ROM chips into digitalized files that can be played with an emulator.
Read more on [wikipedia](https://en.wikipedia.org/wiki/Read-only_memory)

<br>

### How can I set another default emulator?
The ES-DE interface allows you to change emulators for systems that has many different emulators.  In the main menu go to `Other Settings` - `Alternative Emulators` to set other defaults.

<br>

### Game X/Y/Z is not working or showing black screen
- Some emulators needs BIOS and/or firmware files, first you can check if you got the `How-to's 💬` - `How to: Manage BIOS and Firmware`.<br/
- You could have bad backups compare them on a database site for example [no-intro](https://datomatic.no-intro.org/index.php?page=search&s=64) or even [RetroAchievements](https://retroachievements.org) if your game is supported.<br/
- Moreover please mind that some emulator require very specific roms `How-to's 💬` - `How to: Manage your Games`

<br>

### I'm not getting any sound
- Check so you have not turned down the volume or muted in: the emulators, es-de, the OS or other volume settings.
- On the Steam Deck make sure you have not muted RetroDECK in Desktop Mode as that transfers over to Game Mode.

<br>


### PS2 games are not working or buggy in the RetroArch Core.
It's a known issue with if you are using the libretro core but you can use the the standalone pcsx2 emulator to solve this issue.<br>
Be sure to check that the bios files are in the correct folder. Read more on the `How-to's 💬` - `How to: Manage BIOS and Firmware`

<br>

### I configured RetroArch but the configuration was not saved.
Configuring RetroArch can be dangerous for an inexperienced user, so RetroDECK is set to don't save the RetroArch configuration upon exiting.<br>
The configuration must be saved willingly by going to: `Main Menu` -  `Configuration File` - `Save Current Configuration`.<br>
If you find some better configurations however, you may contribute by sharing it on the `💙-i-want-to-help` channel on our [Discord Server](discord.gg/Dz3szYsP8g) that may be included in the next version.

<br>

### Will you support Lightguns (Sinden, Gun4IR, Samco etc...)?
The long term answer is yes, but there are several issues that need to be addressed from various dependencies that are beyond the scope of what RetroDECK can do by it self. We are talking to several projects and hope to have those issues addressed in the future. Right now the best way to use lightgun hardware is to use Batocera as they have developed native support in their OS.

<br>

## Emulation on the Steam Deck


<img src="../..//wiki_images/graphics/steamdeck/rd_sd_screen6.jpeg" width="300">

<br>

### Can I launch RetroDECK from inside of the Steam Decks gamemode?
Yes, RetroDECK currently only supports Steam Deck's gamemode as it relies on Steam Controller configs.
To add it into Steam please check the second step of `Steam Deck 🕹️` - `Steam Deck - Installation and Updates`.

<br>

### XBOX games are slow on the Steam Deck
Unfortunately on thanks to missing optimizations focusing on the Steam Deck and the hardware is limited in scope makes performance not great. Like most emulators they will get improvements over time and we will follow the XBOX emulators progress with great interest.

<br>

### The games are stuck at 30FPS on the Steam Deck!
Press the [...] button on the Steam Deck, go into the Power menu and see if the Framerate Limit is set to 30FPS and set it to 60FPS or off.

<br>

### Fast forwarding is slow on the Steam Deck!
Same as above: Check the Power menu Framerate Limit.

<br>

### Some emulators run slow when I got my Steam Deck docked to a 4k, 8k or above resolution monitor.
The Steam Deck does not have the power to play all the games in those high resolutions with a stable framerate. What you could do is go into desktop mode while docked and lower the resolution of the display to 1080p or 720p then return to gamemode.

<br>

### I'm having problems with my brand new SD card on my Steam Deck

SD Cards can be tricky and there are a of scam cards out there. <br>
But when you are thinking about getting a new SD Card adhere to the following rules:

- Buy a reputable brand.
- Buy from a reputable store. If a deal sounds to good to be true, it is probably not true.
- Make sure you get a good card with good read and write speeds (what is the best card to get always changes, check current reviews online).
- When getting the card the first thing you should do is format it. Press `Steam` - `Storage` - Select The Card - Press `Y` for Options - `Format Drive`.
- If you are going to name your SD Card avoid exotic names with special characters, emojis or spaces. Stick with to A to Z and 1 to 9.

There are several solutions listed online with quick search on how to test if a SD Card is fake for various OSes like the software `f3` for Linux.

## Emulationstation-DE: General Questions

<img src="../../wiki_images/logos/es-de-logo.png" width="150">

### Why can't I press the up button in menus to jump to the bottom row and vice versa?

[Source](https://gitlab.com/es-de/emulationstation-de/-/blob/master/FAQ.md#why-cant-i-press-the-up-button-in-menus-to-jump-to-the-bottom-row-and-vice-versa)

Why this does not work is that menus in ES-DE are not lists but grids.

A grid can not only contain selectable rows with text but also other features like buttons. <br>
For example in one part of the interface there could just be a list of roms but in another there could be various button elements as in the scraping menu.

Enabling the up and down buttons to wrap around would therefore not work consistently as it would sometimes jump to the last row of the grid or to a button seemingly at random depending on the layout of the grid. <br>
Every time it would requiring a different number of button presses depending on the grid layout.

This type of contextual navigation feels very weird in practice, especially when you have to press the up button twice to get to the bottom of a list in some lists but more times in others depending on the button layout.

The solution we opted for instead is:

- `L1` or `Page Up` Jumps up 6 rows in menus and 10 rows in gamelists.
- `R1` or `Page Down` Jumps down 6 rows in menus and 10 rows in gamelists.
- `L2` or `Home` Jumps to the top of the menu or gamelist.
- `R2` or `End` Jumps to the bottom of the menu or gamelist.


## Emulationstation-DE: Themes

<img src="https://gitlab.com/es-de/themes/themes-list/-/raw/master/screenshots/adroit-es-de/adroit-es-de_02.jpg" width="500">

### How can I add more themes?
ES-DE comes with a built in Theme Downloader `UI Settings  Theme Downloader`. But you can also add themes manually in the: `~/retrodeck/themes` folder.

<br>

### Is there a list of themes?

Yes, check here: [ES-DE: Themes List](https://gitlab.com/es-de/themes/themes-list).

### How do you switch between themes inside of RetroDECK?
 You can switch between them by open the menu and then navigate to `UI Settings  Theme Set` to select the theme you want to use.

<br>

### "Why does the theme I am using not work?" or "Why does the layout look broken?" (black screen with blue text)?
- Please make sure you are specifically using a theme that is compatible with [ES-DE](https://www.es-de.org).
- If you are trying to use a theme that was built for Batocera it will likely not be compatible.
- ES-DE uses a unique theme engine so themes are not directly portable from Batocera.

See the ES-DE's EmulationStation-DE Guide 📘 for more details.

 <br>

### Why does the theme layout look squished?
- The Steam Deck has a screen aspect ratio of `16:10` and most themes that you will find are built for an aspect ratio of `16:9`.  Depending on the theme's design this may cause the layout to appear squished when using it on the Steam Deck's display.

- All of the included themes are built for 16:10 aspect ratio so you should not see this issue with any of them; however if you are downloading a theme from another source there is a chance this can occur for you.

- There are 2 ways to fix this if it does occur: (1) see if a specific version was built for `16:10` aspect ratio and use that instead or (2) edit the theme to make it compatible with that aspect ratio.

<br>



## Emulationstation-DE: Scraping

<img src="https://gitlab.com/es-de/emulationstation-de/-/raw/master/images/es-de_scraper_running.png" width="500">

### Can I manually add custom game images/videos/media for games that I can not scrape?
Yes, check the file structure over at Emulationstation DE's user guide on gitlab.
[Manually copying game media files](https://gitlab.com/es-de/emulationstation-de/-/blob/master/USERGUIDE.md#manually-copying-game-media-files)

<br>

### Where is my scraped data?
In: `~/retrodeck/downloaded_media` folder.

<br>

### I got some weird error message about quota after scraping!
The error message mentions something about quota. You have a quota limit on how much you can scrape each day from [Screenscraper](https://www.screenscraper.fr/) where each item you scrape counts as 1 quota of the daily total.
You can pay them to get a bit more daily quota and show your support or just wait 24 hours.

<br>

### The Scraper said: The Server or Service is down?
The service is down, check [Screenscraper](https://www.screenscraper.fr/) when they get back up.

<br>

### Can I only scrape one game or can I narrow down the scraping method?
Yes, check the `EmulationStation-DE Guide 📘`  for more details.

<br>

### Can I move the downloaded_media folder?
 You can move it with the the move RetroDECK option inside the configurator.

<br>

### Can I copy the downloaded_media folder to another device?
Yes, just copy it into the other device RetroDECK folder.

<br>

### The scraping is very slow...
[Screenscraper](https://www.screenscraper.fr/) offers different types of donations that can increase your speed with extra threads.

<br>



### My systems storage ran out after scraping...
You can clean out images and videos that takes a lot of space under: `~/retrodeck/downloaded_media`.

<br>


#### But I still want them...
The only way to still keep them is either delete something else from the storage or buy more storage.

<br>
