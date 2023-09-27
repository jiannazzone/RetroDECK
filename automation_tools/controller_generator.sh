#!/bin/bash

# STILL BROKEN, DON'T USE ME

# This script is generating the controller config sourced from Neptune (Steam Deck controller)

extract_radial() {
  local RADIAL=$(<emu-configs/defaults/retrodeck/RetroDECK_controller_config.vdf)
  local mode_line='"mode"[[:space:]]*"radial_menu"'
  local counter=0
  local new_radial=""
  local start_reading=false

  # Debug: Display the mode line for troubleshooting
  echo "Searching for: $mode_line"

  # Read the RADIAL variable line by line
  while IFS= read -r line; do
    # Start reading when the line matches the mode line
    if [[ "$line" =~ $mode_line ]]; then
      start_reading=true
      # Debug: Indicate that we started reading
      echo "Started reading..."
      continue  # Skip adding the mode line itself
    fi

    # Continue reading when start_reading is true
    if [ "$start_reading" == true ]; then
      # Increment/decrement counter for '{' and '}'
      if [[ "$line" == *"{"* ]]; then
        ((counter++))

        # After finding the first '{', delete that '{' and everything before it
        if [ $counter -eq 1 ]; then
          new_radial="${line#*{ }"
        fi
      elif [[ "$line" == *"}"* ]]; then
        ((counter--))

        # When the counter reaches 0, stop reading and delete the rest
        if [ $counter -eq 0 ]; then
          # Debug: Indicate that we stopped reading
          echo "Stopped reading..."
          break
        fi
      else
        # Append the line to new_radial when counter is not 0
        new_radial="$new_radial$line"$'\n'
      fi
    fi
  done <<< "$RADIAL"

  # Print the modified content
  echo -n "$new_radial"
}

# Call the function to extract RADIAL
RADIAL=$(extract_radial)

echo "$RADIAL"


# PS3
# RADIAL_CONTROL_ID=17
# PS3="${NEPTUNE%.vdf}_PS3.vdf"
# rm -f $PS3
# cp $NEPTUNE $PS3
# controller_type="controller_ps3"
# controller_caps="1590271"
# sed -i "s/controller_neptune/$controller_type/g" "$PS3" > /dev/null
# sed -i "s/23117823/$controller_caps/g" "$PS3" > /dev/null