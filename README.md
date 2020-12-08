# Image classification using moment invariants
This repository contains some MATLAB scripts with a simple implementation of image classification using [image moment invariants](https://en.wikipedia.org/wiki/Image_moment).

More specifically, I use [Hu invariants](https://en.wikipedia.org/wiki/Image_moment#Rotation_invariants) to classify grayscale images that originate from 3 distinct classes, with the help of [3-Nearest Neighbors (3-NN)](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm) and [Minimum Euclidean Distance](http://sar.kangwon.ac.kr/etc/rs_note/rsnote/cp11/cp11-6.htm) classifiers.

The 3 original TIFF images/classes are located in the [original-images](/original-images) directory.

The classification features consist of the first 3 out of the 7 Hu invariants.

To execute the code using MATLAB or GNU Octave, naviagte to the directory with the scripts and run [main.m](/main.m)
