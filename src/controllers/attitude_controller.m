function [M] = attitude_controller(state,desired_state,params,question)

% Input parameters
% 
%   current_state: The current state of the robot with the following fields:
%   current_state.pos = [x; y; z], 
%   current_state.vel = [x_dot; y_dot; z_dot],
%   current_state.rot = [phi; theta; psi], 
%   current_state.omega = [phidot; thetadot; psidot]
%   current_state.rpm = [w1; w2; w3; w4];
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
%   question: Question number
%
% Output parameters
%
%   M: u2 or moment [M1; M2; M3]
%
%************  ATTITUDE CONTROLLER ************************

% Example PD gains

Kpphi = 190;
Kdphi = 30;

Kptheta = 198;
Kdtheta = 30;

Kppsi = 80;
Kdpsi = 17.88;
% 
% Kpphi = 130;
% Kdphi = 30;
% 
% Kptheta = 120;
% Kdtheta = 30;
% 
% Kppsi = 100;
% Kdpsi = 17.88;
if question == 51
    Kpphi = 190;
    Kdphi = 30;

    Kptheta = 190;
    Kdtheta = 30;

    Kppsi = 70;
    Kdpsi = 18;

elseif question == 52
    Kpphi = 190;
    Kdphi = 30;

    Kptheta = 190;
    Kdtheta = 30;

    Kppsi = 20;
    Kdpsi = 18;
end

J = params.inertia;

Kp = [Kpphi; Kptheta; Kppsi];
Kd = [Kdphi; Kdtheta; Kdpsi];

roterr =  state.rot - desired_state.rot;
rotdoterr = state.omega - desired_state.omega;

M =  J * (-Kp .* roterr - Kd .* rotdoterr);

end

