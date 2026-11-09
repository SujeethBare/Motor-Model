# EV Traction Motor & Regenerative Braking Model

MATLAB/Simulink model of an electric vehicle (Nissan Leaf class) traction motor in **motoring** and **regenerative braking** modes, used to estimate regen power and the vehicle's **range with and without regeneration** over the **UDDS** drive cycle.

---

## Aim

- Model the traction motor's operating region (constant torque and field weakening) and its behaviour in motoring and regen modes
- Estimate regenerative energy recovery, within motor and battery limits, and its effect on vehicle range

---

## Approach

### 1. Motor characterisation
- Stall, nominal and peak torque, and nominal and peak speed, calculated from motor datasheet data
- Peak and continuous torque–speed curves, including the **field weakening** (constant power) region
- Motor and motor-controller **efficiency maps** for both motoring and regenerative modes

### 2. Regenerative braking model
- Braking demand split between **friction** and **regenerative** braking using a regen braking fraction
- **Regen control logic** that limits recovery based on motor torque/speed limits and the regenerative limits of the cell and battery pack
- Motor regen power, current, voltage and torque estimated at every time step

### 3. Drive cycle simulation and range
- Forward-facing Simulink powertrain model simulated on **UDDS**
- Motor operating points plotted in **motoring and regen** regions
- Battery energy consumption and range compared **with and without regeneration**

---

## Repository guide

| File | What it does |
|---|---|
| `Imports.m` | Vehicle parameters and all required data: motor characteristics, efficiency maps, cell data and drive cycle |
| `Powertrain.slx` | Simulink powertrain model with motor, regen control logic and battery |
| `Visualisation_Post.m` | Post-processing: plots of motor operating points, regen power, current, voltage, torque and range |

**Data files** (loaded by `Imports.m`, keep them in the same folder):

| File | Contents |
|---|---|
| `Nissan Leaf Motor Characteristics` | Peak and continuous torque–speed curves |
| `Nissan Leaf Motor Efficiency` | Motor efficiency map (motoring) |
| `Motor Efficiency Data Less Points` | Reduced set of efficiency points for plotting |
| `Nissan Leaf Motor Controller Efficiency` | Motor controller (inverter) efficiency |
| `Motor Regenerative Efficiency` | Motor efficiency in regen mode |
| `Motor Controller Regenerative Efficiency` | Controller efficiency in regen mode |
| `Cell Data` | Battery cell data |
| `UDDS` / `UDDS_Continous` | UDDS drive cycle (single and continuous runs) |

---

## How to run

Open MATLAB and set the repository folder as the current folder.

1. Run `Imports.m`
2. Run `Powertrain.slx`
3. Run `Visualisation_Post.m` to generate the plots

---

## Note
I have tried to add comments wherever the code might be ambiguous, though not everywhere.
