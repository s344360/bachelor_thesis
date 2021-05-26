Array = dlmread('/Users/ramadanshweiki/Desktop/BachlorArbeit/BachlorarbeitShweiki/matlab/JavaOut.csv');
%col1 = Array(:, 10);
col2 = 1:1:60;
%ecdf(col2)
hold on 

for i=2:2
    col1 = Array(:, i);
    plot(col2, col1)
end

% ybar = mean(Array)
% s = std(Array)
% err = 8*ones(size(ybar));
% errorbar(col2,Array,err);
