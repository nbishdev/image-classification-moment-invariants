function [ moment ] = raw_moment( a, i, j )
% RAW_MOMENT Calculates the raw moment of an image
%   Given a 2D grayscale image A and the parameters i,j calculate the raw moment
%   that depends on the parameters
%
    [k,l]=size(a);
    moment=0;
    
    for x=1:k
        for y=1:l
            moment = moment + (x^i) * (y^j) * a(x,y);
        end
    end
end