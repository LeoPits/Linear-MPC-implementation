# MPC-water-tank-implemention

This tutorial shows an implementation of  a linear quadratic model predictive controller (MPC) to control a quadruple-tank model,  simulated in Matlab/Simulink.
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
point given by the triplet $(x_0, u_0, y_0)$. Therefore, denoting
as $(x(j), u(j), y (j))$ the state, inputs and outputs of the
plant, we have that $x(j) = x(j) − x_0$, $u(j) = u(j) − u_0$
and $y(j) = y (j) − y_0$.





The objective is to implement an MPC control law $U(j) =
\kappa(x(j), R)$ such that the controlled system is asymptotically
stable and the controlled variables $y (j)$ converge to the
reference $R$ if this is reachable.
For a given state of the prediction model $x = x−x_0$ and a
reference $r = R −y_0$, the MPC control law is derived from
the online solution of the following optimization control
problem:

$$
\begin{align}
    V_{\text{N}}(x,y_{sp};\mathbf{u})&= \sum_{j=0}^{N-1}\parallel x(j)-x_r\parallel_{Q}^{2}  + \parallel u(j)-u_r\parallel_{R}^{2}  + \parallel x(N)-x_{r}\parallel_{P}^{2} \\
    s.t.& \quad x(j+1)=Ax(j)+Bu(j),\\
     & \quad x(0)=x, \\
     & \quad  u_{min} \leq u \leq u_{max}, \\
     & \quad (x_r,u_r)=M_r, \\
      & \quad  x(N)  =0 
\end{align}
$$


where $M$ is a suitable matrix that maps the steady state and input given by the reference. Once a solution $u^{∗}(x, r)$
is obtained, the control law is calculated by the receding horizon technique as follows $\kappa_N (x, r) = u^{*} (0; x, r)$. The
control law implemented in the real plant will be $u(k) =\kappa_N (x(j) − x_O, R − y_0) + u_0$.

## Lifted System Dynamics
the notation of a lifted system dynamics

$$
\mathbf{x}=G_x x(j) + G_u \mathbf{u}
$$

is used, where the whole state sequence can be determined with the aid of the input sequence $\mathbf{u}$ for a given initial state $x(j)$. The state sequence and the input sequence are 

$$
\mathbf{x}=\left[\begin{array}{c}
x_{0}\\
x_{1}\\
\vdots\\
x_{N}
\end{array}\right],u=\left[\begin{array}{c}
u_{0}\\
u_{1}\\
\vdots\\
u_{N-1}
\end{array}\right]
$$

The lifted system matrix and the lifted input matrix are

$$
G_{x}=\left[\begin{array}{c}
I\\
A\\
A^{2}\\
\vdots\\
A^{N}
\end{array}\right],G_{u}=\left[\begin{array}{cccc}
0 & 0 & \cdots & 0\\
B & 0 & \cdots & 0\\
AB & B & \cdots & 0\\
\vdots & \vdots & \vdots & \vdots\\
A^{N-1}B & A^{N-2}B & \cdots & B
\end{array}\right]
$$

## Quadratic Program

The implementation with the MATLAB built-in functions quadprog is shown here.

$$
\begin{align}
    \underset{\mathbf{u}}{\min}V_{N}(x,x_{r};\mathbf{u}) &= (\mathbf{x}-\mathbf{x_r})^TQ(\mathbf{x}-\mathbf{x_r})+  (\mathbf{u}-\mathbf{u}_r)^TR(\mathbf{u}-\mathbf{u}_r)\\
s.t.& \quad \mathbf{x}=G_xx(j)+G_u\mathbf{u},\\
  &\quad \widetilde{G}\mathbf{u} \leq \widetilde{g} 
\end{align}
$$



$$
\begin{align}
    \underset{\mathbf{u}}{\min}V_{N}(x,x_{r};\mathbf{u})& = \mathbf{u}^T(G_u  Q  G_u + R )\mathbf{u} + 2(  x(j)^{T}  G_{x}^{T}  Q  G_u)\mathbf{u}-2( x_{ R}^{T}  Q  G_u - \mathbf{u_{r}}^{T}  R )\mathbf{u}\\
    s.t.& \quad \mathbf{x}=G_xx(j)+G_u\mathbf{u},\\
  &\quad \widetilde{G}\mathbf{u} \leq \widetilde{g} 
\end{align}
$$


$$ 
\begin{align}
    \underset{\mathbf{u}}{\min}V_{N}(x,x_{r};\mathbf{u}) &= \mathbf{u}^T H \mathbf{u} + 2(F_1-F_2)\mathbf{u}\\
    s.t.& \quad \mathbf{x}=G_xx(j)+G_u\mathbf{u},\\
  &\quad \widetilde{G}\mathbf{u} \leq \widetilde{g} 
\end{align}
$$    


## Results
![My Image](img/result_tracking.png)
