#!/bin/bash

# sudo chmod 666 /dev/ttyACM3

python -m lerobot.setup_motors \
    --teleop.type=so101_leader \
    --teleop.port=/dev/ttyACM0