#!/usr/bin/python3

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

# sync states
#print("Syncing savestates")
#os.system(f"rclone bisync -v --workdir /var/cache/rclone/bisync {retrodeck_folder}/roms/ \"{sync_remote}\":\"{sync_path}/savestates\" --include *.state* --log-file {retrodeck_folder}/.logs/cloud-sync.log")

print("Syncing saves, screenshots, and gamedata")
os.system(f"rclone bisync -v --workdir /var/cache/rclone/bisync {retrodeck_folder}/roms/ \"{sync_remote}\":\"{sync_path}/\" --filters-file {rules_config_path} --log-file {retrodeck_folder}/.logs/cloud-sync.log")