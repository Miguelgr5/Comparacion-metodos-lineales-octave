function A_invGauss = RefinamientoGauss(A)
    % Refinamiento para calcular la inversa de una matriz sin pivotaje.

    % Vector de entrada
    c = [0.9, 0.8, 0.7, 6, 5, 4, 3, 2, 1, 0.1];

    % Generar matriz de Vandermonde
    A = vander(c);

    % Dimensión de la matriz
    n = size(A, 1);

    % Factorización LU sin pivotaje
    [L, U] = factorizacionlu(A);

    % Inicializar la matriz inversa
    InvA1 = zeros(n);

    % Iterar para cada columna de la identidad (e_k)
    for k = 1:n
        % Vector columna de la identidad
        e_k = zeros(n, 1);
        e_k(k) = 1;

        % Paso ii-1: Resolver Ly = e_k (sin P)
        y = forwardsub(L, e_k);  % Resolver Ly = e_k usando sustitución hacia adelante
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
        A_invGauss(:, k) = x;
    end
end

function [L, U] = factorizacionlu(A)
    % Factorización LU de una matriz A sin pivoteo.
    % Devuelve L y U tales que A = LU.

    [n, ~] = size(A);
    L = eye(n); % Inicializar L como identidad
    U = A;      % Inicializar U como A

    for i = 1:n-1
        if U(i, i) == 0
            error('Elemento diagonal cero, no se puede realizar LU sin pivoteo.');
        end
        for j = i+1:n
            factor = U(j, i) / U(i, i);
            L(j, i) = factor;
            U(j, i:end) = U(j, i:end) - factor * U(i, i:end);
        end
    end
end


