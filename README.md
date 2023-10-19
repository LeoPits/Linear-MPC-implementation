# MPC-water-tank-implemention
A linear quadratic model predictive controller (MPC) to control a model of a quadruple-tank process simulated in Matlab/Simulink.
Consider that the plant to control is modeled as a linear time-invariant system given by


$$
\begin{align}
    x^+&=Ax+Bu   \\  
    y&=Cx+Du 
\end{align}
$$

where $x\in R^n$   his the current state of the system, $u  \in 	 R^m $ 
is the current input, $y 	\in 	 R^p$ is the controlled output and  $x^+$ 
the successor state.


This linear model is derived from the linearization of the model at an operation equilibrium
point given by the triplet $(X_0, U_0, Y_0)$. Therefore, denoting
as $(X(k), U(k), Y (k))$ the state, inputs and outputs of the
plant, we have that $x(k) = X(k) − X_0$, $u(k) = U(k) − U_0$
and $y(k) = Y (k) − Y_0$.





The objective is to implement an MPC control law $U(k) =
\kappa(X(k), R)$ such that the controlled system is asymptotically
stable and the controlled variables $Y (k)$ converge to the
reference $R$ if this is reachable.
For a given state of the prediction model $x = X−X_0$ and a
reference $r = R −Y_0$, the MPC control law is derived from
the online solution of the following optimization control
problem:

$$
\begin{align}
    V_{\text{N}}(x,y_{sp})&= \sum_{j=0}^{N-1}\parallel x(j)-x_r\parallel_{Q}^{2}  + \parallel u(j)-u_r\parallel_{R}^{2}  + \parallel x(N)-x_{r}\parallel_{P}^{2} \\
    s.t.& \quad x(j+1)=Ax(j)+Bu(j),\\
     & \quad x(0)=x, \\
     & \quad  u_{min} \leq u_{s} \leq u_{max}, \\
     & \quad (x_r,u_r)=M_r, \\
      & \quad  x(N)  =0 
\end{align}
$$

