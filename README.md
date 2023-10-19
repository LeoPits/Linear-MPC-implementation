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
    V_(x,y_{sp})&= \underset{\mathbf{u},x_{s},u_{s}}{\min}V_{N}(x,y_{r};\mathbf{u},x_{s},y_{s})  \\
    s.t.& \quad x(j+1)=Ax(j)+Bu(j),\\
     & \quad x(0)=x, \\
     & \quad x_{s},u_{s}  \in \mathcal{X} ,\mathcal{U} \\
     & \quad  x(N)  =0 
\end{align}
$$

