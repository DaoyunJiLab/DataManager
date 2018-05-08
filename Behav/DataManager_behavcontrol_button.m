function DataManager_behavcontrol_button(hf, pos)
%%add control buttons to spike dabase viewer
%%three major groups: (1) view and output selected spike/field values
%%  (2) analysis tools: add/remove fields
%%  (3) plot tools: 

%%hf = main figure to put control puttons on
%%pos = [left bottom width height] for the entire control area

Hgap = 0.003; Vgap = 0.003; Bwidth = (pos(3)-8*Hgap)/2; Bheight = (pos(4)/7 - 8*Vgap)/5; 
fheight = (pos(4)-8*Vgap)/7;
%big frame to cover the whole right field
uicontrol('Style', 'frame', 'Parent', hf, 'BackgroundColor', [0.8 0.8 0.8], 'Units', 'normalized', 'Position', pos);

%upper frame: spike/date selection/output
pp = [pos(1)+Hgap pos(2)+7*Vgap+6*fheight pos(3)-2*Hgap fheight]; uicontrol('Style', 'frame', 'Parent', hf, 'BackgroundColor', [0.8 0.8 0.8], 'Units', 'normalized', 'Position', pp);
%spike selection buttons
ppo = [pp(1)+Hgap  pp(2)+pp(4)-Vgap-Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', 'Update',...
    'Units', 'normalized', 'Tag', 'updatevalue', 'Position', ppo, 'Callback', 'DataManager_BehavUpdateDisplay_Callback');
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-Vgap-Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String',...
    'ShowCrit', 'Units', 'normalized', 'Tag', 'showcrit', 'Position', ppo, 'Callback', 'DataManager_BehavDateSelect_Callback');
ppo = [pp(1)+Hgap  pp(2)+pp(4)-2*Vgap-2*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String',...
    'SaveGroup', 'Units', 'normalized', 'Tag', 'savegroup', 'Position', ppo, 'Callback', 'DataManager_BehavDateSelect_Callback');
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-2*Vgap-2*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'DeleteGroup', 'Units', 'normalized', 'Tag', 'deletegroup', 'Position', ppo, 'Callback', 'DataManager_BehavDateSelect_Callback');
ppo = [pp(1)+Hgap  pp(2)+pp(4)-3*Vgap-3*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', 'AutoSelect', 'Units', 'normalized',...
    'Tag', 'autoselect', 'Position', ppo, 'Callback', 'DataManager_BehavDateSelect_Callback');
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-3*Vgap-3*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String',...
    'ManuSelect', 'Units', 'normalized', 'Tag', 'manuselect', 'Position', ppo, 'Callback', 'DataManager_BehavDateSelect_Callback');
ppo = [pp(1)+Hgap  pp(2)+pp(4)-4*Vgap-4*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', 'SelectAll', 'Units', 'normalized',...
    'Tag', 'spikeselectall', 'Position', ppo, 'Callback', 'DataManager_BehavDateSelect_Callback');
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-4*Vgap-4*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', 'DeSelectAll', 'Units', 'normalized',...
    'Tag', 'spikeselectallnot', 'Position', ppo, 'Callback', 'DataManager_BehavDateSelect_Callback');
ppo = [pp(1)+Hgap  pp(2)+pp(4)-5*Vgap-5*Bheight Bwidth/2 Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', '++', 'Units', 'normalized',...
    'Tag', 'combinegroup', 'Position', ppo, 'Callback', 'DataManager_BehavDateSelect_Callback');
ppo = [pp(1)+Bwidth/2+2*Hgap  pp(2)+pp(4)-5*Vgap-5*Bheight Bwidth/2 Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', '--', 'Units', 'normalized',...
    'Tag', 'subtractgroup', 'Position', ppo, 'Callback', 'DataManager_BehavDateSelect_Callback');
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-5*Vgap-5*Bheight Bwidth/2 Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', 'nn', 'Units', 'normalized',...
    'Tag', 'subtractgroup', 'Position', ppo, 'Callback', 'DataManager_BehavDateSelect_Callback');
