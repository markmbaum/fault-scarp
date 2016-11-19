# fault-scarp.m

This repository contains MATLAB code that generates a GUI. The GUI is a tool for estimating the age of a fault scarp using the measured profile of the scarp. First, the scarp profile is loaded into the program from a delimited file, where the first column contains horizontal distances along the scarp and the second column contains corresponding height measurements. Next, the user selects a diffusion coefficient and makes some guesses at the age of the scarp. The first panel of the GUI, the control panel, is shown below.

![control-panel](img/control-panel.png)

After providing the measured profile, the diffusion coefficient, and age guesses, the user sets the initial scarp profile with draggable elements in the initial conditions panel. The initial profile is guessed, not directly measured. The guess is informed by the fact that normal fault planes tend to be near 60 degrees and measurements of the slope of the land surface far away from the actual slope. An initial profile is constructed to have the same far field slope as the land surface and to have a fault plane near 60 degrees, as shown below.

![IC-panel](img/IC-panel.png)

Finally, back in the control panel, the user clicks "RUN SOLVER" to obtain eroded scarp profiles at the input solution times. The solver uses the initial profile and the input diffusion coefficient to solve the 1D diffusion equation. The boundary conditions are set to maintain constant slope at the edges of the profile. The results panel shows the eroded profiles and prints root mean squared error for each solution. To refine the guesses the user goes back to the control panel and runs the solver for better targeted times until one of the solutions fits the observed profile reasonably well. The results panel is shown below.

![results-panel](img/results-panel.png)

There are some other bells and whistles, like the option to edit and save the input data and to save the results in several formats.
