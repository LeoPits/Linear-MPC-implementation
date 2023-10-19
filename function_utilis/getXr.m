function X_r = getXr(x_r,N)
    X_r = [];
    for k = 1:N+1
        X_r = [X_r;x_r];
    end
