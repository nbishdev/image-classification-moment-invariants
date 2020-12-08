function [ train_hu ] = read_samples( dir, c, s )
% READ_SAMPLES Calculates the Hu invariant moments of images
%   Given C distinct classes and S samples (grayscale images) from each class
%   read these samples and calculate their Hu moments (in logarithmic scale)
%
    train_hu=zeros(c*s,3);  % Hu invariant moments of all samples for training

    for shape=1:c       % For each class
        for sample=1:s  % For each class' sample
            filename=[dir,'S',num2str(shape),'_',num2str(sample),'.TIF'];
            image=imread(filename); % Open sample file
            image=double(image);    % Convert it to double
                        
            % Calculate sample's Hu invariant moments
            train_hu((shape-1)*s+sample,:)=log(abs(hu_invariants(image))+eps);
        end
    end
end