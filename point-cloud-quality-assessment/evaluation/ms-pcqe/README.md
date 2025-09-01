## Running MS-PCQE

### Getting the image projections

To run MS-PCQE, you first have to generate the projections of the point clouds. This is done using the script `gen_images.sh`. You need to have the MS-PCQE repo cloned on your system for this to work. These are the variables that need to be set:

- `base_source_path`: This is the path to the directory that within it contains a directory for each of the base point clouds. Each of the nested directories should contain versions of the same point cloud but with different amounts of noise. See the `distortion` part of this repo to understand how this works.
- `base_dst_path`: This is the base path of where the image projections will end up.
- `dir_names`: These are the names of the directories containing the distorted point clouds that should be directly under `base_source_path`.
- `rotation_py_path`: This is the path to where the `rotation.py` file in the MS-PCQE repo is found. This is the file that actually generates the image projections.

### Scoring with MS-PCQE

Running MS-PCQE is done with the `generate_scores.sh` script. As with generating the image projections, the MS-PCQE repo has to be cloned for this to work. The following variables of the `generate_scores.sh` have to be set:

- `base_projections_dir`: This is the base path to where the image projections are stored.
- `s_0_4`: These are the names of the folders in `base_projections_dir` with zoom 0.4 that should be included in the scoring. Note that for a particular point cloud, it has to have both the `s_0_4` and the `s_0_6` directory to work.
- `s_0_6`: These are the names of the folders in `base_projections_dir` with zoom 0.6 that should be included in the scoring.
- `output_path`: Full path to the JSON file where you want the scores to end up.
- `database`: This has to be set to configure the correct train and test datasets in the `test.py` script in MS-PCQE. Look in the main function of `test.py` to understand more.
- `csv_path`: Path to where the ground truth mean opinion scores are set. If there are no mean opinion scores, just input a file with the correct structure. How these files are structured can be found under `database/` in the MS-PCQE repo.
