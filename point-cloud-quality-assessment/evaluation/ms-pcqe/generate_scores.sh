#!/bin/bash

base_projections_dir=""

s_0_4=()

s_0_6=()

output_path=""

database=""
csv_path=""

test_py_path=""

for i in "${!s_0_6[@]}"; do
    frame_06="${s_0_6[$i]}"
    frame_04="${s_0_4[$i]}"

    echo "Dir ${frame_04} and ${frame_06} "
    python3 "$test_py_path" \
        --database "$database" \
        --csv_path "$csv_path" \
        --frame_dir_06 "${base_projections_dir}/$frame_06" \
        --frame_dir_04 "${base_projections_dir}/$frame_04" \
        --output_path "$output_path"
done