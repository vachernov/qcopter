%% refs

https://hal.archives-ouvertes.fr/hal-01559296

%% quadrotor dynamics 
g = 9.81; % m/s^2

m = 0.408; % kg

J = [[0.177,   0,     0  ]; % inertia matrix
     [0,     0.177,   0  ];
     [0,       0,   0.354]]; 
 
 
M = [[ m*eye(3), zeros(3)];  % inertia (dynamics) matrix
     [ zeros(3),    J    ]];

M_inv = inv(M); 
 
G = [0, 0, m*g, 0, 0, 0]';   % gravitational vector

B = eye(6);                  % identity matrix 6x6

%% controller  

K_pt = diag([0.825, 0.825, 2]);
K_vt = diag([0.65, 0.65, 0.5]);

K_m  = [[ m*eye(3), zeros(3)];
        [ zeros(3),    J    ]];

K_pr = diag([6,6,6]);
K_vr = diag([0.5, 0.5, 1]);
K_E  = 0.05;

K_p = [[  K_pt,    zeros(3)];
       [zeros(3),    K_pr  ]];

K_v = [[  K_vt,    zeros(3)];
       [zeros(3),    K_vr  ]];

%% initial state

p_0 = [0, 0, 0];

theta_0 = [0, 0, 0];

xi_0 = [p_0, theta_0];