function [rot, omega] = attitude_planner(desired_state, params)

% Input parameters
%
%   desired_state: The desired states are:
%   desired_state.pos = [x; y; z], 
%   desired_state.vel = [x_dot; y_dot; z_dot],
%   desired_state.rot = [phi; theta; psi], 
%   desired_state.omega = [phidot; thetadot; psidot]
%   desired_state.acc = [xdotdot; ydotdot; zdotdot];
%
%   params: Quadcopter parameters
%
% Output parameters
%
%   rot: will be stored as desired_state.rot = [phi; theta; psi], 
%
%   omega: will be stored as desired_state.omega = [phidot; thetadot; psidot]
%
%************  ATTITUDE PLANNER ************************
% 
% 
% 
acc_x_des = desired_state.acc(1);
acc_y_des = desired_state.acc(2);
psi_des = desired_state.rot(3);
psi_des_om = desired_state.omega(3);
g = params.gravity;

rot(1:2, 1) = ([sin(psi_des) -cos(psi_des); cos(psi_des) sin(psi_des)] * [acc_x_des; acc_y_des]) / g;
rot(3) = psi_des;
%rot = [phi_des; theta_des; psi_des];
R_dot = [cos(psi_des) sin(psi_des); - sin(psi_des) cos(psi_des)];
omega(1:2,1) = (R_dot *[acc_x_des * psi_des_om; acc_y_des * psi_des_om])/ g;
omega(3) = psi_des_om;

end

