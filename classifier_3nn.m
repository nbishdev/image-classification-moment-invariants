function [ output ] = classifier_3nn( c, s, train_hu, rand_hu )
% CLASSIFIER_3NN 3-Nearest Neighbor Classifier
%   Given a number C of distinct classes, a number S of distinct samples
%   (images) from each class, a set of random objects (images) produced from the
%   original classes and their Hu invariants, classify the random objects using
%   the 3-Nearest Neighbors algorithm using the Euclidean distance as the
%   distance metric, then return the predictions
%
    [n, h] = size(rand_hu);     % Get the dimensions of random objects' maxtrix
    output=zeros(1,n,'uint8');  % Classifiers output (predictions)
    
    for i=1:n                   % For each random object
        
        dist=zeros(c*s,2);      % Matrix with col1: the Euclidean distance
                                % between the random object and each sample of
                                % the training set and col2: the sample's class
        
        for j=1:s:c*s           % For each class
            class = ceil(j/s);  % Keep class number
            for k=j:j+s-1       % For each class' sample
              
                % Calculate the Eucledian distance between the random object and
                % the class' sample. Also, keep a record of sample's class
                dist(k,1)=norm(rand_hu(i,:)-train_hu(k,:));
                dist(k,2)=class;
                
            end
        end
        
        dist = sortrows(dist,1);        % Sort matrix by the 1st row (distance)
                                        % in ascending order
        
        classes = dist(1:3,2);          % Get the class of the first 3
                                        % rows of the matrix (3 min distances)
        
        d1=length(find(classes==1));    % Number of occurrences of class 1
                                        % between the first 3 rows
        d2=length(find(classes==2));    % Number of occurrences of class 2
                                        % between the first 3 rows
        d3=length(find(classes==3));    % Number of occurrences of class 3
                                        % between the first 3 rows
        
        d = [d1 d2 d3];                 % Vector of occurencies
        
        % Random object belongs to the class with the highest number of
        % occurrences between the first three rows
        output(i)=find(d==max(d),1);
        
    end
    
end