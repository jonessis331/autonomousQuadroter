function [state_dot] = dynamics(params, state, F, M, rpm_motor_dot)
% Input parameters
% 
%   state: current state, will be using ode45 to update
%
%   F, M: actual force and moment from motor model
%
%   rpm_motor_dot: actual change in RPM from motor model
% 
%   params: Quadcopter parameters
%
%   question: Question number
%
% Output parameters
%
%   state_dot: change in state
%
%************  DYNAMICS ************************

mass = params.mass;
g = params.gravity;
J = params.inertia;
theta = state(7);
phi = state(8);
theta_dot = state(10, 1);
phi_dot = state(11, 1);
psi_dot = state(12, 1);

R = eul2rotm(state(7:9)',"XYZ");

dx = state(4:6);
state_dot(1:3) = dx;

ddx = (R * [0; 0; F]) / mass - [0; 0; g];
state_dot(4:6) = ddx;
dw = state(10:12);
state_dot(7:9) = dw;

w = [cos(theta) 0 (-cos(phi)*sin(theta)); 0 1 sin(phi); sin(phi) 0 (cos(phi)*cos(theta))];
w = w * [theta_dot; phi_dot; psi_dot];

ddw = J \ (M - cross(w, J * w));
state_dot(10:12) = ddw;

state_dot(13:16) = rpm_motor_dot;

state_dot = state_dot';

end