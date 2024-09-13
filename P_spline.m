function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients
	n = length(x) - 1;
	y_interp = zeros(1, length(x_interp));
	for i = 1 : length(x_interp)
		for j = 1 : n
			%caut in vectorul x un interval in care se afla x_interp(i)
			if x_interp(i) >= x(j) && x_interp(i) <= x(j+1)
				coef_mat = [coef(4*(j-1)+1), coef(4*(j-1)+2), coef(4*(j-1)+3), coef(4*(j-1)+4)];
				X = [1, x_interp(i) - x(j), (x_interp(i) - x(j))^2, (x_interp(i) - x(j))^3];
				y_interp(i) = X * coef_mat';
				%dupa ce am gasit intevalul, iau coefientii aferenti si calculez valoarea functiei spline in y_interp(i)
			endif
		endfor
	endfor
endfunction
