#!/bin/bash

base_source_path=""

base_dst_path=""

dir_names=()

rotation_py_path=""

for i in "${!dir_names[@]}"; do
    dir_name="${dir_names[$i]}"

    echo "Dir ${dir_name}"

    python3 "$rotation_py_path" \
        --path "${base_source_path}/${dir_name}" \
        --frame_path "${base_dst_path}/${dir_name}_frame_s_0.4" \
        --zoom 0.4

    python3 "$rotation_py_path" \
        --path "${base_source_path}/${dir_name}" \
        --frame_path "${base_dst_path}/${dir_name}_frame_s_0.6" \
        --zoom 0.6
done


