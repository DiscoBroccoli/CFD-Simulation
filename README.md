# CFD-Simulation

This repo contains a few example of computational fluid dynamics videos and their code written by Jie on MATLAB - except for the 2D incompressible cylinder (PyFR).

* Isentropic Vortex
* Multidimensional Heat Diffusion
* Lid-Driven Square Cavity Flow
* 2D Incompressible Cylinder

## Isentropic Vortex - 2D Euler Solver
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

source: [Spiegel, Seth & Huynh, H.T. & DeBonis, James. (2015). A Survey of the Isentropic Euler Vortex Problem using High-Order Methods. 10.2514/6.2015-2444. ]

## Lid-Driven Cavity Flow - 2D Navier-Stokes Solver

The square lid-driven cavityis a widely used canonical simulation to validate numerical methods. The simulation works as the following, it has no-slip condition on each wall except the lid. Which has a constant velocity component, as shown on the schematic.

<p align="center">
<img src="https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Lid%20Driven%20Cavity%20Flow/chrome_mfqAZ0VdbW.png">
</p>

The numerical method did not change but now we need to take into the viscous effect into consideration. In essence, this will result in a intermediate computation for each time step.

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/F_Flux.gif)

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/G_flux.gif)

The inviscid part is the contribution from Euler equations, refer to the Isotropic Vortex section. The viscous effect fluxes are:

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/Conserved_Fv.gif)

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/Conserved_Gv.gif)

The new term are the heat flux and shearing stresses.

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/q_flux.gif)

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/tau_xx.gif)

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/tau_xy.gif)

![Alt Text](https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Latex_Equation/tau_yy.gif)

Similarly to before, for every derivative we use the central scheme to approximate it. The final result:

<p align="center">
<img src="https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Lid%20Driven%20Cavity%20Flow/cavity-lid.gif">
</p>

To validate, the result have been compared with values from Ghia[2009].
<p align="center">
<img src="https://github.com/DiscoBroccoli/CFD-Simulation/blob/main/Lid%20Driven%20Cavity%20Flow/Validation_Ghia.png">
</p>

source: [Marchi, Carlos & Suero, Roberta & Araki, Luciano. (2009). The Lid-Driven Square Cavity Flow: Numerical Solution with a 1024 x 1024 Grid. Journal of The Brazilian Society of Mechanical Sciences and Engineering - J BRAZ SOC MECH SCI ENG. 31. 10.1590/S1678-58782009000300004. ]

If you have any general inquiries feel free to reach me, jiebao995@gmail.com .