ppo = [pp(1)+Bwidth*3/2+4*Hgap  pp(2)+pp(4)-5*Vgap-5*Bheight Bwidth/2 Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', '/n', 'Units', 'normalized',...
    'Tag', 'subtractgroup', 'Position', ppo, 'Callback', 'DataManager_BehavDateSelect_Callback');

%%second frmae: plot data
pp = [pos(1)+Hgap pos(2)+5*Vgap+5*fheight pos(3)-2*Hgap fheight];
uicontrol('Style', 'frame', 'Parent', hf, 'BackgroundColor', [0.8 0.8 0.8], 'Units', 'normalized', 'Position', pp);
%%%%%generate plots
ppo = [pp(1)+Hgap  pp(2)+pp(4)-Vgap-Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', 'Hist',...
    'Units', 'normalized', 'Tag', 'hist', 'Position', ppo, 'Callback', 'DataManager_Behavplot_Callback');
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-Vgap-Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', 'Polar', 'Units', 'normalized',...
    'Tag', 'polar', 'Position', ppo, 'Callback', 'DataManager_Behavplot_Callback');
ppo = [pp(1)+Hgap  pp(2)+pp(4)-2*Vgap-2*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', 'Cumu', 'Units', 'normalized',...
    'Tag', 'cumu', 'Position', ppo, 'Callback', 'DataManager_Behavplot_Callback');
ppo = [pp(1)+Hgap  pp(2)+pp(4)-3*Vgap-3*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', 'Scatter', 'Units', 'normalized',...
    'Tag', 'scatter', 'Position', ppo, 'Callback', 'DataManager_Behavplot_Callback');

%%%%plot parameters
plotparm.bin = 1; plotparm.range = [0 10]; 
ppo = [pp(1)+Hgap  pp(2)+pp(4)-5*Vgap-5*Bheight Bwidth/2 Bheight-Vgap]; uicontrol('Style', 'text', 'Parent', hf,...
    'ForegroundColor', [0 0 1], 'BackgroundColor', [0.8 0.8 0.8], 'String', 'Range',...
    'Units', 'normalized', 'Tag', 'rangestatic', 'Position',ppo, 'Callback', 'DataManager_Behavplot_Callback');
ppo = [pp(1)+Hgap+Bwidth/2  pp(2)+pp(4)-5*Vgap-5*Bheight Bwidth/2+6*Hgap Bheight-Vgap]; uicontrol('Style', 'edit', 'Parent', hf,...
    'ForegroundColor', [1 0 0], 'String', num2str(plotparm.range),...
    'Units', 'normalized', 'Tag', 'setrange', 'Position', ppo, 'Callback', 'DataManager_Behavplot_Callback');
ppo = [pp(1)+3*Hgap+Bwidth+2*Hgap  pp(2)+pp(4)-5*Vgap-5*Bheight Bwidth/2-2*Hgap Bheight-Vgap]; uicontrol('Style', 'text', 'Parent', hf,...
    'ForegroundColor', [0 0 1], 'BackgroundColor', [0.8 0.8 0.8], 'String', 'Bin',...
    'Units', 'normalized', 'Tag', 'binstatic', 'Position',ppo, 'Callback', 'DataManager_Behavplot_Callback');
ppo = [pp(1)+3*Hgap+Bwidth+Bwidth/2  pp(2)+pp(4)-5*Vgap-5*Bheight Bwidth/2 Bheight-Vgap]; uicontrol('Style', 'edit', 'Parent', hf,...
    'ForegroundColor', [1 0 0], 'String', num2str(plotparm.bin),...
    'Units', 'normalized', 'Tag', 'setbin', 'Position', ppo, 'Callback', 'DataManager_Behavplot_Callback');

