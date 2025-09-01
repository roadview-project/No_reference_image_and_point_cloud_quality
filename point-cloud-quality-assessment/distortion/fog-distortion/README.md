# Distortion

The code is a modified version of the code from [Robo3D](https://github.com/ldkong1205/Robo3D?tab=readme-ov-file#license) which in turn uses the code from [Lidar_fog_sim](https://github.com/MartinHahner/LiDAR_fog_sim).

## Generating the integrals

Distorting the point clouds first requires precomputing certain integrals numerically. Exactly why this is done is explained in the original [paper](https://trace.ethz.ch/publications/2021/lidar_fog_simulation/) by Hahner et al.

To generate the integrals run the script `gen_int_tables.sh`. You can specify for what `alpha` values you want to compute the integrals for. The integrals will be saved in the `integrals/` folder.

`r_0_max` which is the maximum range and `n_steps` are set in `generate_integral_lookup_table.py` but can be changed.

## Distorting the point clouds

To distort the point clouds, run the script `distort_fog.sh`. In this file you need to specify the point clouds you want to distort in `SOURCE_FILES` and these should all be in the directory `ROOT_DIRECTORY`. You also need to set the attenuation coefficients alpha that you want to use. Each specified point cloud will then be distorted using each alpha value.

