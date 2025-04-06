function A_inv = InversaPivotMax(A)
% Vector de entrada
c = [0.9, 0.8, 0.7, 6, 5, 4, 3, 2, 1, 0.1];

% Matriz de Vandermonde
A = vander(c);

% Dimensión de la matriz
n = size(A, 1);

% Inicializar matrices L, U y P, Q
L = eye(n);
U = A;
P = eye(n); % Matriz de permutación de filas
Q = eye(n); % Matriz de permutación de columnas

% Algoritmo de factorización LU con pivotaje completo (maximal)
for k = 1:n-1
    % Llamar a la función GaussPivotMax para realizar el pivotaje
    [U, P, Q, L] = GaussPivotMax(U, P, Q, L, k);

    % Eliminación Gaussiana para triangularizar U
    for j = k+1:n
        L(j, k) = U(j, k) / U(k, k);
        U(j, :) = U(j, :) - L(j, k) * U(k, :);
    end
end

% Inicializar la matriz inversa
A_inv = zeros(n);

% Resolver para encontrar la inversa de A
for i = 1:n
    % Vector columna de la matriz identidad
    e = zeros(n, 1);
    e(i) = 1;

    % Resolver el sistema Ly = P*e usando forwardsub
    y = forwardsub(L, P * e);

    % Resolver el sistema Ux = y usando backsub
    x = backsub(U, y);

    % Colocar el resultado en la columna i de la inversa
    A_inv(:, i) = Q * x; % Aplicar permutación de columnas con Q
end

% Mostrar los resultados
%disp('La matriz de partida era:');
%disp(A);
%disp('Matriz P (permutación de filas):');
%disp(P);
%disp('Matriz Q (permutación de columnas):');
%disp(Q);
%disp('Matriz L (triangular inferior):');
%disp(L);
%disp('Matriz U (triangular superior):');
%disp(U)

%disp('La inversa de la matriz de Vandermonde A es:');
%disp(A_inv);

% Comprobación de la factorización
%resultado = P * A * Q - L * U;
%disp('Comprobación de P * A * Q - L * U (debería ser cercano a cero):');
%disp(resultado);