%%3rd frmae: statistics
pp = [pos(1)+Hgap pos(2)+3*Vgap+3.42*fheight pos(3)-2*Hgap 1.6*fheight];
uicontrol('Style', 'frame', 'Parent', hf, 'BackgroundColor', [0.8 0.8 0.8], 'Units', 'normalized', 'Position', pp);
ppo = [pp(1)+Hgap  pp(2)+pp(4)-Vgap-Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', 'Ttest',...
    'Units', 'normalized', 'Tag', 'ttest', 'Position', ppo, 'Callback', 'DataManager_Behavstattest_Callback');
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-Vgap-Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', 'ranksum',...
    'Units', 'normalized', 'Tag', 'ranksum', 'Position', ppo, 'Callback', 'DataManager_Behavstattest_Callback');
ppo = [pp(1)+Hgap  pp(2)+pp(4)-2*Vgap-2*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', 'pairedT',...
    'Units', 'normalized', 'Tag', 'pairedt', 'Position', ppo, 'Callback', 'DataManager_Behavstattest_Callback');
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-2*Vgap-2*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'signtest', 'Units', 'normalized', 'Tag', 'signtest', 'Position', ppo, 'Callback', 'DataManager_Behavstattest_Callback');
ppo = [pp(1)+Hgap  pp(2)+pp(4)-3*Vgap-3*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', 'ANOVA1',...
    'Units', 'normalized', 'Tag', 'anova1', 'Position', ppo, 'Callback', 'DataManager_Behavstattest_Callback');
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-3*Vgap-3*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'KWtest', 'Units', 'normalized', 'Tag', 'kwtest', 'Position', ppo, 'Callback', 'DataManager_Behavstattest_Callback');
ppo = [pp(1)+Hgap  pp(2)+pp(4)-4*Vgap-4*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', 'ANOVA2',...
    'Units', 'normalized', 'Tag', 'anova2', 'Position', ppo, 'Callback', 'DataManager_Behavstattest_Callback');
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-4*Vgap-4*Bheight Bwidth Bheight]; %uicontrol('Style', 'pushbutton', 'Parent', hf,...
    %'String', 'KStest', 'Units', 'normalized', 'Tag', 'kstest', 'Position', ppo, 'Callback', 'DataManager_Behavstattest_Callback');
ppo = [pp(1)+Hgap  pp(2)+pp(4)-5*Vgap-5*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', 'KStest',...
    'Units', 'normalized', 'Tag', 'kstest', 'Position', ppo, 'Callback', 'DataManager_Behavstattest_Callback');
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-5*Vgap-5*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf, 'String', 'WWtest',...
    'Units', 'normalized', 'Tag', 'wwtest', 'Position', ppo, 'Callback', 'DataManager_Behavstattest_Callback');
%%%%still need to add: ftest, binomial, angletest
%%%no fridman test because it tests column effect after removing the row effect (incase not enough samples from one uniform condition);
%%%no Ztest because it requires a known std and ttest is good enough for the test with an unknown std
%%%no chi-square because it is a variance test, which is rarely used here (tests if samples are from a normal distibution with a known variance
%%%no binomial test (given p and N, compute the probability of M): individual case, hard to implement with the data structure.


%%lowerest (4th) frmae: manipulate or work on the databasae
pp = [pos(1)+Hgap pos(2)+3*Vgap+2.4*fheight pos(3)-2*Hgap 0.98*fheight];
uicontrol('Style', 'frame', 'Parent', hf, 'BackgroundColor', [0.8 0.8 0.8], 'Units', 'normalized', 'Position', pp);
%%%%%change parms, remove spike/field buttons
ppo = [pp(1)+Hgap  pp(2)+pp(4)-Vgap-Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'RemveSess', 'Units', 'normalized', 'Tag', 'removecells', 'Position', ppo, ...
    'Callback', 'DataManager_BehavReCompute_Callback');
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-Vgap-Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'RemveVars', 'Units', 'normalized', 'Tag', 'removevars', 'Position', ppo, ...
    'Callback', 'DataManager_BehavReCompute_Callback');
ppo = [pp(1)+Hgap  pp(2)+pp(4)-2*Vgap-2*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'SquzVals', 'Units', 'normalized', 'Tag', 'squeezevals', 'Position', ppo, ...
    'Callback', 'DataManager_BehavReCompute_Callback');
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-2*Vgap-2*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'CopyVars', 'Units', 'normalized', 'Tag', 'copyvars', 'Position', ppo, ...
    'Callback', 'DataManager_BehavReCompute_Callback');
