function [hfig] =  AutoCut
% AUTOCUT  - Main interface for AutoCut Tool
% This function creates the user interface (figure window
% and custom menu)


clear all;

% Global Variables
global sopt;

% Initialize all required parameters
sopt = mksopt;

% Main Menu 
hfig = figure('units','pixels','position',[50 100 1100 600],...
   'tag','AutoCut', 'name','Auto-Cut Segmentation',...
   'menubar','none','numbertitle','off');

% File menu for figure, with callbacks:
% Open...    (callback to displayImage)
% Exit       (closes figure window)

hmenu = uimenu('Label','File');

% AutoSeg function - loads the image file
uimenu(hmenu,'label','Open...','callback','AutoCutSeg ')

%exit 
uimenu(hmenu,'label','Exit','callback','closereq','separator','on');