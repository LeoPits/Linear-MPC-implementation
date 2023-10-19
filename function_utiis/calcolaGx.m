function Gx = calcolaGx(A,N)
    Gx = [A^0];
    for i = 1:N
        Gx = [Gx;A^i];
    end
