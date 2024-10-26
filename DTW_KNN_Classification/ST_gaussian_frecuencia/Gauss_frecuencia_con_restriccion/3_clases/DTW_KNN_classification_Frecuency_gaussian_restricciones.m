function [accuracy,matriz_confusion]=DTW_KNN_classification_Frecuency_gaussian_restricciones(TRAIN,TEST,k,window)
%Clasificación de series de tiempo utilizando KNN y Series de tiempo Raw.
% Con Restricciones en DTW
%TRAIN conjunto de entrenamiento según el porcentaje previamente obtenido
%TEST conjunto de entrenamiento según el porcentaje previamente obtenido
%k es el valor de los vecinos mas cercanos
% Cross FOld Validation.

[TRAIN_rows TRAIN_cols]=size(TRAIN);
[TEST_rows TEST_cols]=size(TEST);

TRAIN_class_labels = TRAIN(:,1);     % Pull out the class labels.
TRAIN(:,1) = [];                     % Remove class labels from training set.
TEST_class_labels = TEST(:,1);       % Pull out the class labels.
TEST(:,1) = [];                      % Remove class labels from testing set. 
correct = 0; % Initialize the number we got correct
incorrect=0;
clase1=0;
clase2=0;
clase3=0;
clase1_checked=0;
clase2_checked=0;
clase3_checked=0;
matriz_confusion=zeros(3,3);

for i = 1 : length(TEST_class_labels) % Loop over every instance in the test set
    classify_this_object = TEST(i,:);
    this_objects_actual_class = TEST_class_labels(i);
    switch(TEST_class_labels(i))
        case {1}
                clase1_checked=clase1_checked+1;         
            case {2}
                clase2_checked=clase2_checked+1;
            case {3}
                clase3_checked=clase3_checked+1;
    end;
    predicted_class = KNN_DTW(TRAIN,TRAIN_class_labels, classify_this_object,k,window);
    if predicted_class == this_objects_actual_class
        correct = correct + 1;
        switch (predicted_class)
            case {1}
                clase1=clase1+1;
                 [matriz_confusion]=calcular_matriz_confusion(predicted_class,this_objects_actual_class, matriz_confusion,1);
            case {2}
                clase2=clase2+1;
                 [matriz_confusion]=calcular_matriz_confusion(predicted_class,this_objects_actual_class, matriz_confusion,1);
            case {3}
                clase3=clase3+1;
                 [matriz_confusion]=calcular_matriz_confusion(predicted_class,this_objects_actual_class, matriz_confusion,1);
        end
    else
        incorrect= incorrect+1;
        [matriz_confusion]=calcular_matriz_confusion(predicted_class,this_objects_actual_class, matriz_confusion,2);
    end
  
end

%%%%%%%%%%%%%%%%% Create Report %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp(['The dataset you tested has ', int2str(length(unique(TRAIN_class_labels))), ' classes'])
disp(['The training set is of size ', int2str(size(TRAIN,1)),', and the test set is of size ',int2str(size(TEST,1)),'.'])
disp(['The time series are of length ', int2str(size(TRAIN,2))])
disp(['The error rate was ',num2str((length(TEST_class_labels)-correct )/length(TEST_class_labels))])
disp(['The incorrect was ',num2str(incorrect) ])
disp(['The class 1 has ',num2str(clase1),' of ',num2str(clase1_checked) ]);
disp(['The class 2 has ',num2str(clase2),' of ',num2str(clase2_checked) ]);
disp(['The class 3 has ',num2str(clase3),' of ',num2str(clase3_checked) ]);
disp(['S ','PBM ', 'C' ]);
disp([num2str(matriz_confusion(:,:)) ]);
if clase1>0 & clase1_checked>0
    total_clase1=(clase1/clase1_checked)*100;
else
    total_clase1=0;
end
if clase2>0 & clase2_checked>0
    total_clase2=(clase2/clase2_checked)*100;
else
    total_clase2=0;
end
if clase3>0 & clase3_checked>0
    total_clase3=(clase3/clase3_checked)*100;
else
    total_clase3=0;
end
 if correct>0
         error_rate=(length(TEST_class_labels)-correct )/length(TEST_class_labels);
         classified_rate=1-error_rate;
     else
         error_rate=0;
         classified_rate=0;
     end
    disp(['Classified rate was ',num2str(classified_rate) ]);
     
     total_classified=clase1+clase2+clase3;
     accuracy=correct/length(TEST_class_labels);
     disp(['Total Classified was  ',num2str(total_classified) ]);

%%%%%%%%%%%%%%%%% End Report %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

