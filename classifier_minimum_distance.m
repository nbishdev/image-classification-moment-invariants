function [ output ] = classifier_minimum_distance( c, s, train_hu, rand_hu )
%CLASSIFIER_MINIMUM_DISTANCE Minimum Euclidean Distance Classifier for 2D images
%   Given a number C of distinct classes, a number S of distinct samples
%   (images) from each class, a set of random objects (images) produced from the
%   original classes and their Hu invariants, classify the random objects using
%   the Minimum Euclidean Distance algorithm, then return the predictions
%
    [n,h] = size(rand_hu);      % Get the dimensions of random objects' maxtrix
    output=zeros(1,n,'uint8');  % Classifier's output (predictions)
    gravity=zeros(c,h);         % Classes' gravity center
    
    for i=1:c   % For each class
                
        % Calculate the class' gravity center using all of its samples
        gravity(i,1)=mean(train_hu((i-1)*s+1:(i-1)*s+1+(s-1),1));
        gravity(i,2)=mean(train_hu((i-1)*s+1:(i-1)*s+1+(s-1),2));
        gravity(i,3)=mean(train_hu((i-1)*s+1:(i-1)*s+1+(s-1),3));

    end
    
    for i=1:n   % For each random object
        
        % Calculate the Euclidean distance between the random object and 
        % each class' gravity center
        d1=norm(rand_hu(i,:)-gravity(1,:));
        d2=norm(rand_hu(i,:)-gravity(2,:));
        d3=norm(rand_hu(i,:)-gravity(3,:));
        
        d = [d1 d2 d3]; % Vector of norms
        
        % Random object belongs to the class from which the distance is the
        % minimum between the three classes
        output(i)=find(d==min(d),1);
        
    end
    
end