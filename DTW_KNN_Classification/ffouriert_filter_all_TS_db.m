function [new_filtered_db]=ffouriert_filter_all_TS_db(all_ts_db,sigma)
% función que filtra todas las series de la base de datos. Se utiliza el
% filto de transformada de Fourier
[fil col]=size(all_ts_db);
new_filtered_db=zeros(fil,col);

for i=1:fil
     long_ts=all_ts_db(i,2);
     serie_entrada=all_ts_db(i,3:long_ts);
     [filtered_serie_entrada]=DTW_1TS_fft_filter(serie_entrada,sigma);
     new_filtered_db(i,1:long_ts)=  [all_ts_db(i,1:2),filtered_serie_entrada];
end
end