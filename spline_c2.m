function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)
	mat = zeros(4 * (length(x) - 1), 4 * (length(x) - 1));
	n = length(x) - 1;
	%initializez matricea  ce descrie ecuatiile
	
	% TOOD 1: si(xi) = yi, i = 0 : n - 1
	for i = 1 : n 
		mat(i,4*(i-1)+1) = 1;
	endfor

	% TODO 2: s_n-1(xn) = yn
	for i = 1 : 4
		mat(n+1,4*(n-1) + i) = (x(n+1) - x(n))^(i-1);
	endfor
	% TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
	
	for i = 1 : n-1
		for j = 1 : 4
			mat(n+1+i,4*(i-1) + j) = (x(i+1) - x(i))^(j-1);
			mat(n+1+i,4*i + j) = -(x(i+1) - x(i+1))^(j-1);
		endfor
	endfor


	% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1
	for i = 1 : n-1
		for j = 1 : 3
			mat(2*n+i,4*(i-1) + (j+1)) = (j) * (x(i+1) - x(i))^(j-1);
			mat(2*n+i,4*i + (j+1)) = -(j) * (x(i+1) - x(i+1))^(j-1);
		endfor
	endfor

	% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1
	for i = 1 : n-1
		for j = 1 : 2
			mat(3*n-1+i,4*(i-1) + (j+2)) = (j*(j+1)) * (x(i+1) - x(i))^(j-1);
			mat(3*n-1+i,4*i + (j+2)) = -(j*(j+1)) * (x(i+1) - x(i+1))^(j-1);
		endfor
	endfor

	% TODO 6: s0''(x0) = 0

	mat(4*n-1,3) = 2;

	% TODO 7: s_n-1''(x_n) = 0

	mat(4*n,4*(n-1)+3) = 2;
	mat(4*n,4*(n-1)+4) = 6*(x(n+1) - x(n));

	% Solve the system of equations
	 y_nou = [y, zeros(1, 3*n - 1)];
	 mat_inv = inv(mat);
	 coef = mat_inv * y_nou';

end
