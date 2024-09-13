function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1
	
	% TODO: Calcualte y_interp using the Vandermonde coefficients
	n = length(coef) - 1;
	y_interp = zeros(1, length(x_interp));
	for i = 1 : length(x_interp)
		X = zeros(1, n+1);
		for j = 1 : n+1
			X(j) = x_interp(i) ^ (j-1);
		endfor
		y_interp(i) = X * coef;
	endfor
end
