clear all;
close all;

%Se carga la base de datos de las imagenes
imagenes = imageDatastore('dataset_grayscale\', ...
    'IncludeSubfolders',true, ...
    'LabelSource','foldernames');

%Divide el conjunto de imagenes en entrenamiento y prueba
[ImEnt,ImPrub] = splitEachLabel(imagenes,0.7,'randomize') ;
clases = numel(categories(imagenes.Labels));

%Capas que conforman la red propuesta .
layers = [
    imageInputLayer([256 256])
    
          
    convolution2dLayer(7,20,'Padding','same')
    batchNormalizationLayer
    reluLayer 
    maxPooling2dLayer(2,'Stride',2) 
    
    
    convolution2dLayer(7,40,'Padding','same') 
    batchNormalizationLayer 
    reluLayer 
    maxPooling2dLayer(2,'Stride',2) 
    
    convolution2dLayer(7,80,'Padding','same') 
    batchNormalizationLayer 
    reluLayer 

    % maxPooling2dLayer(2,'Stride',2) 
    %convolution2dLayer(3,160,'Padding','same') 
   %batchNormalizationLayer 
   % reluLayer 
    
    %maxPooling2dLayer(2,'Stride',2) 
    %convolution2dLayer(3,320,'Padding','same') 
    %batchNormalizationLayer 
    %reluLayer 
    
    
    
    fullyConnectedLayer(clases) 
    softmaxLayer
    classificationLayer] ; 
%sgdm --> adam
%Se especifican las opciones para la etapa de entrenamiento 
options = trainingOptions ('adam', ...
        'MiniBatchSize',5, ...
        'MaxEpochs',20, ...
        'InitialLearnRate',1e-4, ...
        'Shuffle','every-epoch', ...
        'ValidationData',ImPrub, ...
        'ValidationFrequency' ,3, ...
        'Verbose', false, ...
        'Plots','training-progress') ;

%Entrenamiento de la Red    
net = trainNetwork(ImEnt,layers,options);

%Clasificación con el conjunto de prueba
predic=classify(net,ImPrub);
valida=ImPrub.Labels;
matriz=confusionmat(ImPrub.Labels,predic);
[Result,ReferenceResult] = multiclass_metrics_special(matriz);
plotconfusion(ImPrub.Labels,predic);
%Calculo de la precisión de la clasificación en el conjunto de prueba
precision=sum(predic==valida)/numel(valida)
