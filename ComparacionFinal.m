function ComparacionFinal(A, A_inv, A_inv_pivot, A_inv_refined, A_invGauss)
    % Calcular la inversa usando el método estándar de MATLAB
    A_inv_matlab = inv(A);  % Inversa estándar de MATLAB

    % Verificación: A * A_inv debería ser la matriz identidad
    I = eye(size(A));  % Matriz identidad

    % Comparar A * A_inv con la identidad
    diff_maximal = norm(A * A_inv - I);          % Error para la inversa estándar
    diff_refined = norm(A * A_inv_refined - I);  % Error para la inversa refinada
    diff_gauss = norm(A * A_invGauss - I);       % Error para la inversa Gauss
    diff_matlab = norm(A * A_inv_matlab - I);    % Error para la inversa de MATLAB

    % Mostrar los resultados
    disp('Comparación de las cuatro inversas:');
    fprintf('Diferencia de la inversa con pivotaje maximal: %.5e\n', diff_maximal);
    fprintf('Diferencia de la inversa refinada por Columnas: %.5e\n', diff_refined);
    fprintf('Diferencia de la inversa refinada por Gauss: %.5e\n', diff_gauss);
    fprintf('Diferencia de la inversa de MATLAB: %.5e\n', diff_matlab);

    % Mostrar cual inversa tiene el menor error
    [min_error, min_idx] = min([diff_maximal, diff_refined, diff_gauss, diff_matlab]);
    methods = {'maximal', 'Refinada por columnas', 'Refinada por LU', 'MATLAB'};

    disp(['La inversa con el menor error es la inversa ', methods{min_idx}, ' con un error de ', num2str(min_error)]);
end


