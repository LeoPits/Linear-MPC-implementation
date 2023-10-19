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
as $(X(j), U(j), Y (j))$ the state, inputs and outputs of the
plant, we have that $x(j) = X(j) − X_0$, $u(j) = U(j) − U_0$
and $y(j) = Y (j) − Y_0$.





The objective is to implement an MPC control law $U(j) =
\kappa(X(j), R)$ such that the controlled system is asymptotically
stable and the controlled variables $Y (j)$ converge to the
reference $R$ if this is reachable.
For a given state of the prediction model $x = X−X_0$ and a
reference $r = R −Y_0$, the MPC control law is derived from
the online solution of the following optimization control
problem:

$$
\begin{align}
    V_{\text{N}}(x,y_{sp};\mathbf{u})&= \sum_{j=0}^{N-1}\parallel x(j)-x_r\parallel_{Q}^{2}  + \parallel u(j)-u_r\parallel_{R}^{2}  + \parallel x(N)-x_{r}\parallel_{P}^{2} \\
    s.t.& \quad x(j+1)=Ax(j)+Bu(j),\\
     & \quad x(0)=x, \\
     & \quad  u_{min} \leq u_{s} \leq u_{max}, \\
     & \quad (x_r,u_r)=M_r, \\
      & \quad  x(N)  =0 
\end{align}
$$


where $M$ is a suitable matrix that maps the steady state and input given by the reference. Once a solution $u^∗(x, r)$
is obtained, the control law is calculated by the receding horizon technique as follows $\kappa_N (x, r) = u∗(0; x, r)$. The
control law implemented in the real plant will be $U(k) =\kappa_N (X(j) − X_O, R − Y_0) + U_0$.

## Lifted System Dynamics
the notation of a lifted system dynamics

$$
\mathbf{x}=G_x x_k + G_u \mathbf{u}
$$


## Quadratic Program

The implementation with the MATLAB built-in functions quadprog is shown here.

$$
\begin{align}
    \underset{\mathbf{u}}{\min}V_{N}(x,x_{r};\mathbf{u}) = \mathbf{u}^T(G_u  Q  G_u + R )\mathbf{u} + 2(  x_{ k}^{T}  G_{x}^{T}  Q  G_u)\mathbf{u}-2( x_{ R}^{T}  Q  G_u - u_{R}^{T}  R )\mathbf{u}\\
\end{align}
$$


$$
\begin{align}
    \underset{\mathbf{u}}{\min}V_{N}(x,x_{r};\mathbf{u}) = \mathbf{u}^T H \mathbf{u} + 2F_1\mathbf{u}-2F_2\mathbf{u}\\
\end{align}
$$    
