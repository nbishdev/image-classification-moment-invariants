function [ Generated_shapes ] = random_generator( sdir, tdir, c, n )
% SHAPE_GENERATOR Generates N figures
%   Generates N figures randomly selected from the C classes
%   and distort them with random rotate shift and zoom
%   and noise if specified
%
% RANDOM_GENERATOR Generates figures from existing classes
%   Randomly generates N figures from the original C classes, and distorts them
%   with random rotation, shift, zoom and noise
%
    first(1)=1;
    
    for ishape=1:c
        filename=[sdir,'Shape_',int2str(ishape),'.tif'];
        indxmx=imread(filename,'tif');
        [height(ishape),width(ishape)]=size(indxmx);
        shape(first(ishape):first(ishape)+height(ishape)-1,1:width(ishape))=indxmx;
        first(ishape+1)=first(ishape)+height(ishape);
    end
    
    clear indxmx;
    rand('seed',sum(100*clock));
    ranum=rand([n,5]);
    Generated_shapes=zeros(c,n,'uint8');
    stat=1;
    if stat~=0
        stat=fclose('all');
    end
        
    Generated_shapes=zeros(1,n,'uint8');
    stat=1;
    if stat~=0
        stat=fclose('all');
    end
    for jshape=1:n
    %Select randomly for th shape jshape
        ishape=floor(c-ranum(jshape,1)*3)+1; %Select class
        firot=(floor(12-ranum(jshape,2)*12)+1)*30; %Select rotation
        xshift=floor(100-ranum(jshape,3)*100)-50; %Select xshift
        yshift=floor(100-ranum(jshape,4)*100)-50; %Select yshift
        half=floor(2-ranum(jshape,5)*2); %Select yshift zoom (*0.5 or *1)
        indxmx=shape(first(ishape):first(ishape)+height(ishape)-1,1:width(ishape));
        indxmx=con2_image(indxmx,half,firot,xshift,yshift,true);
        indxmx=uint8(indxmx);
        filename=[tdir,'S',int2str(jshape),'.TIF'];
        imwrite(indxmx,filename);
        Generated_shapes(jshape)=ishape;
    end
    
    %display(Generated_shapes)
end