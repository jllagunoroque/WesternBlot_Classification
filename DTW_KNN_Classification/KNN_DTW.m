function predicted_class = KNN_DTW(TRAIN,TRAIN_class_labels,unknown_object,k,window)
% Función de aprendizaje KNN con distancia de similitud DTW.
% window es el porcentaje de restricción de la ventana a partir de la
% longitud de la serie de tiempo mas grande.
longitud_unknown_object=unknown_object(1);
unknown_object1=unknown_object(2:longitud_unknown_object+1);
distance=zeros(1,length(TRAIN_class_labels));
 for i = 1 : length(TRAIN_class_labels)
     longitud_TRAIN=TRAIN(i,1);
     compare_to_this_object = TRAIN(i,2:longitud_TRAIN+1);
     %K vecinos mas cercanos
      [distancia,~,~]=dtw_ST_grafica(unknown_object1, compare_to_this_object,window);
      distance(i)=distancia;
    
 end
%k Vecinos mas cercanos
[distance orden]=sort(distance,'ascend');
best_so_far=distance(1:k);
clases=TRAIN_class_labels(orden(1:k));
[u f c]=unique(clases);
for i=1:size(u,1)
    contadores_u(i,1)=size(find(c==i),1);   
    contadores_u(i,2)=min(best_so_far(find(clases==u(i))));    
    %contadores_u(i,2)=min(best_so_far(find(strcmp(clases,u(i)))));    
end
Orden_maximos_contadores=flipdim(sortrows(contadores_u,1),1);
Maximos_iguales=find(contadores_u(:,1)==Orden_maximos_contadores(1,1));
[V Orden_minimos]=sortrows(contadores_u(Maximos_iguales,:),2);
predicted_class=u(Maximos_iguales(Orden_minimos(1)));
end