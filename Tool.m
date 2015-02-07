function Tool
%Segmentation Tool
% Tools AutoCut



% Main Menu
hfig = figure('units','pixels','position',[100 200 300 400],...
   'tag','SegTool', 'name','Super Segmentation Tool',...
   'menubar','none','numbertitle','off');




% AutoCut (Grab Cut) Tool Button                
data.ui.smart = uicontrol(hfig, 'Style','pushbutton', 'Units', 'Normalized','Position',[.25 .7 .5 .1], ...
                    'String','AutoCut','Callback', 'AutoCut');
                
