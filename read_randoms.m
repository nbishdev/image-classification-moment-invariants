function [ rand_hu ] = read_randoms( dir, n )
% READ_RANDOMS Calculates the Hu invariant moments of images
%   Given a set of N randomly generated objects (grayscale images) produced from
%   the original classes, read these objects and calculate their Hu moments (in
%   logarithmic scale)
%
    rand_hu=zeros(n,3);       % Hu invariant moments of all random objects for classification

    for element=1:n     % For each random object
        filename=[dir,'S',num2str(element),'.TIF'];
        image=imread(filename); % Open object file
        image=double(image);    % Convert it to double
        
        % Calculate object's Hu invariant moments
        rand_hu(element,:)=log(abs(hu_invariants(image))+eps);
    end 
end