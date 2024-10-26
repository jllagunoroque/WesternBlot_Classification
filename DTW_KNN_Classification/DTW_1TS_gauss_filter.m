function [filtered_serie_entrada]=DTW_1TS_gauss_filter(serie_entrada,sigma)
%función que filtra  una serie de tiempo con el filtro Gaussiano
   long=length(serie_entrada);
 % filtro=fspecial('gaussian',[3,3],sigma);
 % filtered_serie_entrada=imfilter(serie_entrada(1:long-1),filtro);
 filtro=gaussFilter(sigma,5);
%filtered_serie_entrada=conv(serie_entrada,filtro,'same');
filtered=conv(serie_entrada,filtro,'same');
uno=filtered(3);
last=filtered(long-2);
filtered_serie_entrada=filtered;
filtered_serie_entrada(1)=uno;
filtered_serie_entrada(long)=last;

end