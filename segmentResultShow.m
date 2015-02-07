function segmentedRGB=segmentResultShow(segMask,imgRGB)
% Display segmentation result by highlighting region of interest (ROI)
% segMask is the binary label matrix obtained by Grabcut

[xBound,yBound] = size(segMask);

edgeSegImage = edge(segMask,'canny');
[j,k] = find(edgeSegImage == 1);  % border pixels of ROI
numBorderPixels = length(j);

% Find neighborhood pixels of the border pixels in order to thick the
% boundary of ROI for viewing purpose
for m = 1:numBorderPixels
    
% check if the border pixels of ROI is on the boundary of the whole image
    if (j(m) == 1) | (j(m) == xBound)|(k(m) == 1)|(k(m) == yBound) 
       
% find neighborhood pixels of the border pixels of ROI by checking their 4 neighbourhood pixels  
    else
        edgeSegImage(j(m) - 1,k(m)) = 1;
        edgeSegImage(j(m) + 1,k(m)) = 1;
        edgeSegImage(j(m),k(m) + 1) = 1;
        edgeSegImage(j(m),k(m) - 1) = 1;
    end
    
end

% Highlight the found pixels in red
segmentedRGB = imgRGB;
[x, y] = find(edgeSegImage == 1);
n = length(x);
for i = 1 : n
    segmentedRGB(x(i),y(i),1) = uint8(255);
    segmentedRGB(x(i),y(i),2) = uint8(0);
    segmentedRGB(x(i),y(i),3) = uint8(0);
end

%imwrite(segmentedRGB, 'segImage.tif', 'tif');
