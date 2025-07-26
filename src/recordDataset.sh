#!/bin/bash

# python -m lerobot.record \
#     --robot.type=so101_follower \
#     --robot.port=/dev/ttyACM2 \
#     --robot.calibration_dir=/home/qing/tianyi/code/lerobot_519b76110e/utilData/calibration/robots/so101_follower \
#     --robot.id=calib_left_follower_arm \
#     --robot.cameras="{top: {type: opencv, index_or_path: 4, width: 1280, height: 800, fps: 15}, laptop: {type: opencv, index_or_path: 6, width: 640, height: 480, fps: 15}}" \
#     --teleop.type=so101_leader \
#     --teleop.port=/dev/ttyACM1 \
#     --teleop.calibration_dir=/home/qing/tianyi/code/lerobot_519b76110e/utilData/calibration/teleoperators/so101_leader \
#     --teleop.id=calib_left_leader_arm \
#     --display_data=true \
#     --dataset.repo_id=qing/0717_1 \
#     --dataset.num_episodes=2 \
#     --dataset.single_task="Grasp a mineral water bottle and put it in the box of black" \
#     --dataset.episode_time_s=15 \
#     --dataset.reset_time_s=5 \
#     --dataset.push_to_hub=False \
#     --dataset.root=/home/qing/tianyi/code/lerobot_519b76110e/utilData/sampleRecord \
#     --resume=true

# 双臂
python -m lerobot.record \
    --left_robot.type=so101_follower \
    --left_robot.port=/dev/ttyACM5 \
    --left_robot.id=calib_left_follower_arm \
    --left_robot.calibration_dir=/home/qing/tianyi/code/lerobot_519b76110e/utilData/calibration/robots/so101_follower \
    --left_robot.cameras="{top: {type: opencv, index_or_path: 4, width: 1280, height: 720, fps: 15}, laptop: {type: opencv, index_or_path: 6, width: 640, height: 480, fps: 15}}" \
    --right_robot.type=so101_follower \
    --right_robot.port=/dev/ttyACM1 \
    --right_robot.id=calib_right_follower_arm \
    --right_robot.calibration_dir=/home/qing/tianyi/code/lerobot_519b76110e/utilData/calibration/robots/so101_follower \
    --right_robot.cameras="{laptop: {type: opencv, index_or_path: 8, width: 640, height: 480, fps: 15}}" \
    --left_teleop.type=so101_leader \
    --left_teleop.port=/dev/ttyACM0 \
    --left_teleop.id=calib_left_leader_arm \
    --left_teleop.calibration_dir=/home/qing/tianyi/code/lerobot_519b76110e/utilData/calibration/teleoperators/so101_leader \
    --right_teleop.type=so101_leader \
    --right_teleop.port=/dev/ttyACM2 \
    --right_teleop.id=calib_right_leader_arm \
    --right_teleop.calibration_dir=/home/qing/tianyi/code/lerobot_519b76110e/utilData/calibration/teleoperators/so101_leader \
    --dataset.repo_id=waveHello/0719_1 \
    --dataset.num_episodes=2 \
    --dataset.single_task="Grasp a mineral water bottle and put it in the box of black" \
    --dataset.episode_time_s=15 \
    --dataset.reset_time_s=5 \
    --dataset.push_to_hub=False \
    --dataset.root=/home/qing/tianyi/code/lerobot_519b76110e/utilData/sampleRecord \
    --display_data=false

: <<EOF
--dataset.root 这个路径会取代--dataset.repo_id 路径进行录制数据的存放
我修改了一点代码，使得--dataset.repo_id=qing/0717_1 这种格式使用本地数据（而不需要连接huggingface）

# github上推保存时
cp -r ~/.cache/huggingface/lerobot/calibration /home/qing/tianyi/code/lerobot_519b76110e/data/

# 使用校准文件时
cp -r /home/qing/tianyi/code/lerobot_519b76110e/data/calibration ~/.cache/huggingface/lerobot

# 单步调试

            "program": "${workspaceFolder}/src/lerobot/record.py",
            "args": [       
                "--robot.type=so101_follower",
                "--robot.port=/dev/ttyACM0",
                "--robot.id=calib_left_follower_arm",
                "--robot.calibration_dir=/home/qing/tianyi/code/lerobot_519b76110e/utilData/calibration/robots/so101_follower",
                "--robot.cameras={top: {type: opencv, index_or_path: 4, width: 1280, height: 800, fps: 15}, laptop: {type: opencv, index_or_path: 6, width: 640, height: 480, fps: 15}}",
                "--teleop.type=so101_leader",
                "--teleop.port=/dev/ttyACM2",
                "--teleop.id=calib_left_leader_arm",
                "--teleop.calibration_dir=/home/qing/tianyi/code/lerobot_519b76110e/utilData/calibration/teleoperators/so101_leader",
                "--display_data=true",
                "--dataset.repo_id=waveHello/0719_1",
                "--dataset.num_episodes=2",
                "--dataset.single_task=Grasp a mineral water bottle and put it in the box of black",
                "--dataset.episode_time_s=15",
                "--dataset.reset_time_s=5",
                "--dataset.push_to_hub=False",
                "--dataset.root=/home/qing/tianyi/code/lerobot_519b76110e/data/sampleRecord",
                // "--resume=false"     // 是否连接huggingface
            ],
            "env": {
                // "PYTHONPATH": "${workspaceFolder}"
                "PATH": "${env:PATH}:/home/qing/miniconda3/envs/gpu_lerobot_519b76110e/bin",
                "HUGGINGFACE_HUB_OFFLINE": "1"      // 让 HF API 不联网，只用本地
            },

EOF