ppo = [pp(1)+Hgap  pp(2)+pp(4)-3*Vgap-3*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'CrossSquz', 'Units', 'normalized', 'Tag', 'crosssqueezevals', 'Position', ppo, ...
    'Callback', 'DataManager_BehavReCompute_Callback');
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-3*Vgap-3*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'RenamVars', 'Units', 'normalized', 'Tag', 'renamevars', 'Position', ppo, ...
    'Callback', 'DataManager_BehavReCompute_Callback');
% ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-3*Vgap-3*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
%     'String', 'SquzEvts', 'Units', 'normalized', 'Tag', 'squeezeevts', 'Position', ppo, ...
%     'Callback', 'DataManager_BehavReCompute_Callback');

% %%lowerest (5th) frmae: add or re-compute specific variables (fields)
pp = [pos(1)+Hgap pos(2)+Vgap pos(3)-2*Hgap 2.4*fheight];
uicontrol('Style', 'frame', 'Parent', hf, 'BackgroundColor', [0.8 0.8 0.8], 'Units', 'normalized', 'Position', pp);
ppo = [pp(1)+Hgap  pp(2)+pp(4)-Vgap-Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'ChangeParm', 'Units', 'normalized', 'Tag', 'changeparm', 'Position', ppo, ...
    'Callback', 'DataManager_BehavReCompute_Callback');
ppo = [pp(1)++Bwidth+3*Hgap  pp(2)+pp(4)-Vgap-Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'TrajDistance', 'Units', 'normalized', 'Tag', 'trajdistance', 'Position', ppo, ...
    'Callback', 'DataManager_BehavAddTrajDistance_Callback');
ppo = [pp(1)+Hgap  pp(2)+pp(4)-2*Vgap-2*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'ReCmptInit', 'Units', 'normalized', 'Tag', 'recomputeinit', 'Position', ppo, ...
    'Callback', 'DataManager_BehavReCompute_Callback');
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-2*Vgap-2*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'ReCmptAll', 'Units', 'normalized', 'Tag', 'recomputeall', 'Position', ppo, ...
    'Callback', 'DataManager_BehavReCompute_Callback');

% ppo = [pp(1)+Hgap  pp(2)+pp(4)-Vgap-Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
%     'String', 'Firing', 'Units', 'normalized', 'Tag', 'firing', 'Position', ppo, ...
%     'Callback', 'DataManager_ReCompute_Callback');
% ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-Vgap-Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
%     'String', 'Waveform', 'Units', 'normalized', 'Tag', 'waveform', 'Position', ppo, ...
%     'Callback', 'DataManager_ReCompute_Callback');
% ppo = [pp(1)+Hgap  pp(2)+pp(4)-2*Vgap-2*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
%     'String', 'CelLType', 'Units', 'normalized', 'Tag', 'celltype', 'Position', ppo, ...
%     'Callback', 'DataManager_ReCompute_Callback');
% ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-2*Vgap-2*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
%     'String', 'ClusterQua', 'Units', 'normalized', 'Tag', 'clusterqua', 'Position', ppo, ...
%     'Callback', 'DataManager_ReCompute_Callback');
% ppo = [pp(1)+Hgap  pp(2)+pp(4)-3*Vgap-3*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
%     'String', 'PFProp', 'Units', 'normalized', 'Tag', 'pfprop', 'Position', ppo, ...
%     'Callback', 'DataManager_ReCompute_Callback');
% ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-3*Vgap-3*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
%     'String', 'PFDynam', 'Units', 'normalized', 'Tag', 'pfdynam', 'Position', ppo, ...
%     'Callback', 'DataManager_ReCompute_Callback');
% %ppo = [pp(1)+Hgap  pp(2)+pp(4)-4*Vgap-4*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
% %    'String', 'PFStablty', 'Units', 'normalized', 'Tag', 'pfstability', 'Position', ppo, ...
% %    'Callback', 'DataManager_ReCompute_Callback');
% %ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-4*Vgap-4*Bheight Bwidth Bheight]; uicontrol('Style', 'pushbutton', 'Parent', hf,...
% %    'String', 'PFDynam', 'Units', 'normalized', 'Tag', 'pfdynamics', 'Position', ppo, ...
% %    'Callback', 'DataManager_ReCompute_Callback');

