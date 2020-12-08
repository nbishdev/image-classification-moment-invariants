function [ moment ] = central_moment( a, i, j )
% CENTRAL_MOMENT Calculates the central moment of an image
%   Given a 2D grayscale image A and the parameters i,j calculate the central
%   moment that depends on the parameters using four of the raw moments
%
    [k,l] = size(a);
    xc = raw_moment(a,1,0) / raw_moment(a,0,0);
    yc = raw_moment(a,0,1) / raw_moment(a,0,0);
    moment = 0;
    
    for x = 1 : k
        for y = 1 : l
            moment += ((x - xc)^i) * ((y - yc)^j) * a(x,y);
        end
    end
end