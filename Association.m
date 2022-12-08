function [Population,z,sr] = Association(R,W,z,wb,Global)
    if wb==1
           [F,M] = CNDSort(R.objs,R.cons,Global.N);
           R     = R(F<=M);
    end 
    [PopObj,z] = Normalization2(R.objs,z);
     normP  = sqrt(sum(PopObj.^2,2));
     Cosine = 1 - pdist2(PopObj,W,'cosine');
     d1     = repmat(normP,1,size(W,1)).*Cosine;
     d2     = repmat(normP,1,size(W,1)).*sqrt(1-Cosine.^2);
     sr=[];
    %% Clustering
    [~,class] = min(d2,[],2);
    asso.sol  =[];
    for i = 1 : length(W)
        asso(i).sol = find(class==i);   
        if isempty(asso(i).sol)==1
            [~,id]=min(d2(:,i));
            Population(i)=R(id);
            sr=[sr,id];
        else
            [F,M] = CNDSort(R([asso(i).sol]).objs,R([asso(i).sol]).cons,length(R([asso(i).sol])));
            if length(find(F==1))>1
                a=find(F==1);
                pbi=d1(a,i)+5*d2(a,i);
                [~,ind]=min(pbi);
                Population(i)=R(asso(i).sol(a(ind)));
                sr=[sr,[asso(i).sol(a(ind))]];
            else
               Population(i)=R([asso(i).sol(find(F==1))]);
               sr=[sr,[asso(i).sol(find(F==1))]];
            end    
        end   
    end
    
end