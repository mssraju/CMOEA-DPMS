function CMOEA_DPMS(Global)
% <algorithm> <A>
% A Dual Population based Multi-staged CMOEA

%------------------------------- Reference --------------------------------
%Sri Srinivasa Raju M
%------------------------------- Copyright --------------------------------
% Copyright (c) 2018-2019 BIMK Group. You are free to use the PlatEMO for
% research purposes. All publications which use this platform or any code
% in the platform should acknowledge the use of "PlatEMO" and reference "Ye
% Tian, Ran Cheng, Xingyi Zhang, and Yaochu Jin, PlatEMO: A MATLAB platform
% for evolutionary multi-objective optimization [educational forum], IEEE
% Computational Intelligence Magazine, 2017, 12(4): 73-87".
%--------------------------------------------------------------------------
%% Generate the reference points and random population
   [W,Global,B,Population,Z,TPop,wa,wb,arch,Z1,znadh,znadm] = Initial(Global);
    %% Optimization
    while Global.NotTermination(Population)
        Off                     = AdapativeOffspring(Population,TPop,wa,Global,B);
        [TPop,Z]                = EnvironmentalSelection([TPop,Off],W,Global.N,Z);
        [Population,Z1]         = Association([TPop,Population,Off],W,Z1,wb,Global);       
        arch                    = archive2REA([arch,Population,TPop],Global.N);
        [wa,wb,znadh,znadm,TPop]= Strategy(Global,TPop,arch,znadh,znadm,wa,wb);
        if Global.evaluated >= Global.evaluation
            Population = arch;
        end
    end
    
end