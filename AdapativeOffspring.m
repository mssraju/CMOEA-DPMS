function Off = AdapativeOffspring(Population,TPop,wa,Global,B)
    Off     = [];    
    for i = 1 : Global.N
        % Choose the parents
            if rand<0.9
            	P = B(i,randperm(size(B,2)));
            else
                P = randperm(Global.N);
            end
            ran  =  rand;
                 if round(Global.gen/Global.maxgen)==1 || wa==1  
                   
                   if ran<0.5
                      Offspring   = GAhalf(Population(P(1:2)));
                   else
                      Offspring   = DE(Population(i),Population(P(1)),Population(P(2)),[1,0.5,1,20]);
                   end
                   Off            = [Off,Offspring];   
                 else               
                     if i == 1 || i == Global.N 
                         Offspring    = DE(TPop(i),TPop(P(1)),TPop(P(2)),[1,0.8,1,20]);
                         Off          = [Off,Offspring];
                     else
                         if ran<0.5
                            Offspring = GAhalf(TPop(P(1:2)));
                         else   
                          Offspring   = DE(TPop(i),TPop(P(1)),TPop(P(2)),[1,0.5,1,20]);
                         end 
                         Off          = [Off,Offspring];
                     end   
                 end
    end  
end