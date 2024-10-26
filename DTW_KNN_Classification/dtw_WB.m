function [distance,serie_nueva]=dtw_WB(serie_de_entrada, serie_a_comparar)
 % Funcion que Obtiene la distancia DTW de 2 series de tiempo SIN Restricciones  
 %serie_de_entrada.- es la serie de tiempo que viene del conjunto de
    %prueba y que se va alinear con la serie_a_comparar
    %serie_a_comparar.- Es la serie de tiempo que viene del conjunto de
    %entrenamiento. Es con la sirve de base para comparar la
    %serie_de_entrada

if length(serie_de_entrada)>length(serie_a_comparar)
    n=length(serie_a_comparar);
    m=length(serie_de_entrada);
    aux1=serie_a_comparar;
    aux2=serie_de_entrada;
    serie_de_entrada=aux1;
    serie_a_comparar=aux2;
else
    n=length(serie_de_entrada);
    m=length(serie_a_comparar);
end
cost_matrix=zeros(n,m);
for i= 1 : n
        cost_matrix(i,1)= inf;
end
for j= 1 : m
        cost_matrix(1,j)= inf;
end
cost_matrix(1,1)= 0;

for i=1:n
    for j=1:m
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
distance = cost_matrix(n,m);
%plot(cost_matrix(:,:));


n1=n;
m1=m;
k=1;
w=[];
w(1,:)=[n1,m1];
while ((n1+m1)~=2)
    if ((n1-1)==0)
        m1=m1-1;
    elseif (m1-1)==0
        n1=n1-1;
    else 
      [values,number]=min([cost_matrix(n1-1,m1),cost_matrix(n1,m1-1),cost_matrix(n1-1,m1-1)]);
     
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
    ruta_nueva(i,:)=cost_matrix(indice1,indice2);
end
ruta_nueva=flipud(ruta_nueva);
serie_nueva=ruta_nueva';





end
