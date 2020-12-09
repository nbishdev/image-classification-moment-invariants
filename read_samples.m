function [ features ] = read_samples( dir, c, s )
% READ_SAMPLES Calculates the Hu invariant moments of images
%   Given C distinct classes and S 2D grayscale samples from each class, read
%   these samples and calculate their Hu moments (in logarithmic scale) to use
%   them as training features
%
    features=zeros(c*s,3);  % Hu invariant moments of all samples
    
    for shape=1:c       % For each class
        for sample=1:s  % For each class' sample
            filename=[dir,'S',num2str(shape),'_',num2str(sample),'.tif'];
            image=imread(filename); % Open sample file
            image=double(image);    % Convert it to double

            % Calculate sample's Hu invariant moments
            features((shape-1)*s+sample,:)=log(abs(hu_invariants(image))+eps);
        end
    end
end