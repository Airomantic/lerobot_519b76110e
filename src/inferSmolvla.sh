#!/bin/bash

echo $USER

python -m lerobot.record \
    --robot.type=so100_follower \
    --robot.port=/dev/ttyACM0 \
    --robot.cameras="{top: {type: opencv, index_or_path: 2, width: 640, height: 480, fps: 15}, laptop: {type: opencv, index_or_path: 4, width: 640, height: 480, fps: 15}}" \
    --robot.id=black \
    --dataset.repo_id=qing/eval_takeBottle \
    --dataset.num_episodes=2 \
    --dataset.episode_time_s=20 \
    --dataset.single_task="Grasp a mineral water bottle and put it in the box of black." \
    --policy.path=/home/qing/tianyi/code/lerobot_519b76110e/models/smolvla_takeBottle_28_120000/pretrained_model \
    --dataset.push_to_hub=False \
    --dataset.fps=15 \
    --dataset.root=/home/qing/tianyi/code/lerobot_519b76110e/data/deploy_record
    