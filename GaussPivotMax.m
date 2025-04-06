function [U, P, Q, L] = GaussPivotMax(U, P, Q, L, k)
    % Realiza el pivotaje completo en la matriz U.
    % Entradas:
    %   U: Matriz actual de trabajo.
    %   P: Matriz de permutación de filas.
    %   Q: Matriz de permutación de columnas.
    %   L: Matriz triangular inferior parcial.
    %   k: Paso actual en el algoritmo.
    % Salidas:
    %   U: Matriz U con las filas y columnas permutadas.
    %   P: Matriz de permutación de filas actualizada.
    %   Q: Matriz de permutación de columnas actualizada.
    %   L: Matriz triangular inferior actualizada.

    n = size(U, 1);

    % Encontrar el índice del valor máximo en la submatriz U(k:n, k:n)
    [max_val, row_index] = max(abs(U(k:n, k:n)), [], 1); % Máximos por columna
    [~, col_index] = max(max_val); % Columna con el máximo global
    row_index = row_index(col_index) + k - 1; % Índice de fila en la matriz original
    col_index = col_index + k - 1; % Índice de columna en la matriz original

    % Intercambiar filas en U, P y L (hasta la columna k-1)
    if row_index ~= k
        % Intercambiar filas en U
        U([k, row_index], :) = U([row_index, k], :);

        % Intercambiar filas en P
        P([k, row_index], :) = P([row_index, k], :);

        % Intercambiar filas en L (solo hasta la columna k-1)
        if k > 1
            L([k, row_index], 1:k-1) = L([row_index, k], 1:k-1);
        end
    end

    % Intercambiar columnas en U y Q
    if col_index ~= k
        % Intercambiar columnas en U
        U(:, [k, col_index]) = U(:, [col_index, k]);

        % Intercambiar columnas en Q
        Q(:, [k, col_index]) = Q(:, [col_index, k]);

        % Intercambiar columnas en L (solo hasta la fila k-1)
        if k > 1
            L(1:k-1, [k, col_index]) = L(1:k-1, [col_index, k]);
        end
    end
end

