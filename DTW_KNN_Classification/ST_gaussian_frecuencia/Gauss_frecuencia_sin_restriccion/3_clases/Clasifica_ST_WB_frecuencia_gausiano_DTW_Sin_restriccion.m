function Clasifica_ST_WB_frecuencia_gausiano_DTW_Sin_restriccion(total_bd_ts,porcentaje_train,k,sigma)
%función que obtiene la clasificación de series de tiempo con suavizado Gausiano 
% en el dominio de la frecuecia mediante la transformada de Fourier utilizando
%KNN con distancia de similitud DTW sin restricciones.
%Cross fold validation con porcentaje en TRAIN y TEST
%La sensibilidad y especificidad no se calcula con 3 clases, debido a que el cálculo
%de la matriz de confusión se debe calcular sólo con 2 clases

   %load('D:\bcdata\bd_st\bd_st_standarizadas');
   series_tiempo=total_bd_ts;
   all_classified_rate=[];
   [new_filtered_db]=ffouriert_filter_all_TS_db(total_bd_ts,sigma);
     total_matriz_confusion=zeros(3,3);
   all_sensibilidad=[];
   all_especificidad=[];
   all_exactitud=[];
   all_precision=[];

   disp(['__________________________________________________________  ']);
   for i=1:10
       disp(['_______________________________________________________________  ']);
      disp(['Classification  ', num2str(i)]); 
    
     [TRAIN,TEST]=Get_Train_Test_Data_WB_general(new_filtered_db,3,porcentaje_train);
     [classified_rate,matriz_confusion]=DTW_KNN_classification_frecuency_gaussian_sin_restriccion(TRAIN,TEST,k);
     total_matriz_confusion=total_matriz_confusion+matriz_confusion;
     all_classified_rate(i)=classified_rate;
     [~,~,exactitud,precision]=calcula_valores_de_matriz_confusion(matriz_confusion);

     disp(['Accuracy  ', num2str(exactitud)]);
     disp(['Precision  ', num2str(precision)]);
     all_exactitud(i)=exactitud;
     all_precision(i)= precision;     

     
   end
    disp(['_______________________________________________________________  ']);
    disp(['Total confusion matrix' ]);
   disp(['S ','PBM ', 'C' ]);
   disp([num2str(total_matriz_confusion(:,:)) ]);
   mean_exactitud=mean(all_exactitud);
   disp(['The mean of all Accuracy is  ', num2str(mean_exactitud)]);
   std_dev_accuracy=std(all_exactitud);
   disp(['The Accuracy standard deviation is  ', num2str(std_dev_accuracy)]);
   mean_precision=mean(all_precision);
   disp(['The mean of all Precision is  ', num2str(mean_precision)]);
   std_dev_precision=std(all_precision);
   disp(['The Precision standard deviation is  ', num2str(std_dev_precision)]);


  % CreateStruct.WindowStyle = 'modal';
   %CreateStruct.Interpreter = 'tex';
 
  % prompt= strcat(' Precisión de la clasificación ',' ',num2str(total_classified_rate));
  % msgbox(prompt,CreateStruct);