# WesternBlot_Classification
# Structure of the files containing the codes and images for the classification of Western Blot images


DTW_KNN_Classification/ - Folder containing the codes to classify time series using different treatments

    ST_KNN_Escalamiento_geométrico/
           Clasifica_ST_escalamiento_geometrico.m - Function that obtains the classification of RAW time series using KNN with unrestricted DTW similarity distance. Cross fold validation with percentage in TRAIN and TEST.
           KNN_ST_esc_geometrico -KNN learning function with DTW similarity distance. DTW similarity measure has no restrictions k are the nearest neighbors.
           ST_KNN_classification_esc_geometrico.m - Time series classification using KNN and Standardized Time Series with geometric scaling. TRAIN training set according to the previously obtained percentage. TEST training set according to the previously obtained percentage k is the value of the nearest neighbors. Cross Validation.
    ST_Raw_DTW/
           Raw_con_restriccion/
                 2_clases/
                      Clasifica_ST_WB_raw_DTW_Con_restriccion_2_clases.m - Function that obtains the classification of RAW time series using KNN with unrestricted DTW similarity distance. 2 classes. Cross fold validation with percentage in TRAIN and TEST.
                      DTW_KNN_classification_raw_2clases_Con_restriccion.m - Raw time series classification using KNN and DTW With constraints. 2 classes are classified. db_TS is the database of all patient time series. k is the value of nearest neighbors.
                 3_clases/
                      Clasifica_ST_WB_raw_DTW_Con_restriccion.m - Function that obtains the classification of RAW time series using KNN with unrestricted DTW similarity distance. Cross fold validation with percentage in TRAIN and TEST.
                      DTW_KNN_classification_raw_restricciones.m - Time series classification using KNN and Raw Time Series. With Restrictions in DTW TRAIN training set according to the percentage previously obtained. TEST training set according to the percentage previously obtained. k is the value of the nearest neighbors. Cross Fold Validation.
           Raw_sin_restriccion/
                 2_clases/
                      Clasifica_ST_WB_raw_DTW_Sin_restriccion_2_clases.m - Function that obtains the classification of RAW time series using KNN with unrestricted DTW similarity distance. 2 classes. Cross fold validation with percentage in TRAIN and TEST.
                      DTW_KNN_classification_raw_2clases_Sin_restriccion.m - Raw time series classification using KNN and DTW Unrestricted. 2 classes are classified. db_TS is the database of all patient time series. k is the value of nearest neighbors.
                 3_clases/
                      Clasifica_ST_WB_raw_DTW_Sin_restriccion.m - Function that obtains the classification of RAW time series using KNN with unrestricted DTW similarity distance. Cross fold validation with percentage in TRAIN and TEST.
                      DTW_KNN_classification_raw.m -  Time series classification using KNN and Raw Time Series. No Restrictions in DTW. TRAIN training set according to the percentage previously obtained. TEST training set according to the percentage previously obtained. k is the value of the nearest neighbors. Cross Fold Validation.
    ST_gaussian_espacial/
           Gauss_espacial_con_restriccion/
                 2_clases/
                      Class_ST_WB_espacio_gauss_Con_restriccion_2_clases.m - Function that obtains the classification of RAW time series using KNN with unrestricted DTW similarity distance. 2 classes. Cross fold validation with percentage in TRAIN and TEST.
                      DTW_KNN_class_espacio_gauss_raw_2clases_Con_restriccion.m - Raw time series classification using KNN and DTW With constraints. 2 classes are classified. db_TS is the database of all patient time series. k is the value of nearest neighbors.
                 3_clases/
                      Clasifica_ST_WB_espacio_suavizado_gausiano_DTW_Con_restriccion.m -Function that obtains the classification of time series with Gaussian smoothing using KNN with unrestricted DTW similarity distance. Cross fold validation with percentage in TRAIN and TEST. 
                      DTW_KNN_classification_spatial_gaussian_restricciones.m - Time series classification using KNN and Raw Time Series. With DTW Restrictions. TRAIN training set according to the previously obtained percentage. TEST training set according to the previously obtained percentage. k is the value of the nearest neighbors. Cross FOld Validation.
           Gauss_espacial_sin_restriccion/
                 2_clases/
                      Class_ST_WB_espacio_suavizado_gauss_DTW_Sin_restriccion_2clases.m - Function that obtains the classification of time series with Gaussian smoothing in the spatial domain using KNN with unrestricted DTW similarity distance. 2 classes. Cross fold validation with percentage in TRAIN and TEST.
                      DTW_KNN_classification_espacio_gauss_2clases_Sin_restriccion.m - Raw time series classification using KNN and DTW Unrestricted. 2 classes are classified. db_TS is the database of all patient time series. k is the value of nearest neighbors.
                 3_clases/
                      Clasifica_ST_WB_espacio_suavizado_gausiano_DTW_Sin_restriccion.m - Function that obtains the classification of time series with Gaussian smoothing using KNN with unrestricted DTW similarity distance. Cross fold validation with percentage in TRAIN and TEST. Sensitivity and specificity are not calculated with 3 classes, because the calculation of the confusion matrix must be calculated with only 2 classes.
                      DTW_KNN_classification_spatial_gaussian_sin_restriccion.m - Time series classification using KNN and Gaussian filtered time series in the spatial domain. No restrictions in DTW. TRAIN training set according to the previously obtained percentage. TEST training set according to the previously obtained percentage. k is the value of the nearest neighbors. Cross Fold Validation.
           Gauss_frecuencia_con_restriccion/
                 2_clases/
                      Class_ST_WB_frecuencia_gauss_Con_restriccion_2_clases.m - Function that obtains the classification of RAW time series using KNN with unrestricted DTW similarity distance. 2 classes. Cross fold validation with percentage in TRAIN and TEST.
                      DTW_KNN_class_frec_gauss_2clases_Con_restriccion.m - Raw time series classification using KNN and DTW With constraints. 2 classes are classified. db_TS is the database of all patient time series. k is the value of nearest neighbors.
                 3_clases/
                      Clasif_ST_WB_frecuency_suavizado_gauss_DTW_Con_restriccion.m -Function that obtains the classification of time series with Gaussian smoothing using KNN with unrestricted DTW similarity distance. Cross fold validation with percentage in TRAIN and TEST.
                      DTW_KNN_classification_Frecuency_gaussian_restricciones.m - Time series classification using KNN and Raw Time Series. With DTW Restrictions. TRAIN training set according to the previously obtained percentage. TEST training set according to the previously obtained percentage. k is the value of the nearest neighbors. Cross FOld Validation.
           Gauss_frecuencia_sin_restriccion/
                 2_clases/
                      Class_ST_WB_frec_suavizado_gauss_DTW_Sin_restriccion_2clases.m - Function that obtains the classification of time series with Gaussian smoothing in the frequency domain using KNN with unrestricted DTW similarity distance. 2 classes. Cross fold validation with percentage in TRAIN and TEST.
                      DTW_KNN_classification_frec_gauss_2clases_Sin_restriccion.m - Gaussian smoothed time series classification in frequency domain with KNN and DTW Unrestricted. 2 classes are classified. db_TS is the database of all patient time series. k is the value of nearest neighbors.
                 3_clases/
                      Clasifica_ST_WB_frecuencia_gausiano_DTW_Sin_restriccion.m - Function that obtains the classification of time series with Gaussian smoothing in the frequency domain by means of the Fourier transform using KNN with unrestricted DTW similarity distance. Cross fold validation with percentage in TRAIN and TEST. Sensitivity and specificity are not calculated with 3 classes, because the calculation of the confusion matrix must be calculated with only 2 classes.
                      DTW_KNN_classification_frecuency_gaussian_sin_restriccion.m - Time series classification using KNN and Gaussian filtered time series in the spatial domain. No restrictions in DTW. TRAIN training set according to the previously obtained percentage. TEST training set according to the previously obtained percentage. k is the value of the nearest neighbors. Cross Fold Validation.
    DTW_1TS_fft_filter.m -Function that applies the Fourier Transform to apply the Gaussian filter to a time series.
    DTW_1TS_gauss_filter.m - Function that filters a time series with the Gaussian filter.
    Get_Train_Test_Data_WB_2classes_general.m - Function that has as input the matrix containing the time series of all patients. The objective is to place these time series in two matrices: TRAIN and TEST. The time series are ordered randomly and with almost the same number of cases in the two matrices.
    Get_Train_Test_Data_WB_general.m - Function that takes as input the matrix containing the time series of all patients. The objective is to place these time series in two matrices: TRAIN and TEST. The time series are ordered randomly and with almost the same number of cases in the two matrices. percentage_train is the percentage for the training set.
    KNN_DTW.m - KNN learning function with DTW similarity distance. window is the percentage of window restriction from the length of the largest time series.
    KNN_DTW_No_Window.m - KNN learning function with DTW similarity distance. DTW similarity measure has no restrictions. k are the nearest neighbors.
    calcula_valores_de_matriz_confusion.m - Function that obtains the specificity, sensitivity, precision using the values ​​True Positive(Tp), True Negative(Tn), False Positive(FP), False Negative(Fn) from the confusion matrix. mc is the confusion matrix. The classes Healthy and Benign breast pathology are treated as a single class. The values ​​of sensitivity, specificity, accuracy, precision are obtained based on class 3 is that cancer.
    calcula_valores_de_matriz_confusion_2_clases.m - Function that obtains the specificity, sensitivity, precision using the values ​​True Positive(Tp), True Negative(Tn), False Positive(FP), False Negative(Fn) from the confusion matrix. mc is the confusion matrix. The classes Healthy and Benign breast pathology are treated as a single class. The values ​​of sensitivity, specificity, accuracy, precision are obtained based on class 3 is that cancer.
    calcular_matriz_confusion.m - Function that calculates the confusion matrix. predicted_class is the class that was predicted by the algorithm. this_objects_actual_class is the original class that will be classified. Confusion matrix, the values ​​of the original and predicted classes are saved. True, with a value of 1 if the class was predicted correctly, 2 if it was not predicted correctly.
    calcular_matriz_confusion_2_clases.m  - Function that calculates the confusion matrix for 2 classes. predicted_class is the class that was predicted by the algorithm. this_objects_actual_class is the original class that will be classified. Confusion matrix, the values ​​of the original and predicted classes are saved. True, with a value of 1 if the class was predicted correctly, 2 if it was not predicted correctly.
    dtw_ST_grafica.m  - Function that obtains the DTW distance of 2 time series. input_series.- is the time series that comes from the test set and that is going to be aligned with the series_to_compare. series_to_compare.- It is the time series that comes from the training set. It is the basis for comparing the input_series. windows is the restriction window.
    dtw_WB.m - Function that obtains the DTW distance of 2 time series WITHOUT Restrictions. input_series.- is the time series that comes from the test set and that is going to be aligned with the series_to_compare. series_to_compare.- It is the time series that comes from the training set. It is the one that serves as a basis for comparing the input_series.
    ffourier_all_TS_db.m - function that applies the Fourier transform to all the series in the database, obtaining the value of the descriptors of each image.
    ffouriert_filter_all_TS_db.m - Function that filters all the series in the database. The Fourier transform filter is used.
    gaussFilter.m - Creates a 1-D Gaussian kernel of a standard deviation 'segma' and a size of 'kSize'.
    gaussian_filter_all_TS_db.m - function that filters all series in the database. The Gaussian filter is used.
DeepGA/
    CNN_DeepGA.ipynb - DeepGA code that allows obtaining the CNN
    Entrenamiento_DeppGA.ipynbCode - used to train the CNN
    aumento_de_datos.ipynb - Code to artificially increase data
Experimental CNN/
    ECNN.m - Experimental convolutional neural network code(ECNN)
Time Series Data base/
    bd_st_DTW.mat - Time Series Data base
Western Blot Images/
    Color_dataset/
           breast_benign_pathology - Images of benign breast pathology
           breast_cancer - Breast cancer images
           health - Healthy images
    Fourier_dataset/
           breast_benign_pathology - Images of benign breast pathology
           breast_cancer - Breast cancer images
           health - Healthy images
    grayscale_dataset/
           breast_benign_pathology - Images of benign breast pathology
           breast_cancer - Breast cancer images
           health - Healthy images
           
              










