function Clasifica_ST_WB_raw_DTW_Sin_restriccion(total_bd_ts,porcentaje_train,k)
%función que obtiene la clasificación de series de tiempo RAW utilizando
%KNN con distancia de similitud DTW sin restricciones.
%Cross fold validation con porcentaje en TRAIN y TEST

   %load('D:\bcdata\bd_st\bd_st_standarizadas');
   total_matriz_confusion=zeros(3,3);
   series_tiempo=total_bd_ts;
   all_classified_rate=[];
   all_sensibilidad=[];
   all_especificidad=[];
   all_exactitud=[];
   all_precision=[];
   disp(['__________________________________________________________  ']);
   for i=1:10
       disp(['_______________________________________________________________  ']);
      disp(['Classification  ', num2str(i)]);    
     [TRAIN,TEST]=Get_Train_Test_Data_WB_general(series_tiempo,3,porcentaje_train);
     [classified_rate,matriz_confusion]=DTW_KNN_classification_raw(TRAIN,TEST,k);
     total_matriz_confusion=total_matriz_confusion+matriz_confusion;
     all_classified_rate(i)=classified_rate;
      [~,~,exactitud,precision]=calcula_valores_de_matriz_confusion(matriz_confusion);
    
     %disp(['Sensitivity  ', num2str(sensibilidad)]); 
     %disp(['Specificity  ', num2str(especificidad)]); 
     disp(['Accuracy  ', num2str(exactitud)]);
     disp(['Precision  ', num2str(precision)]);
     %all_sensibilidad(i)=sensibilidad;
     %all_especificidad(i)=especificidad;
     all_exactitud(i)=exactitud;
     all_precision(i)= precision;
  

   end
    disp(['_______________________________________________________________  ']);
   %total_classified_rate=mean(all_classified_rate);
   %disp(['The mean of all classified rate is  ', num2str(total_classified_rate*100)]);
   %standard_deviation=std(all_classified_rate);
   %disp(['The standard deviation is  ', num2str(standard_deviation)]);
   disp(['Total confusion matrix' ]);
   disp(['S ','PBM ', 'C' ]);
   disp([num2str(total_matriz_confusion(:,:)) ]);
  % mean_sensibilidad=mean(all_sensibilidad);
  % disp(['The mean of all Sensitivity is  ', num2str(mean_sensibilidad)]);
  % mean_especificidad=mean(all_especificidad);
  % disp(['The mean of all Specificity is  ', num2str(mean_especificidad)]);
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
end