clear all;
clc;
close all;
%intial conditions (at t=0 sec):
ia_0=0;
ib_0=0;
omega_0=0;
theta_0=0;
iab_0=[ia_0;ib_0];

% PMSM parameters an simulation parameters:
A=136;
W=74;
R=6.25;
L=0.03;
Jm=0.00027;
lamda_m= 0.3200;
np=5;
TL1=0.151;
B=0;
V=2;

%Calculation of current controllers parameters
Tsi=0.003;
Kpi=3*L/Tsi;
Kii=Kpi*R/L;

%Calculation of speed controller parameters
Tsw=10*Tsi;
Overshoot=0.1;
xi=sqrt(log(Overshoot)^2/(pi^2+log(Overshoot)^2));
wn=4/(xi*Tsw);
Kiw=Jm*wn^2;
Kpw=2*xi*Jm*wn-B;