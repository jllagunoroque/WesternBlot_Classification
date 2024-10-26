function [matriz_confusion]=calcular_matriz_confusion_2_clases(predicted_class,this_objects_actual_class, matriz_confusion,verdadero)
% Función que calcula la matriz de confusión para 2 clases
% predicted_class es la clase que predijo el algoritmo
%this_objects_actual_class es la clase original que será clasificada
% Matriz de confusión, se guardan los valores de las clases originales y
% las predichas.
% Verdadero,con valor de 1 si se predijo bien la clase, 2 si no se predijo
% bien.
  if verdadero==1
    switch (predicted_class)
                case {1}
                    matriz_confusion(1,1)=matriz_confusion(1,1)+1;
                case {3}
                    matriz_confusion(2,2)=matriz_confusion(2,2)+1;
                
    end
  else
      switch (this_objects_actual_class)
           case {1}
                if predicted_class==3
                    matriz_confusion(1,2)=matriz_confusion(1,2)+1;
                end
            case{3}
                 if predicted_class==1 
                   matriz_confusion(2,1)=matriz_confusion(2,1)+1;
                end
        end
  end





end