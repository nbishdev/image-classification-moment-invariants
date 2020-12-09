function [ Generated_shapes ] = random_generator( sdir, tdir, c, n )
% RANDOM_GENERATOR Generates figures from existing classes
%   Generates N radnom 2D grayscale figures selected from the C prototype
%   classes, by applying distortion with random rotation, shift, zoom and noise
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
    ranum=rand([n,5]);        
    Generated_shapes=zeros(1,n,'uint8');
    stat=1;
    if stat~=0
        stat=fclose('all');
    end
    
    % Randomly select parameters for the random figures
    for item=1:n
        ishape=floor(c-ranum(item,1)*3)+1;        % Select class
        firot=(floor(12-ranum(item,2)*12)+1)*30;  % Select rotation
        xshift=floor(100-ranum(item,3)*100)-50;   % Select xshift
        yshift=floor(100-ranum(item,4)*100)-50;   % Select yshift
        half=floor(2-ranum(item,5)*2);            % Select zoom (*0.5 or *1)
        indxmx=shape(first(ishape):first(ishape)+height(ishape)-1,1:width(ishape));
        indxmx=con2_image(indxmx,half,firot,xshift,yshift,true);
        indxmx=uint8(indxmx);
        filename=[tdir,'S',int2str(item),'.tif'];
        imwrite(indxmx,filename);
        Generated_shapes(item)=ishape;
    end
    
    %display(Generated_shapes)
end