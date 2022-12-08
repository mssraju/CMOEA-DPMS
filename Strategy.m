function [wa,wb,znad2,znad3,TPop]=Strategy(Global,TPop,arch,znad2,znad3,wa,wb)
        znad2(Global.gen,:)  =  max(TPop.objs,[],1);
        if Global.gen>50 && wa==0
            if pdist2(znad2(Global.gen,:),znad2(Global.gen-50,:),'euclidean')<=1e-3
                wa=1;
            end    
        end    
        if wa==1 && wb==0
            if isempty(arch)
               znad3(Global.gen,:)=zeros(1,Global.M);  
            else    
               znad3(Global.gen,:)  = max(arch.objs,[],1);
            end
             if pdist2(znad3(Global.gen,:),znad3(Global.gen-50,:),'euclidean')<=1e-3
                wb=1;
             end
        end  
end