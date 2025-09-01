
# Name of the point cloud files inside the root_folder
export SOURCE_FILES=(
  "000_000162.bin" "007_000237.bin" "014_000195.bin" "057_000232.bin" "064_000074.bin" "071_000171.bin"
  "001_000053.bin" "008_000155.bin" "015_000177.bin" "058_000021.bin" "065_000154.bin" "072_000011.bin"
  "002_000297.bin" "009_000128.bin" "016_000199.bin" "059_000164.bin" "066_000077.bin" "073_000222.bin"
  "003_000239.bin" "010_000237.bin" "017_000045.bin" "060_000238.bin" "067_000269.bin" "074_000167.bin"
  "004_000008.bin" "011_000139.bin" "018_000292.bin" "061_000063.bin" "068_000293.bin" "075_000078.bin"
  "005_000008.bin" "012_000198.bin" "019_000236.bin" "062_000100.bin" "069_000214.bin"
  "006_000145.bin" "013_000168.bin" "056_000039.bin" "063_000200.bin" "070_000066.bin"
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