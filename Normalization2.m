function [PopObj,z] = Normalization2(PopObj,z)
% Normalize the population and update the ideal point and the nadir point

%------------------------------- Copyright --------------------------------
% Copyright (c) 2018-2019 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------
    [N,~] = size(PopObj);
    %% Update the ideal point
    z = min(z,min(PopObj,[],1));   
    %% Normalize the population
    PopObj = (PopObj-repmat(z,N,1));
end