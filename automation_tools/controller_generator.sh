#!/bin/bash

# This script is generating the controller config sourced from Neptune (Steam Deck controller)

NEPTUNE=emu-configs/defaults/retrodeck/RetroDECK_controller_config.vdf

# GENERIC
GENERIC="${NEPTUNE%.vdf}_GENERIC.vdf"
rm -f $GENERIC
cp $NEPTUNE $GENERIC
controller_type="controller_generic"
controller_caps="1573887"
sed -i "s/controller_neptune/$controller_type/g" "$GENERIC" > /dev/null
sed -i "s/23117823/$controller_caps/g" "$GENERIC" > /dev/null

# PS3
PS3="${NEPTUNE%.vdf}_PS3.vdf"
rm -f $PS3
cp $NEPTUNE $PS3
controller_type="controller_ps3"
controller_caps="1590271"
sed -i "s/controller_neptune/$controller_type/g" "$PS3" > /dev/null
sed -i "s/23117823/$controller_caps/g" "$PS3" > /dev/null

