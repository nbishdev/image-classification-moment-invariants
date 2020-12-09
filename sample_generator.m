function [ Generated_shapes ] = sample_generator( sdir, tdir, c, s )
% SAMPLE_GENERATOR Generates figures from existing classes
%   Generates C*S sample 2D grayscale figures from the C prototype classes (S
%   figures from each class), and distorts them with random rotation, shift and
%   zoom
%
    % Initialaise random number generator of MATLAB
    rand('seed',sum(100*clock));
    
    first(1)=1;
    
    for ishape=1:c
        filename=[sdir,'Shape_',int2str(ishape),'.tif'];
        indxmx=imread(filename,'tif');
        [height(ishape),width(ishape)]=size(indxmx);
        shape(first(ishape):first(ishape)+height(ishape)-1,1:width(ishape))=indxmx;
        first(ishape+1)=first(ishape)+height(ishape);
    end
    
    clear indxmx;
    ranum=rand([c*s,5]);
    Generated_shapes=zeros(c*s,'uint8');
    stat=1;
    if stat~=0
        stat=fclose('all');
    end 
    
    for ishape=1:c
        % Randomly select parameters for the sample figures
        for jshape=1:s
            idx=(ishape-1)*s+jshape; %Index in the random numbers table
            firot=(floor(12-ranum(idx,2)*12)+1)*30; %Select rotation
            xshift=floor(100-ranum(idx,3)*100)-50; %Select xshift
            yshift=floor(100-ranum(idx,4)*100)-50; %Select yshift
            half=floor(2-ranum(idx,5)*2); %Select yshift zoom (*0.5 or *1)
            indxmx=shape(first(ishape):first(ishape)+height(ishape)-1,1:width(ishape));
            indxmx=con2_image(indxmx,half,firot,xshift,yshift,false);
            indxmx=uint8(indxmx);
            filename=[tdir,'S',int2str(ishape),'_',int2str(jshape),'.TIF'];
            imwrite(indxmx,filename);
            Generated_shapes(idx)=ishape;
        end
    end
    
    %display(Generated_shapes)
end    