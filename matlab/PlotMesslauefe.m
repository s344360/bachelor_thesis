Array1500 = dlmread('/Users/ramadanshweiki/Desktop/BachlorArbeit/BachlorarbeitShweiki/matlab/JavaOut.csv');
Array50 = dlmread('/Users/ramadanshweiki/Desktop/BachlorArbeit/BachlorarbeitShweiki/messungen/tcpdump/best/shortdistance/25Oktmess50b400T2minpause/JavaOut50.csv');
Array5000 = dlmread('/Users/ramadanshweiki/Desktop/BachlorArbeit/BachlorarbeitShweiki/messungen/tcpdump/best/shortdistance/mess5000b70T/JavaOut5000b.csv');

col2 = 1:1:100;

%Plot 1500
%
vektrombit1500 = zeros(1,100);
for i=1:100
    sum = 0;
    for j=1:60
    sum = sum + Array1500(j, i);
    %Array(i, 1)
    end
    vektrombit1500(i)=sum;

end   
vektrombit21500 = zeros(1,100);
for i=1:100
    vektrombit21500(i) = ((((vektrombit1500(i)*1500)/60)/1000)/1000) ;
    vektrombit21500(i) 
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%vektro mbit2
%plot50b
x= ((((vektrombit1500(1)*1500)/60)/1000)/1000);
x = x/2
vektrombit50 = zeros(1,100);
for i=1:100
    sum = 0;
    for j=1:60
    sum = sum + Array50(j, i);
    %Array50(i, 1)
    end
    vektrombit50(i)=sum;

end   
vektrombit250 = zeros(1,100);
for i=1:100
    vektrombit250(i) = ((((vektrombit50(i)*50)/60)/1000)/1000) ;
    
end
%%%%%%%%%%%%%%%%%%%%%%%%
%vektro mbit2
%plot50b
vektrombit5000 = zeros(1,100);
for i=1:100
    sum = 0;
    for j=1:60
    sum = sum + Array5000(j, i);
    %Array50(i, 1)
    end
    vektrombit5000(i)=sum;

end   
vektrombit25000 = zeros(1,100);
for i=1:100
    vektrombit25000(i) = ((((vektrombit5000(i)*5000)/60)/1000)/1000) ;
    
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%ybar = mean(Array1500)
%s = std(vektrombit21500)
%err = s*ones(size(vektrombit21500));
%err = std(vektrombit21500)/sqrt(length(vektrombit21500));

% err= zeros(size(vektrombit21500));
% for i=1:100
%    err(i)= Array1500()
% end

%b = transpose(Array1500(:,1));

%[m1,c1]=nanmeanconfint(vektrombit21500);
hold on;

bar(col2,vektrombit21500)
ylim([2.5,3.5]);
%errorbar(col2,vektrombit21500,'r');

%  for i=1:100
   %b = transpose(vektrombit21500(:,i));
 % [mi,ci]=nanmeanconfint(1.4877);
  % errorbar(i,mi,ci,'r');
  %end


%vektrombit21500
%bar(col2,vektrombit250)
%ylim([0.0,0.5]);

%vektrombit25000
%bar(col2,vektrombit25000)
%ylim([0.0,10]);

hold off;


%sum
% for i=2:2
%     col1 = Array(:, i);
%     plot(col2, col1)
% end

