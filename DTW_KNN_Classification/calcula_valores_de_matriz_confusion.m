function [sensibilidad,especificidad,exactitud,precision]=calcula_valores_de_matriz_confusion(mc)
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

        % Se calculan los valores para la clase Saludable
        Tp_s=mc(1,1);
        Tn_s=sum(sum(mc(2:3,2:3)));
        Fp_s=sum(mc(2:3,1));
        Fn_s=sum(mc(1,2:3));

        % Se calculan los valores para la clase Patología Benigna de mama
        Tp_pbm=mc(2,2);
        Tn_pbm=mc(1,1)+mc(1,3)+mc(3,1)+mc(3,3);
        Fp_pbm=mc(1,2)+mc(3,2);
        Fn_pbm=mc(2,1)+mc(2,3);
    
        % Se calculan los valores para la clase Cáncer
        Tp_c=mc(3,3);
        Tn_c=sum(sum(mc(1:2,1:2)));
        Fp_c=sum(mc(1:2,3));
        Fn_c=sum(mc(3,1:2));


sensibilidad= (Tp_c/(Tp_c+Fn_s+Fn_pbm))*100;
especificidad=(Tn_c/(Tn_c+Fp_s+Fp_pbm))*100;
exactitud=((Tp_c+Tp_pbm+Tp_s)/(sum(sum(mc(:,:)))))*100;
precision=(Tp_c/(Tp_c+Fp_c))*100;

end