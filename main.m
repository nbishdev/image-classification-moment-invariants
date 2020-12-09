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
train_labels=sample_generator(odir,trdir,C,S);

% Generate random objects and get the class from which each of them generated
test_labels=random_generator(odir,tedir,C,N);

% Read the training samples and compute their Hu invariant moments
training_set=read_samples(trdir,C,S);

% Read the random figures and compute their Hu invariant moments
test_set=read_randoms(tedir,N);

% Classify random objects using the 3-NN Classifier and calculate the
% classification error by observing the number of the misclassified objects
predicted_3nn_labels=classifier_knn(C, S, 3, training_set, test_set);
classifier_3nn_error=(test_labels~=predicted_3nn_labels);

% Calculate the number of the misclassified objects of the 3-NN Classifier
misclassified_3nn=length(find(classifier_3nn_error==1));

fprintf('3 NEAREST NEIGHBOR CLASSIFIER RESULTS\n');
fprintf('Out of %d figures, %d were misclassified, which gives us a loss of %.2f%%\n', N, misclassified_3nn, misclassified_3nn/N*100);
fprintf('Out of %d figures, %d were correctly classified, which gives us an accuracy of %.2f%%\n', N, N-misclassified_3nn, (N-misclassified_3nn)/N*100);

fprintf('\n');

% Classify random objects using the Minimum Distance Classifier and
% calculate the classification error by observing the number of the
% misclassified objects
predicted_md_labels=classifier_minimum_distance(C, S, training_set, test_set);
classifier_md_error=(test_labels~=predicted_md_labels);

% Calculate the number of the misclassified objects of the Minimum Distance Classifier
misclassified_md=length(find(classifier_md_error==1));

fprintf('MINIMUM DISTANCE CLASSIFIER RESULTS\n');
fprintf('Out of %d figures, %d were misclassified, which gives us a loss of %.2f%%\n', N, misclassified_md, misclassified_md/N*100);
fprintf('Out of %d figures, %d were correctly classified, which gives us an accuracy of %.2f%%\n', N, N-misclassified_md, (N-misclassified_md)/N*100);