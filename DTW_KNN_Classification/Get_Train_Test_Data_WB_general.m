function [TRAIN,TEST]=Get_Train_Test_Data_WB_general(guarda_signal,clases,porcentaje_train)
%Función que tiene como entrada la matriz que contiene las series de
%tiempo de todos los pacientes. El objetivo es colocar esas series de
%tiempo en dos matrices: TRAIN y TEST. Las series de tiempo se ordenan de
%manera aleatoria y con casi el mismo número de casos en las dos matrices.
%porcentaje_train es e porcentaje para el conjunto de entrenamiento
%El resultado de esta función sirve como entrada de
%DTW_KNN_Classification_raw,DTW_KNN_Classification_raw_Con_restriccion


%guarda_signal es la matriz que contiene las series de tiempo
raw_TS=guarda_signal;

TRAIN=[];
TEST=[];
%ciclo que es controlado por medio de las etiquetas existentes(1,2,3,4,5,6)
%y son con las que se buscan las series de tiempo
for i=1:3
    TS_position=find(raw_TS(:,1)==i);%busca las series de tiempo a partir de las etiquetas
    if ~isempty(TS_position)
        num_labels=length(TS_position);
        time_series=guarda_signal(TS_position(:),:);%se obtienen las series de tiempo de la etiqueta
        [rows cols]=size(time_series);
        shuffle=randperm(rows);%se "mezcla" de manera aleatoria los renglones de las ST
        half=round(rows*porcentaje_train);% se obtiene el porcentaje de los renglones de TRAIN
        if isempty(TRAIN) & isempty(TEST)
            TRAIN=time_series(shuffle(1:half),:);%se coloca en TRAIN la mitad de la serie de tiempo(ya "mezclada" aleatoriamente)
            TEST=time_series(shuffle(half+1:rows),:);% se coloca en TEST la mitad restante de la serie de tiempo(ya "mezclada" aleatoriamente)
        else
            TRAIN=cat(1,TRAIN,time_series(shuffle(1:half),:));
            TEST=cat(1,TEST,time_series(shuffle(half+1:rows),:));
        end
    end
end

%save('C:\colposdata\classified\TOCLASSIFY','TRAIN','TEST');