#!/usr/bin/python3

# Original Script by https://gist.github.com/nullstalgia

import os
import shutil
import configparser

retrodeck_folder = os.path.expanduser('~')+"/retrodeck"

rclone_executable = os.path.expanduser('~')+"/retrodeck/rclone/rclone"

sync_config_path=f"/var/config/rclone/cloud-sync.conf"
sync_config_def_path=f"/var/config/rclone/cloud-sync.conf.default"

rclone_config_path=f"/var/config/rclone/rclone.conf"
rclone_config_def_path=f"/var/config/rclone/rclone.conf.default"

rules_config_path=f"/var/config/rclone/cloud-sync-rules.conf"
rules_config_def_path=f"/var/config/rclone/cloud-sync-rules.conf.default"

# make sure we have some configs
if not os.path.exists(sync_config_path):
    shutil.copyfile(sync_config_def_path, sync_config_path)

# https://stackoverflow.com/questions/2819696/parsing-properties-file-in-python/25493615#25493615

with open(sync_config_path, 'r') as f:
    config_string = '[dummy_section]\n' + f.read()
config = configparser.ConfigParser()
config.read_string(config_string)
sync_remote = config['dummy_section']['CLOUD_SYNC_REMOTE'].replace('"', "")
sync_path = config['dummy_section']['CLOUD_SYNC_PATH'].replace('"', "").rstrip("/")


if not os.path.exists(rclone_config_path):
    #shutil.copyfile(rclone_config_def_path, rclone_config_path)
    raise(FileNotFoundError)

if not os.path.exists(rules_config_path):
    shutil.copyfile(rules_config_def_path, rules_config_path)

# parse the args and see if we want to upload or download
for opt, arg in opts:
    if opt == ("-h", "--help"):
         print (f"Usage:\n\
flatpak run [FLATPAK-RUN-OPTION] net.retrodeck-retrodeck [ARGUMENTS]\n\
\n\
Arguments:\n\
    -h, --help        Print this help\n\
    --reset           Starts the initial RetroDECK installer (backup your data first!)\n\
    --reset-ra        Resets RetroArch's config to the default values\n\
    --reset-sa        Reset standalone emulator configs to the default values\n\
    --reset-tools     Recreate the tools section\n\
\n\
https://retrodeck.net")
         sys.exit()
    elif opt in ("-u", "--upload"):

        # upload states
        #print("Syncing savestates")
        #os.system(f"rclone sync -P {retrodeck_folder}/roms/ \"{sync_remote}\":\"{sync_path}/savestates\" --include *.state* --log-file {retrodeck_folder}/.logs/cloud-sync.log")

        # upload saves
        os.system(f'zenity --icon-name=net.retrodeck.retrodeck --info --no-wrap --window-icon="/app/share/icons/hicolor/scalable/apps/net.retrodeck.retrodeck.svg" --title "RetroDECK" --text=Uploading saves, screenshots, and gamedata.\n\nPress ok to continue and wait for the completion message.')
        os.system(f"rclone sync -P {retrodeck_folder}/roms/ \"{sync_remote}\":\"{sync_path}/\" --filter-from {rules_config_path} --log-file {retrodeck_folder}/.logs/cloud-sync.log")
        os.system(f'zenity --icon-name=net.retrodeck.retrodeck --info --no-wrap --window-icon="/app/share/icons/hicolor/scalable/apps/net.retrodeck.retrodeck.svg" --title "RetroDECK" --text=Done!\n\nYou can check the logfiles in {retrodeck_folder}/.logs/cloud-sync.log')

    elif opt in ("-d", "--download"):

        # download states
        #print("Syncing savestates")
        #os.system(f"rclone sync -P \"{sync_remote}\":\"{sync_path}/savestates\" {retrodeck_folder}/roms/ --include *.state* --log-file {retrodeck_folder}/.logs/cloud-sync.log")

        # download saves
        os.system(f'zenity --icon-name=net.retrodeck.retrodeck --info --no-wrap --window-icon="/app/share/icons/hicolor/scalable/apps/net.retrodeck.retrodeck.svg" --title "RetroDECK" --text=Downloading saves, screenshots, and gamedata.\n\nPress ok to continue and wait for the completion message.')
        os.system(f"rclone sync -P \"{sync_remote}\":\"{sync_path}/\" {retrodeck_folder}/roms/ --filter-from {rules_config_path} --log-file {retrodeck_folder}/.logs/cloud-sync.log")
        os.system(f'zenity --icon-name=net.retrodeck.retrodeck --info --no-wrap --window-icon="/app/share/icons/hicolor/scalable/apps/net.retrodeck.retrodeck.svg" --title "RetroDECK" --text=Done!\n\nYou can check the logfiles in {retrodeck_folder}/.logs/cloud-sync.log')