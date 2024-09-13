function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % TODO: Calculate the Vandermonde coefficients
    n = length(x) -1;
    A = zeros(n+1, n+1);
    for i = 1 : n+1
        for j = 1 : n + 1
            A(i,j) = x(i) ^ (j-1);
        endfor
    endfor
    inv_A = inv(A);
    coef = inv_A * y';
endfunction
