% Vector de entrada
c = [0.1, 0.2, 0.3, 4, 5, 6, 7, 8, 0.4, 0.5];



% Generar matriz de Vandermonde
A = vander(c);

% Calcular la inversa estándar de A usando el método de MATLAB
A_inv = inv(A);  % La inversa estándar de MATLAB

% Calcular la inversa utilizando el método de pivote máximo
A_inv_pivot = InversaPivotMax(A);

% Calcular la inversa refinada
A_inv_refined = RefinamientoPivotCol(A);

% Calcular la inversa utilizando el método de Gauss
A_invGauss = RefinamientoGauss(A);  % Reemplazar con tu implementación del método Gauss

% Comparar las cuatro inversas
ComparacionFinal(A, A_inv, A_inv_pivot, A_inv_refined, A_invGauss);


