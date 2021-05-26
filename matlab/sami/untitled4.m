close all;
clearvars;
t=6;
mal=8;
ca_cell=cell(t,1);
ca = ["2","2","2","2","2","2"];
test =[3,4,5,6,7,8,9,10];
test2= ["3","4","5","6","7","8","9","10"];
test17=cell(mal,1);
temp=cell(176,1);
packet_in=cell(mal,1);
zaehler=cell(176,1);
for x = 1:mal
  test17{x,1}=test2(x);
end
for x = 1:t
  ca_cell{x,1}=ca(x);
end
richtich = 144;
verschieben_zahler=0;
for ca_index = 1:size(ca_cell)
   %ca_index=1;
    for n = 1:mal
        n;
        verschieben_zahler=verschieben_zahler+1;
        nummer= richtich+n;
        plaz =sprintf('GP_m:0.55_c:%s_tout:%s_ZD:1200_n:%d.txt', ca_cell{ca_index,1},test17{n,1},nummer-1); 
        plaz
        fid= fopen(plaz);
        temp{verschieben_zahler,1}= textscan(fid,'%s %s %s %s %s %s %s %s %s');
        fclose(fid);
        
        zaehler{verschieben_zahler,1} = 0;
        for c = 1:size(temp{verschieben_zahler,1}{9})
            if ( temp{verschieben_zahler,1}{9}{c} == "OFPT_FLOW_MOD" )              
                zaehler{verschieben_zahler,1}= zaehler{verschieben_zahler,1}+1;
            end
        end
    end 
  richtich=richtich+mal;
end  
%  size(temp{1}{9});
  zeros_cell=cell(t,1);

  
  b3den=0;
  for x=1:t
      
      zeros_cell{x,1}= zeros(1,mal);
      for y=1:mal
         wa7ad=b3den+y;
          zeros_cell{x,1}(1,y)=(((zaehler{wa7ad,1}/2)-1)/1200);
      end 
  b3den=b3den+mal; 
   zeros_cell{x,1}
  end
 
  %%
 x =1;
for k = [1,2,3,4,5,6]
   results(x,:) = zeros_cell{k,1};
   x=x+1;
end



  
 hold on
 xlabel('E[A][s]');
 ylabel('Signaling Rate η [1/s]')
 %ylim([0 1]);
%   plot(test,mean(results))
%   plot(test,zeros_cell{1,1})
%   plot(test,zeros_cell{2,1})
%   plot(test,zeros_cell{3,1})
%   plot(test,zeros_cell{4,1})
%   plot(test,smooth(zeros_cell{1,1}))
%   plot(test,smooth(zeros_cell{2,1}))
%   plot(test,smooth(zeros_cell{3,1})) 
%   plot(test,smooth(zeros_cell{4,1})) 
%   plot(test,smooth(mean(results)));
  
  
  plot(test,mean(results))
  plot(test,zeros_cell{1,1})
  plot(test,zeros_cell{2,1})
  plot(test,zeros_cell{3,1})
  plot(test,zeros_cell{4,1})
  plot(test,zeros_cell{5,1})
  plot(test,zeros_cell{6,1})
  
  plot(test,smooth(zeros_cell{1,1}))
  plot(test,smooth(zeros_cell{2,1}))
  plot(test,smooth(zeros_cell{3,1})) 
  plot(test,smooth(zeros_cell{4,1})) 
  plot(test,smooth(zeros_cell{5,1}))
  plot(test,smooth(zeros_cell{6,1}))
  plot(test,smooth(mean(results)));
  
  
%   plot(test,mean(results2))
%   plot(test,zeros_cell3{1,1})
%   plot(test,zeros_cell3{2,1})
%   plot(test,zeros_cell3{3,1})
%   plot(test,zeros_cell3{4,1})
%   plot(test,smooth(zeros_cell3{1,1}))
%   plot(test,smooth(zeros_cell3{2,1}))
%   plot(test,smooth(zeros_cell3{3,1})) 
%   plot(test,smooth(zeros_cell3{4,1})) 
%   plot(test,smooth(mean(results3)));
%   
%   
%   
%   
%    plot(test,mean(results2))
%   plot(test,zeros_cell4{1,1})
%   plot(test,zeros_cell4{2,1})
%   plot(test,zeros_cell4{3,1})
%   plot(test,zeros_cell4{4,1})
%   plot(test,smooth(zeros_cell4{1,1}))
%   plot(test,smooth(zeros_cell4{2,1}))
%   plot(test,smooth(zeros_cell4{3,1})) 
%   plot(test,smooth(zeros_cell4{4,1})) 
%   plot(test,smooth(mean(results4)));
  
 grid on
 legend('mean','ca=1','ca=2','ca=3','ca=4','ca=5','ca=6','smooth_ca=1','smooth_ca=2','smooth_ca=3','smooth_ca=4','smooth_ca=5','smooth_ca=6','smooth_mean')
hold off