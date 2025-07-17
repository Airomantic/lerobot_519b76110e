#!/bin/bash

python -m lerobot.record \
    --robot.type=so101_follower \
    --robot.port=/dev/ttyACM2 \
    --robot.id=/home/qing/tianyi/code/lerobot_519b76110e/data/calibration/robots/so101_follower/calibration_follower_arm \
    --robot.cameras="{top: {type: opencv, index_or_path: 4, width: 1280, height: 800, fps: 15}, laptop: {type: opencv, index_or_path: 6, width: 640, height: 480, fps: 15}}" \
    --teleop.type=so101_leader \
    --teleop.port=/dev/ttyACM1 \
    --teleop.id=/home/qing/tianyi/code/lerobot_519b76110e/data/calibration/teleoperators/so101_leader/calibration_leader_arm \
    --display_data=true \
    --dataset.repo_id=qing/0717_1 \
    --dataset.num_episodes=2 \
    --dataset.single_task="Grasp a mineral water bottle and put it in the box of black" \
    --dataset.episode_time_s=15 \
    --dataset.reset_time_s=5 \
    --dataset.push_to_hub=False \
    --dataset.root=/home/qing/tianyi/code/lerobot_519b76110e/data/sampleRecord


: <<EOF
--dataset.root 这个路径会取代--dataset.repo_id 路径进行录制数据的存放

# github上推保存时
cp -r ~/.cache/huggingface/lerobot/calibration /home/qing/tianyi/code/lerobot_519b76110e/data/

# 使用校准文件时
cp -r /home/qing/tianyi/code/lerobot_519b76110e/data/calibration ~/.cache/huggingface/lerobot

EOF