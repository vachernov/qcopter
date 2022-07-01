%% Setup

%% Plant params
% general

g = 9.81;

% Inertias

m = 1;

I_xx = 0.04989;
I_yy = 0.04989;
I_zz = 0.24057;

% Geometry

b = 0.6;
l = 0.6;
d = 0.3;

% Calulations

I = [[I_xx,   0,     0]; 
     [0,    I_yy,    0];
     [0,      0,  I_zz]];
 
Xi = [[(I_yy - I_xx)/I_zz,          0,                          0]; 
      [0,                  (I_zz - I_xx)/I_yy,                  0];
      [0,                           0,         (I_xx - I_yy)/I_zz]]; 
  
C_DIM = [[b,  0,  0,  0];
         [0, b*l, 0,  0];
         [0,  0, b*l, 0];
         [0,  0,  0,  d]];
     
FB =    [[ 1,  1,  1, 1];    
         [ 0, -1,  0, 1];
         [-1,  0,  1, 0];
         [-1,  1, -1, 1]];

M2B = C_DIM*FB;    % [ Ω_1^2, Ω_2^2, Ω_3^2, Ω_4^2 ]^T ---> [ f_t, \tau_x, \tau_y, \tau_z ]^T

M2B_INV = inv(M2B);
 
%% Controller

k_1 = -1;
k_2 = -1;

P_q = -5; % 3
P_w =  8; % 20

% P_q = -5; P_w = 20;

% [0.7071, 0, 0, 0.7071]
% [1, 0, 0, 0]
% [0.9988, 0.05, 0, 0]