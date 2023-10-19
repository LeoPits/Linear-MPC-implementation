# MPC-water-tank-implemention
A linear quadratic model predictive controller (MPC) to control a model of a quadruple-tank process simulated in Matlab/Simulink.

$$
\begin{align}
    x^+&=Ax+Bu   \\  
    y&=Cx+Du 
\end{align}
$$

define MPC optimization problem
$$
\begin{align}
    V_{\text{\tiny\itshape N}}^{\text{\tiny\itshape O}}(x,y_{t})&= \underset{\mathbf{u},x_{s},u_{s}}{\min}V_{N}(x,y_{r};\mathbf{u},x_{s},y_{s})  \\
\end{align}
$$

