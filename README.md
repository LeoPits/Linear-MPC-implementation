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
    s.t.& \quad x(j+1)=Ax(j)+Bu(j), \label{eq:MPC_artificial_opti_problem_a}\\
     & \quad x(0)=x \label{eq:MPC_artificial_opti_problem_b} \\
     & \quad x(j),u(j)    \in \mathcal{X},\mathcal{U} \label{eq:MPC_artificial_opti_problem_c}\\
     & \quad x_{s}=Ax_{s}+Bu_{s}, \label{eq:MPC_artificial_opti_problem_e} \\
     & \quad y_{s}=C_{s}x_{s}+Du_{s},\label{eq:MPC_artificial_opti_problem_f} \\
     & \quad x_{s},u_{s}  \in \mathcal{X} ,\mathcal{U} \label{eq:MPC_artificial_opti_problem_g}\\
     & \quad \left(  x(N),x_{s},u_{s} \right) \in \mathbb{X}_{f} \label{eq:MPC_artificial_opti_problem_i}
\end{align}
$$

