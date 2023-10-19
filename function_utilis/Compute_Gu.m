function Gu = Compute_Gu(A,B,N)
   zeri = zeros(size(B));
   Gu = [zeros(size(B)); B];

   for i = 1:N-1

        last_row = [];
        for k = i:-1:1
            last_row = [last_row, A^k*B];
        end
        Gu = [Gu;last_row];

        zeri = [zeros(size(B)); zeri];
        Gu = [Gu, [zeri;B]];

   end
