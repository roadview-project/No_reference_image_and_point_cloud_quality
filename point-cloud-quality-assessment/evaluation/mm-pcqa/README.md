## Running MM-PCQA

### File conversion

To run the MM-PCQA scoring, you first need to convert the files into PLY files. This can be done using the `file_conversions.py` script. It requires a YAML file with one entry `bin_dir` for the directory containing the KITTI-style bin point clouds and one entry `ply_dir` which is where you want the converted point clouds to end up.

The script can then be run using the command:
```python
python3 file_conversions.py -c path/to/config/file
```

### Scoring the point clouds

Scoring the point clouds is done using the `run_mm_pcqa.ply` script and requires having cloned the MM-PCQA repo. It takes a YAML configuration file that requires the following entries:

* `ply_dir`: Path to where the PLY point clouds are stored
* `test_single_ply_path`: This is the path to where the `test_single_ply.py` script is stored. This is a script from the MM-PCQA reposiory which needs to be cloned.
* `model_pth_path`: This is the path to where the underlying model is stored. A link to downloading the MM-PCQA model trained on the WPC dataset can be found in the [MM-PCQA repo](https://github.com/zzc-1998/MM-PCQA?tab=readme-ov-file).
* `save_results_path`: Path to where the scores should be stored.




