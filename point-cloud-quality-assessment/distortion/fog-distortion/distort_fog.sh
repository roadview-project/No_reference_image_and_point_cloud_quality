
# Name of the point cloud files inside the root_folder
export SOURCE_FILES=(
  "example_1.bin" "example_2.bin"
)

export ROOT_FOLDER="$PWD"

for i in $(seq 0 $((${#SOURCE_FILES[@]} - 1))); do
  echo "Generating distortions for source file ${SOURCE_FILES[i]}"
    CUDA_VISIBLE_DEVICES=0 python fog_simulation.py \
            --root_folder "$ROOT_FOLDER" \
            --inte_folder "$PWD/integrals" \
            --dst_folder  "$PWD/distorted" \
            --alphas 0.010 0.020 0.030 0.040 0.050 0.060 0.070 0.080 0.090 0.100 \
            --pc_name ${SOURCE_FILES[i]} \

done