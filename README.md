# CFD-Simulation

This repo contains a few example of computational fluid dynamics videos and their code written by Jie on MATLAB - except for the 2D incompressible cylinder (PyFR).

* Isentropic Vortex
* Multidimensional Heat Diffusion
* Lid-Driven Square Cavity Flow
* 2D Incompressible Cylinder

## Isentropic Vortex
<p align="center">
<img src="https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Isentropic%20Vortex/Isentropic_Vortex2.gif">
</p>
  
The simulation marches in time in a periodic domain of length Lx = Ly = 20. The Euler Solver makes use of the 2nd central finite difference scheme in space and the 4th Runge-Kutta method in time. The final time is t =20. The Euler set of fluid equation are quasilinear hyperbolic equations, it governs the adiabatic and inviscid flow. The distinction between the Euler set and the infamous Navier-Stokes equations is the neglection of the viscosity within the fluid. This is an important assumptions once one wants to study the drag effect.

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/rho.gif)

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/u.gif)

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/v.gif)

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/p.gif)

The current vortex strength is set to R = 1.5, Mach number is 0.4 and the characteristic radius gamma is 1.4. For more information you can consult [here](https://www.researchgate.net/publication/299645119_A_Survey_of_the_Isentropic_Euler_Vortex_Problem_using_High-Order_Methods).

The conserved variable are stored as follows:

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/conservative_w.gif)

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/conservative_F.gif)

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/conservative_G.gif)

Once the field has been initialized, we can start marching the solution in time (RK4,4) with a central scheme.

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/Central_scheme.gif)

If you have any general inquiries feel free to reach me, jiebao995@gmail.com .

source: [Spiegel, Seth & Huynh, H.T. & DeBonis, James. (2015). A Survey of the Isentropic Euler Vortex Problem using High-Order Methods. 10.2514/6.2015-2444. ]
