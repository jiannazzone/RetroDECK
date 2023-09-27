#!/bin/bash

# STILL BROKEN

# This script is generating the controller config sourced from Neptune (Steam Deck controller)

NEPTUNE=emu-configs/defaults/retrodeck/RetroDECK_controller_config.vdf
read -r -d '' RADIAL <<EOF
            HELLO
            I
            AM
            THE
            RADIAL
EOF

# GENERIC
GENERIC="${NEPTUNE%.vdf}_GENERIC.vdf"
rm -f $GENERIC
cp $NEPTUNE $GENERIC
controller_type="controller_generic"
controller_caps="1573887"
sed -i "s/controller_neptune/$controller_type/g" "$GENERIC" > /dev/null
sed -i "s/23117823/$controller_caps/g" "$GENERIC" > /dev/null

# PS3
RADIAL_CONTROL_ID=17
PS3="${NEPTUNE%.vdf}_PS3.vdf"
rm -f $PS3
cp $NEPTUNE $PS3
controller_type="controller_ps3"
controller_caps="1590271"
sed -i "s/controller_neptune/$controller_type/g" "$PS3" > /dev/null
sed -i "s/23117823/$controller_caps/g" "$PS3" > /dev/null

# Define the pattern with the actual value
pattern="^id[[:space:]]+\"$RADIAL_CONTROL_ID\"$"

# Find the line number where the pattern occurs
line_number=$(awk -v pat="$pattern" '$0 ~ pat {print NR}' $PS3)
echo "DEBUG: $line_number"

if [ ! -z "$line_number" ]; then
    # Find the start of the "inputs" section by searching for the line containing "inputs"
    start_line=$(awk -v line="$line_number" 'NR < line && $0 ~ /"inputs"/ {print NR}' $PS3)
    echo "DEBUG: $start_line"
    
    if [ ! -z "$start_line" ]; then
        # Find the end of the "inputs" section by searching for the next "}" after "inputs"
        end_line=$(awk -v start="$start_line" '$0 ~ /}/ && NR > start {print NR; exit}' $PS3)
        
        if [ ! -z "$end_line" ]; then
            # Replace the content inside the "inputs" section with the value of $RADIAL_CONTROL_ID
            sed -i "$start_line,$end_line{s/.*/$RADIAL_CONTROL_ID/}" $PS3
        fi
    fi
fi