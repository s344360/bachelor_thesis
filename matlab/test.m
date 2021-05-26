% run150b = csvread('/home/shweiki/Dokumente/Bachelorarbeit/plot/mess1500b120T2min.csv');
% cellfun(@(V) V+0, regexp(s, '.$', 'match', 'dotexceptnewline', 'lineanchors'));
% %fclose(run150b)
% 
% column1 = run150b(:,1);
% column2 = run150b(:,2);
% column3 = run150b(:,3);
% %column4 = run150b(:,4);
% %column5 = run150b(:,5);
% 
% % figure(1)
% % tut_axis_a = axes;
% %x2 = [1,2,3,4,5,6,7,8,9,10];
% ecdf(column2);

run1500b = csvread('/Users/ramadanshweiki/Desktop/BachlorArbeit/BachlorarbeitShweiki/messungen/tcpdump/best/shortdistance/mess1500b12T2MiPause/mess1500b120T2minNew.csv');
run50b = csvread('/Users/ramadanshweiki/Desktop/BachlorArbeit/BachlorarbeitShweiki/messungen/tcpdump/best/shortdistance/25Oktmess50b400T2minpause/50b.csv');
run501500b = csvread('/Users/ramadanshweiki/Desktop/BachlorArbeit/BachlorarbeitShweiki/messungen/tcpdump/best/shortdistance/1500-50b120T2minP/mess50-1500New.csv');
run5000b = csvread('/Users/ramadanshweiki/Desktop/BachlorArbeit/BachlorarbeitShweiki/messungen/tcpdump/best/shortdistance/mess5000b70T/mess5000.csv');

%a500b
column15001 = run1500b(:,1);
column15002 = run1500b(:,2);
column15003 = run1500b(:,3);

%50b
column501 = run50b(:,1);
colum502 = run50b(:,2);
column503 = run50b(:,3);

%random
column5015001 = run501500b(:,1);
colum5015002 = run501500b(:,2);
column5015003 = run501500b(:,3);

%1500b
column50001 = run5000b(:,1);
column50002 = run5000b(:,2);
column50003 = run5000b(:,3);




vektor1500 =  zeros(1,100); 
for i=1:100
    vektor1500(i) = ((column15003(i))/column15001(i))*100;
    
end   

vektor50 =  zeros(1,100); 
for i=1:100
    vektor50(i) = ((column503(i))/column501(i))*100;
    
end   

vektor501500 =  zeros(1,100); 
for i=1:100
    vektor501500(i) = ((column5015003(i))/column5015001(i))*100;
    
end


vektor5000 =  zeros(1,100); 
for i=1:100
    vektor5000(i) = ((column50003(i))/column50001(i))*100;
    
end


hold all;
test1 = num2str(vektor1500);
ecdf(vektor1500)
 ecdf(vektor50)
 ecdf(vektor501500)
 ecdf(vektor5000)

hold off;

legend("1500b","50b","random",'5000b');
%legend("random",'5000b');

% Create textarrow
annotation('textarrow',[0.28515625 0.25625],...
    [0.734647530040053 0.803738317757009],'String',{'random'});


