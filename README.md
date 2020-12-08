# Image classification using moment invariants
This repository contains some MATLAB scripts with a simple implementation of image classification using [image moment invariants](https://en.wikipedia.org/wiki/Image_moment).

More specifically, I use [Hu invariants](https://en.wikipedia.org/wiki/Image_moment#Rotation_invariants) to classify grayscale images that originate from 3 distinct classes, with the help of [3-Nearest Neighbors (3-NN)](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm) and [Minimum Euclidean Distance](http://sar.kangwon.ac.kr/etc/rs_note/rsnote/cp11/cp11-6.htm) classifiers.

The 3 original TIFF images/classes are located in the [original-images](/original-images) directory.

Using these 3 images, I generate 15 images as training samples (5 from each class) by applying shift, rotation and zoom to the original images.

I also generate 10 random images as test objects that are randomly selected from the classes and have shift, rotation, zoom and noise applied over them.

The classification features consist of the first 3 out of the 7 Hu invariants.

Using these 3 invariants, I classify the random objects to the 3 classes, using the classifiers mentioned above.

To execute the code using MATLAB or GNU Octave, naviagte to the directory with the scripts and run [main.m](/main.m)
