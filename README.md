# MPC-water-tank-implemention
A linear quadratic model predictive controller (MPC) to control a model of a quadruple-tank process simulated in Matlab/Simulink.

$$
\begin{align}
    x^+&=Ax+Bu   \\  
    y&=Cx+Du 
\end{align}
$$

define optimization problem 



$$
\begin{align}
    V_{\text{N}}(x,y_{sp})&= \sum_{j=0}^{N-1}\parallel x(j)-x_{s}\parallel_{Q}^{2}  + \parallel u(j)-u_{s}\parallel_{R}^{2}  + \parallel x(N)-x_{s}\parallel_{P}^{2}  + \parallel y(s)-y_{sp}\parallel_{K}^{2}   \\
    s.t.& \quad x(j+1)=Ax(j)+Bu(j),\\
     & \quad x(0)=x, \\
     & \quad x_{s},u_{s}  \in \mathcal{X} ,\mathcal{U} \\
     & \quad  x(N)  =0 
\end{align}
$$

