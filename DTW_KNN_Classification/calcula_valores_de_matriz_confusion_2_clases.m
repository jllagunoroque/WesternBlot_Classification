function [sensibilidad,especificidad,exactitud,precision]=calcula_valores_de_matriz_confusion_2_clases(mc)
% Función que obtiene la especificidad, sensitividad, precisión mediante 
% los valores True Positive(Tp), True Negative(Tn),
% False Positive(FP), False Negative(Fn) a partir de la matriz de confusión.
% mc es la matriz de confusión. Las clases Saludable y Patología benigna de
% mama se tratan como una sola clase.
% Los valores de sensibilidad, especificidad, exactitud, precision se
% obtienen teniendo como base la clase 3 es que cáncer.
%                    Predicted class
%        ___________________________________________ 
% True   | True Positive(Tp)  | False Negative(FN)  |
% Class  ____________________________________________
%        | False Positive(Fp) |  True Negative(Tn)  | 
%         ___________________________________________
%

        % Se calculan los valores para la clase cáncer
        Tp=mc(2,2);
        Tn=mc(1,1);
        Fp=mc(1,2);
        Fn=mc(2,1);

        
        

sensibilidad= (Tp/(Tp+Fn))*100;
especificidad=(Tn/(Tn+Fp))*100;
exactitud=((Tp+Tp)/(sum(sum(mc(:,:)))))*100;
precision=(Tp/(Tp+Fp))*100;

end