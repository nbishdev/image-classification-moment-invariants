function [ moment ] = standardized_moment( a, i, j )
% STANDARDIZED_MOMENT Calculates the standardized central moment of an image
%   Given a 2D grayscale image A and the parameters i,j calculate the
%   standardized central moment that depends on the parameters using one of the
%   raw moments and one of the central moments
%
    l=((i + j)/2)+1;
    moment = central_moment(a,i,j) / (raw_moment(a, 0, 0)^l);
end