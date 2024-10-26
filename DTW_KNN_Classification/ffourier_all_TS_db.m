function [descriptor_db]=ffourier_all_TS_db(all_ts_db)
% función que aplica la transformada de Fourier a todas las series de la base de datos. 
%obteniendo el valor de los descriptores de cada imagen
[fil col]=size(all_ts_db);
descriptor_db=zeros(fil,2);

for i=1:fil
     long_ts=all_ts_db(i,2);
     serie_entrada=all_ts_db(i,3:long_ts);
     F=fft(serie_entrada);
     F2=real(fftshift(F));
     descriptor=max(max(F2));
     descriptor_db(i,:)=  [all_ts_db(i,1),descriptor];
end
end