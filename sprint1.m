A = [0.9692 0 -0.0207 0; 0 0.9652 0 -0.0204; 0 0 0.9789 0; 0 0 0 0.9792];B = [0.0068 -0.0001;     -0.0001 0.0091;     0 0.0137; 0.0137 0];C = [eye(2,2),zeros(2,2)];D = zeros(2,2);q = 100*eye(size(A,1))[n,m] = size(B);r = eye(m)[~,P] = dlqr(A,B,q,r)T_s = 15;sys = ss(A,B,C,D,T_s)% passi di predizioneN = 5;% stato iniziale x_0 = [0.4 0.8 0.5 0.4]'x_eq = [0.6270 0.6360 0.6520 0.6330]'u_eq = [1.6429 2]'% studio [x_eq,u_eq]M = null([eye(n)-A, -B]) % riferimentorif1 = [0.1,0.15]'dxu_r = M*rif1dx_r = dxu_r(1:4)du_r = dxu_r(5:6)x_r = dx_r + x_equ_r = du_r + u_eqX_r = getXr(dx_r,N)U_r = getXr(du_r,N-1)% u_min, u_maxu_min = [0 0]' - u_eq;u_max = [3.26 4]' - u_eq;U_min = getXr(u_min,N-1);U_max = getXr(u_max,N-1);%%%Calcolo GxGx = calcolaGx(A,N)Gu = calcolaGu(A,B,N)%Calcolo QQ = getQ(q,P,N)%Calcolo RR = getR(r,N)%Definisco H, e F2H = 2*(Gu' * Q * Gu + R)% F1 = 2*x_0'*Gx'*Q*GuF2 = -2*X_r'*Q*Gu-2*U_r'*R%SimulazioneT_max = 200;x = zeros(n,T_max);u = zeros(m,T_max);dx = zeros(n,T_max);du = zeros(m,T_max);x(:,1) = x_0;dx(:,1) = x_0 - x_eq;%%for k = 1:T_max         if k == 100        x_rif1 = x_r;        u_rif1 = u_r;        rif2 = [0.75,0.5]'        dxu_r = M*rif2;                dx_r = dxu_r(1:4);        du_r = dxu_r(5:6);                x_r = dx_r + x_eq;        u_r = du_r + u_eq;        x_rif2 = x_r;        u_rif2 = u_r;                X_r = getXr(dx_r,N);        U_r = getXr(du_r,N-1);        F2 = -2*X_r'*Q*Gu-2*U_r'*R;    end        F1 = 2*dx(:,k)'*Gx'*Q*Gu;    U = quadprog(H,F1+F2,[],[],[],[],U_min,U_max);    du(:,k) = U(1:m);        dx(:,k+1) = A*dx(:,k) + B*du(:,k);    x(:,k+1) = dx(:,k+1) + x_eq;    u(:,k) = du(:,k) + u_eq;    y(:,k) = C*x(:,k);        end%%%Plotfigure plot([0:T_max],x(1,:),'r')hold onplot([0:T_max],x(2,:),'g')plot([0:T_max],x(3,:),'b')plot([0:T_max],x(4,:),'Color','magenta')plot([0:T_max],x_rif1(1)*ones(T_max+1),'r-.')plot([0:T_max],x_rif1(2)*ones(T_max+1),'g-.')plot([0:T_max],x_rif1(3)*ones(T_max+1),'b-.')plot([0:T_max],x_rif1(4)*ones(T_max+1),'Color','magenta','LineStyle','-.')plot([0:T_max],x_rif2(1)*ones(T_max+1),'r-.')plot([0:T_max],x_rif2(2)*ones(T_max+1),'g-.')plot([0:T_max],x_rif2(3)*ones(T_max+1),'b-.')plot([0:T_max],x_rif2(4)*ones(T_max+1),'Color','magenta','LineStyle','-.')figure plot([0:T_max-1],u(1,:),'r')hold onplot([0:T_max-1],u(2,:),'g')