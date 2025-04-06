function InvA2 = RefinamientoPivotCol(A)
    % Refinamiento para calcular la inversa de una matriz de Vandermonde
    % generada a partir de un vector c.

    % Vector de entrada
    c = [0.9, 0.8, 0.7, 6, 5, 4, 3, 2, 1, 0.1];

    % Generar matriz de Vandermonde
    A = vander(c);

    % Dimensión de la matriz
    n = size(A, 1);
    % Factorización LU con pivotaje parcial
    [P, L, U] = GaussCol(A);  % P es la matriz de permutación que hace pivotaje

    % Inicializar la matriz inversa
    InvA2 = zeros(n);

    % Iterar para cada columna de la identidad (e_k)
    for k = 1:n
        % Vector columna de la identidad
        e_k = zeros(n, 1);
        e_k(k) = 1;

        % Paso ii-1: Resolver Ly = P*e_k
        y = forwardsub(L, P * e_k);  % Resolver Ly = P*e_k usando sustitución hacia adelante
        x0 = backsub(U, y);  % Resolver Ux0 = y usando sustitución hacia atrás

        % Refinamiento iterativo
        x = x0;  % Primera aproximación
        norm_prev = Inf;  % Norma anterior para el criterio de convergencia

        while true
            % Paso ii-2: Calcular b0 = Ax y resolver Az0 = e_k - b0
            b0 = A * x;
            r = e_k - b0;  % Residuo

            % Resolver Ly = r y Uz0 = y
            y = forwardsub(L, r);  % Resolver Ly = r
            z0 = backsub(U, y);  % Resolver Uz0 = y

            % Paso ii-3: Actualizar solución x
            x = x + z0;

            % Verificar criterio de convergencia
            norm_curr = norm(z0);
            if norm_curr >= norm_prev
                break;
            end
            norm_prev = norm_curr;
        end

        % Almacenar la columna k-ésima de la inversa
        InvA2(:, k) = x;
    end
end
function [P, L, U] = GaussCol(A)
    [n, n2] = size(A);

    P = eye(n); % Matriz de permutación inicial
    L = eye(n); % Matriz triangular inferior inicial
    U = A;      % Inicializar U como A

    % Proceso de eliminación con pivoteo por columnas
    for k = 1:n-1
        % Encontrar el índice de la columna con el mayor valor absoluto en la fila k
        [~, max_row] = max(abs(U(k:n, k)));  % Mayor en la columna actual
        max_row = max_row + k - 1;

        % Intercambiar filas en U y P
        U([k, max_row], :) = U([max_row, k], :);
        P([k, max_row], :) = P([max_row, k], :);

        % Intercambiar filas en L (excepto las columnas superiores ya procesadas)
        if k > 1
            L([k, max_row], 1:k-1) = L([max_row, k], 1:k-1);
        end

        % Eliminación gaussiana
        for i = k+1:n
            L(i, k) = U(i, k) / U(k, k);
            U(i, k:n) = U(i, k:n) - L(i, k) * U(k, k:n);
        end
    end
end
