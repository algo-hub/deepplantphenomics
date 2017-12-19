### The [DPP paper](http://journal.frontiersin.org/article/10.3389/fpls.2017.01190/full) is now available online!

# Deep Plant Phenomics

Deep Plant Phenomics (DPP) is a platform for plant phenotyping using deep learning. Think of it as [Keras](https://keras.io/) for plant scientists.

DPP integrates [Tensorflow](https://www.tensorflow.org/) for learning and [PlantCV](http://plantcv.danforthcenter.org/) for image processing. This means that it is able to run on both CPUs and GPUs, and scale easily across devices.

Read the [doumentation](http://deep-plant-phenomics.readthedocs.io/en/latest/) for tutorials, or see the included examples.

DPP is maintained at the [Plant Phenotyping and Imaging Research Center (P2IRC)](http://p2irc.usask.ca/) at the [University of Saskatchewan](https://www.usask.ca/). 🌾🇨🇦

## What's Deep Learning?

Principally, DPP provides deep learning functionality for plant phenotyping and related applications. Deep learning is a category of techniques which encompasses many different types of neural networks. Deep learning techniques lead the state of the art in many image-based tasks, including image classification, object detection and localization, image segmentation, and others.

## What Can I Do With This?

This package provides two things:

### 1. Useful tools made possible using pre-trained neural networks

For example, calling `tools.predict_rosette_leaf_count(my_files)` will use a pre-trained convolutional neural network to estimate the number of leaves on each rosette plant.

### 2. An easy way to train your own models

For example, using a few lines of code you can easily use your data to train a convolutional neural network to rate plants for biotic stress. See the [tutorial](http://deep-plant-phenomics.readthedocs.io/en/latest/Tutorial-Training-The-Leaf-Counter/) for how the leaf counting model was built.

## Run the model
docker run -v [Package Folder]\deepplantphenomics\network_states:/opt/conda/lib/python2.7/site-packages/deepplantphenomics/network_states -v [Package Folder]:/data --entrypoint python algohub/dpp /data/examples/rosette_leaf_count_test.py

## Help

If you are interested in research collaborations or want more information regarding this package, please email `jordan.ubbens@usask.ca`.

If you have a feature request or bug report, please open a new issue.
