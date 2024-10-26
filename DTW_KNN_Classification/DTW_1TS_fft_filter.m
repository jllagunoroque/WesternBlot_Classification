function [filtered_serie_entrada]=DTW_1TS_fft_filter(serie_entrada,sigma)
% Función que aplica la Transformada de Fourier para aplicar el filtro
% Gaussiano a una serie de tiempó

% Aplicar filtro a serie_entrada

[X,Y] = meshgrid(serie_entrada);
[col fil]=size(X);
F=fft(serie_entrada);
F2=fftshift(F);
H1 = lpfilter ('gauss',col,fil, sigma);
H=mean(H1);
F3=F2.*H(1,:);
F4=ifftshift(F3);
f5=abs(ifft(F4));
filtered_serie_entrada=f5;
%inicio=filtered_serie_entrada(4);
%fin=filtered_serie_entrada(end-3);
%filtered_serie_entrada(1:3)=inicio;
%filtered_serie_entrada(end-2:end)=fin;
%long=length(serie_entrada);
%uno=filtered_serie_entrada(3);
%last=filtered_serie_entrada(long-2);
%filtered_serie_entrada(1)=uno;
%filtered_serie_entrada(long)=last;


end