%%%%additonal plots to show hidden bhdata 
ppo = [pp(1)+Hgap  pp(2)+pp(4)-3.35*Vgap-3.35*Bheight Bwidth Bheight]; ppt= uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'showData', 'Units', 'normalized', 'Tag', 'showposdata', 'Position', ppo, ...
    'Callback', 'DataManager_BehavShowBhdata_Callback'); set(ppt, 'ForeGroundColor', [0.2 0.2 0.2]);
ppo = [pp(1)+Hgap  pp(2)+pp(4)-5.35*Vgap-5.35*Bheight Bwidth Bheight]; ppt= uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'evLinearX', 'Units', 'normalized', 'Tag', 'evlinearx', 'Position', ppo, ...
    'Callback', 'DataManager_BehavShowBhdata_Callback'); set(ppt, 'ForeGroundColor', [0.2 0.2 0.2]);
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-5.35*Vgap-5.35*Bheight Bwidth Bheight]; ppt= uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'evLinearY', 'Units', 'normalized', 'Tag', 'evlineary', 'Position', ppo, ...
    'Callback', 'DataManager_BehavShowBhdata_Callback'); set(ppt, 'ForeGroundColor', [0.2 0.2 0.2]);
ppo = [pp(1)+Hgap  pp(2)+pp(4)-6.35*Vgap-6.35*Bheight Bwidth Bheight]; ppt= uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'evVel', 'Units', 'normalized', 'Tag', 'evvel', 'Position', ppo, ...
    'Callback', 'DataManager_BehavShowBhdata_Callback'); set(ppt, 'ForeGroundColor', [0.2 0.2 0.2]);
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-6.35*Vgap-6.35*Bheight Bwidth Bheight]; ppt= uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'evHeaddir', 'Units', 'normalized', 'Tag', 'evheaddir', 'Position', ppo, ...
    'Callback', 'DataManager_BehavShowBhdata_Callback'); set(ppt, 'ForeGroundColor', [0.2 0.2 0.2]);
ppo = [pp(1)+Hgap  pp(2)+pp(4)-7.35*Vgap-7.35*Bheight Bwidth Bheight]; ppt= uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'sessTraj', 'Units', 'normalized', 'Tag', 'sesstraj', 'Position', ppo, ...
    'Callback', 'DataManager_BehavShowBhdata_Callback'); set(ppt, 'ForeGroundColor', [0.2 0.2 0.2]);
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-7.35*Vgap-7.35*Bheight Bwidth Bheight]; ppt= uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'evTraj', 'Units', 'normalized', 'Tag', 'evtraj', 'Position', ppo, ...
    'Callback', 'DataManager_BehavShowBhdata_Callback'); set(ppt, 'ForeGroundColor', [0.2 0.2 0.2]);
ppo = [pp(1)+Hgap  pp(2)+pp(4)-8.35*Vgap-8.35*Bheight Bwidth Bheight]; ppt= uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'sessOccupcy', 'Units', 'normalized', 'Tag', 'sessoccup', 'Position', ppo, ...
    'Callback', 'DataManager_BehavShowBhdata_Callback'); set(ppt, 'ForeGroundColor', [0.2 0.2 0.2]);
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-8.35*Vgap-8.35*Bheight Bwidth Bheight]; ppt= uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'evOccupcy', 'Units', 'normalized', 'Tag', 'evoccup', 'Position', ppo, ...
    'Callback', 'DataManager_BehavShowBhdata_Callback'); set(ppt, 'ForeGroundColor', [0.2 0.2 0.2]);


