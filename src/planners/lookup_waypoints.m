function [waypoints, waypoint_times] = lookup_waypoints(question)
%
% Input parameters
%
%   question: which question of the project we are on 
%      Possible arguments for question: 2, 3, 5, etc
%
% Output parameters
%
%   waypoints: of the form [x; y; z; yaw]
% 
%   waypoint_times: [1 x n] vector of times where n is the number of waypoings, 
%   represents the seconds you should be at each respective waypoint
%
%************ LOOKUP WAYPOINTS ************************
if question == 2
    waypoints = [0 0.1 0.2 0.3; 
                 0 0 0 0; 
                 0.5 0.5 0.5 0.5; 
                 0 0 0 0];
    waypoint_times = [0 2 4 6];
elseif question == 3
    z_axis = [0.01:0.01:1, 0.99:-0.01:0]; 
    disp(size(z_axis));
    disp(size(zeros(1,200)));
    waypoints = [zeros(1,200); zeros(1,200); [0.01:0.01:1, 0.99:-0.01:0]; zeros(1,200)];
    waypoint_times = [linspace(0,10,200)];
elseif question == 4.2
%takeoff
    waypoints =  [0 0 0 0 0; 0 0 0 0 0; .2 .4 .6 .8 1; 0 0 0 0 0];
    waypoint_times = [0 1 2 3 4];
elseif question == 4.3 || question == 4.5
% hover
    waypoints = [0 0 0 0 0; 0 0 0 0 0; 1 1 1 1 1; 0 0 0 0 0];
    waypoint_times = [5 6 7 8 9];

elseif question == 4.4
% track to (x, y z) = (2m, 1m, 2m) then go back
     waypoints = [0.04:0.04:2 1.96:-0.04:0; 0.02:0.02:1 0.98:-0.02:0;1.02:0.02:2 1.98:-0.02:1; zeros(1, 100) ]; 
    waypoint_times = [linspace(0, 10, 100)];   

% elseif question == 4.5
% % hover again
%     waypoints = [1 1 1 1 1; 1 1 1 1 1; 1 1 1 1 1; 0 0 0 0 0];
%     waypoint_times = [11 12 13 14 15];
% 
elseif question == 4.6
%land 
    waypoints = [0 0 0 0 0; 0 0 0 0 0; 0 0 0 0 0; 0 0 0 0 0];
    waypoint_times = [16 17 16 19 20];
elseif question == 51 || question == 52
    v = .1;
    g = deg2rad(15);
    waypoints = [
        zeros(1,31);
        zeros(1,31);
        [0.01:0.01:.1, repelem(v,10),0.1:-0.01:0];
        %disp(size([0.01:0.01:.1, repelem(v,9),0.09:-0.01:0]))
        %disp(size(zeros(1,300)))
        repelem(g,31);
        ];
    waypoint_times = [linspace(1,1,31)];

end 
end
