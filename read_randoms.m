function [ features ] = read_randoms( dir, n )
% READ_RANDOMS Calculates the Hu invariant moments of images
%   Given a set of N randomly generated 2D grayscale figures produced from
%   the prototype classes, read these figures and calculate their Hu moments (in
%   logarithmic scale) to use them as classification features
%
    features=zeros(n,3);    % Hu invariant moments of all random figures

    for item=1:n     % For each random object
        filename=[dir,'S',num2str(item),'.TIF'];
        image=imread(filename); % Open object file
        image=double(image);    % Convert it to double
        
        % Calculate object's Hu invariant moments
        features(item,:)=log(abs(hu_invariants(image))+eps);
    end 
end