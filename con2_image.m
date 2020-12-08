function [indxmx] = con2_image( indxmx, half, firot, xshift, yshift, random )
%CON2_IMAGE
%   Constructs an image from indxmx with zoom (*0.5 or *1) depending on half,
%   rotated by firot, shifted by [xshift,yshift] and with added noise
%
    if random
        noise=abs(randn(1,1))*0.7+0.02;
        indxmx=imresize(indxmx,noise,'nearest');
        indxmx=imresize(indxmx,1/noise,'nearest');
    end

    if half==0
        indxmx=imresize(indxmx,0.5,'nearest'); %Constract a picture of zoom *0.5
    end
    indxmx1=imrotate(indxmx,firot); % Constract Rotate image
    %
    % Then shift the shape by [xshift,yshift]
    %
    indxmx2=indxmx1*255;
    int16=dshape(indxmx2);
    indxmx=trltbmp(int16,[xshift,yshift]);
end


function indxmx2=hlf_s(indxmx)
% indxmx2
%   Constructs an image with half the size of the original one
%
    [height,width]=size(indxmx);
    indxmx2=indxmx(1:2:height,1:2:width);
end


function in16mx=dshape(indxmx)
% dshape
%   dshape computes the coordinates of non zero pixels of the image indxmx.
%   The coordinates of pixels whose values are greater than 1
%   are stored in the in16mx array.
%   
    [HEIGHT,WIDTH]=size(indxmx);
    i=0;
    %Define scratch matrix for time economy
    %Is it Possible to define in an other way the scratch?
    scr=zeros(HEIGHT*WIDTH,2);
    for line=1:HEIGHT
        for clmn=1:WIDTH
            if indxmx(line,clmn)>1
              i=i+1;
              scr(i,1)=line;
              scr(i,2)=clmn;
            end
        end
    end
    in16mx=scr(1:i,1:2);
    clear scr;
end
      
      
function [indxmx]=trltbmp(int16mx,dista)
% trltbmp
%   Constructs an image shifted by the vector dista
%
    coomax=max(int16mx);
    coomin=min(int16mx);
    first=floor(coomax(1)*1.1+abs(dista(1)));
    second=floor(coomax(2)*1.1+abs(dista(2)));
    indxmx=ones(first,second);
    imax=size(int16mx);
    shif1=coomax(1)*0.05;
    shif2=coomax(2)*0.05;
    if dista(1)>0
        shif1=shif1+dista(1);
    end
    if (dista(2)>0)
        shif2=shif2+dista(2);
    end
    shif1=floor(shif1);
    shif2=floor(shif2);
    for i=1:imax(1)
        indxmx(int16mx(i,1)+shif1,int16mx(i,2)+shif2)=256;
    end
end