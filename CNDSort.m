function [F,M] = CNDSort(PopObj,PopCon,n)
    N = size(PopObj,1);
    M = 1;
    F(1:N)=inf;
    CV = sum(max(0,PopCon),2);  
    %% Detect the dominance relation between each two solutions
    Dominate = false(N);
    for i = 1 : N-1
        for j = i+1 : N
            if CV(i) < CV(j)
                Dominate(i,j) = true;
            elseif CV(i) > CV(j)
                Dominate(j,i) = true;
            else
                k = any(PopObj(i,:)<PopObj(j,:)) - any(PopObj(i,:)>PopObj(j,:));
                if k == 1
                    Dominate(i,j) = true;
                elseif k == -1
                    Dominate(j,i) = true;
                end
            end
        end
    end
%%   
    while sum(F<=M)< n
        a = sum(Dominate(:,:));
        b = find(a==0);
        F(b)= M;
        Dominate(:,b)=1;
        Dominate(b,:)=0;
        M = M+1;
    end    
        
end    