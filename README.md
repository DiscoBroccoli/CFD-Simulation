# CFD-Simulation

This repo contains a few example of computational fluid dynamics videos and their code written written by Jie on MATLAB - except for the 2D incompressible cylinder (PyFR).

* Isentropic Vortex
* Multidimensional Heat Diffusion
* Lid-Driven Square Cavity Flow
* 2D Incompressible Cylinder

## Isentropic Vortex
<p align="center">
<img src="https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Isentropic%20Vortex/Isentropic_Vortex2.gif">
</p>
  
For this simulation, a periodic domain of length Lx = Ly = 20 is created. The Euler Solver make use of the 2nd central finite difference scheme in space and the 4th Runge-Kutta method in time. The final time is t =20. The Euler set of fluid equation are quasilinear hyperbolic equations governing adiabatic and inviscid flow. The distinction between the Euler set and the infamous Navier-Stockes equations is the neglection of the viscosity within the fluid.

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/rho.gif)

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/u.gif)

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/v.gif)

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/p.gif)

The current vortex strength is set to R = 1.5, Mach number is 0.4 and the characteristic radius gamma is 1.4. For more information you can consult [here](https://www.researchgate.net/publication/299645119_A_Survey_of_the_Isentropic_Euler_Vortex_Problem_using_High-Order_Methods).

source: [Spiegel, Seth & Huynh, H.T. & DeBonis, James. (2015). A Survey of the Isentropic Euler Vortex Problem using High-Order Methods. 10.2514/6.2015-2444. ]
