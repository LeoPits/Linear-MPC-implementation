function R = getR(r,N)
    zeri = [];
    R = [r];
    for i = 1:N-1
        zeri = [zeri, zeros(size(r))];
        R = [R, zeri'; zeri, r];
    end


