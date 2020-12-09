clear all;
close all;
clc;

C = 3;  % Number of distinct classes
S = 5;  % Number of samples (per class) for training (C * S samples in total)
N = 10; % Number of randomly generated objects for classification

odir='./original-images/';  % Directory with original images
trdir='./training-data/';   % Directory with training samples
tedir='./test-data/';       % Directory with random objects

mkdir(trdir);               % Make sure directory exists
mkdir(tedir);               % Make sure directory exists

% Randomly generate training data based on original images,
% utilizing rotation, shifting and zoom
sample_classes=sample_generator(odir,trdir,C,S);

% Generate random objects and get the class from which each of them generated
random_classes=random_generator(odir,tedir,C,N);

% Get samples' Hu invariant moments
train_hu=read_samples(trdir,C,S);

% Get random objects' Hu invariant moments
rand_hu=read_randoms(tedir,N);

% Classify random objects using the 3-NN Classifier and calculate the
% classification error
predicted_3nn=classifier_knn(C, S, 3, train_hu, rand_hu);
classifier_3nn_error=(random_classes~=predicted_3nn);

% Calculate the number of the misclassified objects of the 3-NN Classifier
misclassified_3nn=length(find(classifier_3nn_error==1))

fprintf('');

% Classify random objects using the Minimum Distance Classifier and
% calculate the classification error
predicted_minimum_distance=classifier_minimum_distance(C, S, train_hu, rand_hu);
classifier_minimum_distance_error=(random_classes~=predicted_minimum_distance);

% Calculate the number of the misclassified objects of the Minimum Distance Classifier
misclassified_minimum_distance=length(find(classifier_minimum_distance_error==1))