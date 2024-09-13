function [x, y] = parse_data(filename)
    % file input format:
    % n
    % x0 x1 ... xn
    % y0 y1 ... yn

    % TODO 1: Open the file for reading
    fid = fopen(filename, 'r');
    n = fscanf(fid, '%d',1);
    x = zeros(1, n+1);
    y = zeros(1, n+1);
    for i = 1:n+1
        x(i) = fscanf(fid, '%d',1);
    end
    for i = 1:n+1
        y(i) = fscanf(fid, '%d',1);
    end
    fclose(fid);


    % TODO 2: Read n, x, y from the file

    % TODO 3: Close the file
end