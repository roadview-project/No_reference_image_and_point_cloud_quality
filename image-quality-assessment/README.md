# Image quality assessment

This reppository contains scripts for distorting images using weather-related distortions, running NR-IQA metrics from `pyiqa`, and some tools for analyzing the results.

## Installation

To install the required packages, run:

```bash
pip install -r requirements.txt
```

## Distorting images

Distorting images is done using the `corrupt_images.py` script. It requires a configuration file that specifies the distortion parameters. It can be run using the following command:

```python
python3 -m distortion.corrupt_images -c configs/distortion_configs/distortion_config.yaml
```

**NOTE:** The distortion code has a bug related to the color space conversion. It seems to be related to how the images are read using OpenCV. Albumentations [suggest](https://albumentations.ai/docs/examples/example/) doing it with the line:

```
image = cv2.imread("images/image_3.jpg", cv2.IMREAD_COLOR_RGB)
```
but if I do that and then apply a distortion, then the image turns blue. If I convert the images back to RGB after having distorted the image, the image turns red instead. If I stick to only using RGB color space, then the image also turns blue after having added the distortion.

This bug is probably related to the changes of Albumentations in the last months, as the code worked before. I have not found the root cause of the issue. One workaround is to use an earlier version of Albumentations.

## Running the image quality assessment

To run the image quality assessment, use the `run_metric.py` script. It requires a configuration file that specifies the metric, input, output directories, and other parameters. Note that the script uses Wandb to log the results so a Wandb account is required. It can be run using the following command:

```python
python3 -m evaluation.run_metric -c configs/metric_configs/metric_config.yaml
```

## Running the analysis

To run the analysis which in this barebones version calculates the Spearman and Kendall rank correlation coefficients (SRCC and KRCC), run the `analysis.py` script. It can be run using the following command:

```python
python3 -m analysis.analysis -c configs/analysis_configs/analysis_config.yaml
```
