function [M,C]=nanmeanconfint(A, confidence_interval, dim)
if nargin==1
    confidence_interval=0.95;                   % falls nicht angegeben: 95%-Intervall
    dim=ndims(A);                               % falls nicht anders angegeben: Intervall über die letzte Dimension
elseif nargin==2
    dim=ndims(A);
end

alpha = 1 - confidence_interval;                % 1-alpha = 0.95 = confidence_interval    =>  alpha = 1 - confidence_interval;    
                                                % Wir berechnen tinv-Wert mit 1-alpha/2 und benötigen daher "alpha"
runs=size(A,dim);                               % Stichprobengröße
M=nanmean(A,dim);                               % Stichprobenmittelwert berechnen für die Rückgabe
                                                % Konfidenzintervall:  [M - C; M + C]
if runs >1

    H=ones(1,ndims(A)); H(dim)=runs;            % Varianz über Nicht-Nan-Werte berechnen
    V=nansum((A-repmat(M,H)).^2,dim)/(runs-1);

    C=tinv(1-alpha/2,(runs-1)) * sqrt(V/runs);  % Wir benötigen das (1-alpha/2)-Quantil der t-Verteilung mit runs-1 Freiheitsgraden
                                                % [Law&Kelton2000] (alternativ: -tinv((1-confidence_interval)/2, n-1) = tinv(1-alpha/2, n-1)  )
else
    C = 0;
end


% Florian Wamser, 2015-12-06
