function [W,Global,B,Population,Z,TPop,wa,wb,arch,Z1,znad1,znad2] = Initial(Global)
    [W,Global.N]    = UniformPoint(Global.N,Global.M);
    T               = ceil(Global.N/10);

    %% Detect the neighbours of each solution
    B               = pdist2(W,W);
    [~,B]           = sort(B,2);
    B               = B(:,1:T);
    %% Generate random population
    Population      = Global.Initialization();
    Z               = min(Population.objs,[],1);
    TPop            = Population;
    %% Evaluate the Population
    wa              = 0;
    wb              = 0;
    arch            = archive(Population,Global.N);
    %%
    [Z,znad]        = deal(min(Population.objs),max(Population.objs));
    Z1              = Z;
    znad1           = znad;
    znad2           = zeros(1,Global.M);
end