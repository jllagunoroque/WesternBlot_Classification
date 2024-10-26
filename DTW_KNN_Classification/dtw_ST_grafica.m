 function [distance,w,serie_nueva]=dtw_ST_grafica(serie_de_entrada, serie_a_comparar,window)
 % Funcion que Obtiene la distancia DTW de 2 series de tiempo  
 %serie_de_entrada.- es la serie de tiempo que viene del conjunto de
    %prueba y que se va alinear con la serie_a_comparar
    %serie_a_comparar.- Es la serie de tiempo que viene del conjunto de
    %entrenamiento. Es con la sirve de base para comparar la
    %serie_de_entrada
    %windows es la ventana de restricción


    %se verifica las longitudes de las series a alinear
    if length(serie_de_entrada)>length(serie_a_comparar)
        n_entrada=length(serie_a_comparar);
        m_comparar=length(serie_de_entrada);
        aux1=serie_a_comparar;
        aux2=serie_de_entrada;
        serie_de_entrada=aux1;
        serie_a_comparar=aux2;
   
    else
        n_entrada=length(serie_de_entrada);
        m_comparar=length(serie_a_comparar);
  
    end
    
    %inicializa la matriz de costo
    for i=1:n_entrada
        for j=1:m_comparar
            cost_matrix(i,j)=inf;   
        end
    end
    cost_matrix(1,1)= 0;
    pendiente=m_comparar/n_entrada;
    ventana=window*length(serie_de_entrada);
    for i=1:n_entrada
       for j=1:m_comparar
             if (abs(i-(j/pendiente)) > ventana)
             continue;
        end
             %cost= abs(serie_de_entrada(i)-serie_a_comparar(j)).^2;
             cost= abs(serie_de_entrada(i)-serie_a_comparar(j));
            if i == 1 && j == 1
              cost_matrix(i,j) = cost_matrix(i,j);
            elseif i == 1
                cost_matrix(i,j) = cost + cost_matrix(i,j-1);
            elseif j == 1
                cost_matrix(i,j) = cost + cost_matrix(i-1,j);
            else
               cost_matrix(i,j)=cost+min([cost_matrix(i-1,j),cost_matrix(i,j-1),cost_matrix(i-1,j-1)]);
            end
        end
    
    end
      paranormalizar= n_entrada+m_comparar;
      cost_matrix_normalizada=cost_matrix/paranormalizar;
    distance = cost_matrix_normalizada(n_entrada,m_comparar);
    %distance = cost_matrix(n_entrada,m_comparar);
    
    n1=n_entrada;
m1=m_comparar;
k=1;
w=[];
w(1,:)=[n1,m1];
while ((n1+m1)~=2)
    if ((n1-1)==0)
        m1=m1-1;
    elseif (m1-1)==0
        n1=n1-1;
    else 
      [values,number]=min([cost_matrix_normalizada(n1-1,m1),cost_matrix_normalizada(n1,m1-1),cost_matrix_normalizada(n1-1,m1-1)]);
     
        switch number
           case 1
              n1=n1-1;
           case 2
              m1=m1-1;
           case 3
              n1=n1-1;
              m1=m1-1;
            end
    
    end
    k=k+1;
    w=cat(1,w,[n1,m1]);
end
ruta_nueva=[];
r=length(w);
for i= 1:r
    indice1=w(i,1);
    indice2=w(i,2);
    ruta_nueva(i,:)=cost_matrix_normalizada(indice1,indice2);
end
ruta_nueva=flipud(ruta_nueva);
serie_nueva=ruta_nueva(2:end)';
%plot(serie_de_entrada);
%hold on;
%plot(serie_a_comparar,'r');
%plot(serie_nueva,'y')
    
    
end