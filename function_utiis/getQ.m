function Q = getQ(q,p,N)
    
    zeri = zeros(size(q));
    Q = [q, zeri'; zeri q];

    for i = 3:N
        zeri = [zeri, zeros(size(q))];
        Q = [Q zeri'; zeri q];
    end
    
    zeri = [zeri, zeros(size(q))];
    Q = [Q zeri'; zeri p];
        

   