%%%status button to show the current options for plot/compute and data availability
if (isappdata(hf, 'plotparm'))
    plotparm = getappdata(hf, 'plotparm');
else
    plotparm.showdetail = 0; plotparm.compute = 0; plotparm.overwrite = 0;
    plotparm.linkspike = 0; plotparm.linkeeg = 0; plotparm.linkbehav = 1;
end
ppo = [pp(1)+Hgap  pp(2)+pp(4)-10.35*Vgap-10.35*Bheight Bwidth Bheight]; ppt= uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'NoSpikeDB', 'Units', 'normalized', 'Tag', 'linkspike', 'Position', ppo, ...
    'Callback', 'DataManager_plot_Callback'); 
     if (plotparm.linkspike == 1) 
         set(ppt, 'ForeGroundColor', [1 0 0], 'String', 'SpikeLinked');
     else
         set(ppt, 'ForeGroundColor', [0.2 0.2 0.2], 'String', 'NoSpikeDB');
     end
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-10.35*Vgap-10.35*Bheight Bwidth Bheight]; ppt= uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'NoEEGDB', 'Units', 'normalized', 'Tag', 'linkeeg', 'Position', ppo, ...
    'Callback', 'DataManager_plot_Callback'); 
     if (plotparm.linkeeg == 1) 
         set(ppt, 'ForeGroundColor', [1 0 0], 'String', 'EEGLinked');
     else
         set(ppt, 'ForeGroundColor', [0.2 0.2 0.2], 'String', 'NoEEGDB');
     end
ppo = [pp(1)+Hgap  pp(2)+pp(4)-11.35*Vgap-11.35*Bheight Bwidth Bheight]; ppt= uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'NoShow', 'Units', 'normalized', 'Tag', 'showdetail', 'Position', ppo, ...
    'Callback', 'DataManager_plot_Callback'); 
     if (plotparm.showdetail == 1) 
         set(ppt, 'ForeGroundColor', [1 0 0], 'String', 'ShowDetail');
     else
         set(ppt, 'ForeGroundColor', [0.2 0.2 0.2], 'String', 'NoShow');
     end
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-11.35*Vgap-11.35*Bheight Bwidth Bheight]; ppt= uicontrol('Style', 'text', 'Parent', hf,...
    'String', 'BehavLinked', 'Units', 'normalized', 'Tag', 'linkbehav', 'Position', ppo, ...
    'Callback', 'DataManager_plot_Callback'); 
     if (plotparm.linkbehav == 1) 
         set(ppt, 'ForeGroundColor', [1 0 0], 'String', 'BehavLinked');
     else
         set(ppt, 'ForeGroundColor', [0.2 0.2 0.2], 'String', 'NoBehavDB');
     end
ppo = [pp(1)+Hgap  pp(2)+pp(4)-12.35*Vgap-12.35*Bheight Bwidth Bheight]; ppt= uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'NewDatabs', 'Units', 'normalized', 'Tag', 'overwrite', 'Position', ppo, ...
    'Callback', 'DataManager_plot_Callback'); 
     if (plotparm.overwrite == 1) 
         set(ppt, 'ForeGroundColor', [1 0 0], 'String', 'Overwrite');
     else
         set(ppt, 'ForeGroundColor', [0.2 0.2 0.2], 'String', 'NewDB');
     end
ppo = [pp(1)+Bwidth+3*Hgap  pp(2)+pp(4)-12.35*Vgap-12.35*Bheight Bwidth Bheight]; ppt = uicontrol('Style', 'pushbutton', 'Parent', hf,...
    'String', 'AssignParm', 'Units', 'normalized', 'Tag', 'assignparm', 'Position', ppo, ...
    'Callback', 'DataManager_plot_Callback'); 
     if (plotparm.compute == 1) 
         set(ppt, 'ForeGroundColor', [1 0 0], 'String', 'Compute');
     else
         set(ppt, 'ForeGroundColor', [0.2 0.2 0.2], 'String', 'AssignParm');
     end
setappdata(hf, 'plotparm', plotparm);%default plot parameters
