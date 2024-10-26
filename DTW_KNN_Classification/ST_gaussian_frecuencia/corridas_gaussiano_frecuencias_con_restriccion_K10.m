function corridas_gaussiano_frecuencias_con_restriccion_K10(total_bd_ts_DTW)
disp('-----------  K=10  --------------------------');

disp('K=10  Sigma 50 Ventana=0.06 ');
Clasif_ST_WB_frecuency_suavizado_gauss_DTW_Con_restriccion(total_bd_ts_DTW,0.70,10,50,0.06);
disp('-------------------------------------');

disp('K=10  Sigma 150 Ventana=0.06 ');
Clasif_ST_WB_frecuency_suavizado_gauss_DTW_Con_restriccion(total_bd_ts_DTW,0.70,10,150,0.06);
disp('-------------------------------------');

disp('K=10  Sigma 250 Ventana=0.06 ');
Clasif_ST_WB_frecuency_suavizado_gauss_DTW_Con_restriccion(total_bd_ts_DTW,0.70,10,250,0.06);
disp('-------------------------------------');

disp('K=10  Sigma 50 Ventana=0.10 ');
Clasif_ST_WB_frecuency_suavizado_gauss_DTW_Con_restriccion(total_bd_ts_DTW,0.70,10,50,0.10);
disp('-------------------------------------');

disp('K=10  Sigma 150 Ventana=0.10 ');
Clasif_ST_WB_frecuency_suavizado_gauss_DTW_Con_restriccion(total_bd_ts_DTW,0.70,10,150,0.10);
disp('-------------------------------------');

disp('K=10  Sigma 250 Ventana=0.10 ');
Clasif_ST_WB_frecuency_suavizado_gauss_DTW_Con_restriccion(total_bd_ts_DTW,0.70,10,250,0.10);
disp('-------------------------------------');

disp('K=10  Sigma 50 Ventana=0.20 ');
Clasif_ST_WB_frecuency_suavizado_gauss_DTW_Con_restriccion(total_bd_ts_DTW,0.70,10,50,0.20);
disp('-------------------------------------');

disp('K=10  Sigma 150 Ventana=0.20 ');
Clasif_ST_WB_frecuency_suavizado_gauss_DTW_Con_restriccion(total_bd_ts_DTW,0.70,10,150,0.20);
disp('-------------------------------------');

disp('K=10  Sigma 250 Ventana=0.20 ');
Clasif_ST_WB_frecuency_suavizado_gauss_DTW_Con_restriccion(total_bd_ts_DTW,0.70,10,250,0.20);
disp('-------------------------------------');









end