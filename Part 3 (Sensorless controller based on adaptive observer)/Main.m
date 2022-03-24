clear all;
clc;
close all;
%Intial conditions (at t=0 sec):
ia_0=0;
ib_0=0;
omega_0=0;
theta_0=0;
iab_0=[ia_0;ib_0];

%PMSM parameters an simulation parameters:
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

%Observer parameters
alpha=1000;
Ts=0.000001;
gamma=0.1;
xi=0.2;
Wn=600;
KpPLL=2*xi*Wn*0.3;
KiPLL=Wn^2;
%Intial conditions for the observer (at t=0 sec):
eta1_est_0=0.8*lamda_m;
eta2_est_0=0;
Z1_0=[0;0];  % it is considered unknown (but needed to compute the real value of eta1 and eta2)
Z2_0=[0;0];  % it is considered unknown (but needed to compute the real value of eta1 and eta2)
eta_real=lamda_m*[cos(np*theta_0);sin(np*theta_0)]-Z1_0+L*iab_0+R*Z2_0;
