clc; clear all; close all;
run1500s = csvread('/Users/ramadanshweiki/Desktop/BachlorArbeit/BachlorarbeitShweiki/matlab/Unbenannter Ordner/mess1500b120T2minNew.csv');
run1500l = csvread('/Users/ramadanshweiki/Desktop/BachlorArbeit/BachlorarbeitShweiki/matlab/Unbenannter Ordner/messlongabstandMax1500bSNew.csv');
run1500h = csvread('/Users/ramadanshweiki/Desktop/BachlorArbeit/BachlorarbeitShweiki/matlab/Unbenannter Ordner/messlongabstandMaxHinder1500bS.csv');

run50s = csvread('/Users/ramadanshweiki/Desktop/BachlorArbeit/BachlorarbeitShweiki/matlab/Unbenannter Ordner/50b.csv');
run50l = csvread('/Users/ramadanshweiki/Desktop/BachlorArbeit/BachlorarbeitShweiki/matlab/Unbenannter Ordner/messlongabstandMax50bSNew.csv');
run50h = csvread('/Users/ramadanshweiki/Desktop/BachlorArbeit/BachlorarbeitShweiki/matlab/Unbenannter Ordner/messlongabstandMaxHinder50bS.csv');

%1500s
column15001s = run1500s(:,1);
column15002s = run1500s(:,2);
column15003s = run1500s(:,3);
%1500l
column15001l = run1500l(:,1);
column15002l = run1500l(:,2);
column15003l = run1500l(:,3);
%1500h
column15001h = run1500h(:,1);
column15002h = run1500h(:,2);
column15003h = run1500h(:,3);
 
%50bs
column501s = run50s(:,1);
colum502s = run50s(:,2);
column503s = run50s(:,3);
%50bl
column501l = run50l(:,1);
colum502l = run50l(:,2);
column503l = run50l(:,3);
 %50bh
column501h = run50h(:,1);
colum502h = run50h(:,2);
column503h = run50h(:,3);
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5%%
 %1500
vektor1500s =  zeros(1,100); 
for i=1:100
    vektor1500s(i) = ((column15003s(i))/column15001s(i))*100;
     
end   
vektor1500l =  zeros(1,100); 
for i=1:100
    vektor1500l(i) = ((column15003l(i))/column15001l(i))*100;
     
end   
vektor1500h =  zeros(1,100); 
for i=1:100
    vektor1500h(i) = ((column15003h(i))/column15001h(i))*100;
     
end   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%50b
vektor50s =  zeros(1,100); 
for i=1:100
    vektor50s(i) = ((column503s(i))/column501s(i))*100;
     
end   
 vektor50l =  zeros(1,100); 
for i=1:100
    vektor50l(i) = ((column503l(i))/column501l(i))*100;
     
end
vektor50h =  zeros(1,100);
for i=1:100
    vektor50h(i) = ((column503h(i))/column501h(i))*100;
     
end  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


results(1,:)=vektor1500s.';
results(2,:)=vektor50l.';
%results(3,:)=vektor501500.';
%results(4,:)=vektor5000.';


hold all;

%ylim([0.0,1])
xlim([0.0,5])

 cm=copper(6);
 colormap(cm);  

 [fs,xs]=ecdf(vektor1500s)
 plot(xs,fs,'color',cm(1,:))
 
 [fl,xl]=ecdf(vektor1500l)
 plot(xl,fl,'color',cm(2,:))
 
 [fh,xh]=ecdf(vektor1500h)
 plot(xh,fh,'color',cm(3,:))
%   

% %vektor50
 [f1s,x1s]=ecdf(vektor50s)
 plot(x1s,f1s,'color',cm(4,:))  
%  
  [f1l,x1l]=ecdf(vektor50l)
 plot(x1l,f1l,'color',cm(5,:)) 
%  
  [f1h,x1h]=ecdf(vektor50h)
 plot(x1h,f1h,'color',cm(6,:)) 

 %ylim([0.0,1.5]);
 xlabel('Paketverlust [%]')
 ylabel('ECDF')


 [means, confis] = nanmeanconfint(results, 0.95, 1);
  box on;
  legend('1500B',"1500B","1500B","50B","50B",'50B');
  
  % Create textarrow
annotation('textarrow',[0.2203125 0.1625],...
    [0.653930131004367 0.775109170305677],'String',{'Kleiner Abstand (1500B)'});


% % Create textarrow
annotation('textarrow',[0.58671875 0.56796875],...
    [0.539301310043668 0.581877729257642],'String',{'Größer Abstand(1500B)'});
 
% 
% %% Create textarrow
annotation('textarrow',[0.446875 0.41328125],...
    [0.87882096069869 0.90174672489083],'String',{'Hinderniss(1500B)'});

% % Create textarrow
annotation('textarrow',[0.22578125 0.17265625],...
    [0.706331877729258 0.806768558951965],'String',{'Kleiner Abstand(50B)'});
% 
% Create textarrow
annotation('textarrow',[0.26171875 0.21484375],...
    [0.78056768558952 0.885371179039301],'String',{'Größer Abstand(50B)'});

% 
% % Create textarrow
annotation('textarrow',[0.3125 0.275000000000001],...
    [0.842794759825327 0.898471615720522],'String',{'Hindeniss(50B)'});


save2pdf('/Users/ramadanshweiki/Desktop/BachlorArbeit/BachlorarbeitShweiki/matlab/plotSLH',1, 600, 12, 2);

 hold off;


