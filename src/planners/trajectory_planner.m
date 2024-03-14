function trajectory_state = trajectory_planner(question, waypoints, max_iter, waypoint_times, time_step)

% Input parameters
% 
%   question: Which question we are on in the assignment
%
%   waypoints: Series of points in [x; y; z; yaw] format
%
%   max_iter: Number of time steps
%
%   waypoint_times: Time we should be at each waypoint
%
%   time_step: Length of one time_step
%
% Output parameters
%
%   trajectory_sate: [15 x max_iter] output trajectory as a matrix of states:
%   [x; y; z; xdot; ydot; zdot; phi; theta; psi; phidot; thetadot; psidot; xacc; yacc; zacc];
%
%************  TRAJECTORY PLANNER ************************

trajectory_state = zeros(15,max_iter);
% height of 15 for: [x; y; z; xdot; ydot; zdot; phi; theta; psi; phidot; thetadot; psidot; xacc; yacc; zacc];

current_waypoint_number = 1;
if question == 2 || question ~= 3
for iter = 1:max_iter
    if (current_waypoint_number<length(waypoint_times))
        if((iter*time_step)>waypoint_times(current_waypoint_number+1))
            current_waypoint_number = current_waypoint_number + 1;
        end
    end
        
    trajectory_state(1:3,iter) = waypoints(1:3,current_waypoint_number);
    trajectory_state(9,iter) = waypoints(4,current_waypoint_number);
    
end


elseif question == 3
    current_waypoint_number = 1;
    for iter = 1:max_iter
        if (current_waypoint_number < length(waypoint_times))
            if((iter * time_step) > waypoint_times(current_waypoint_number + 1))
                current_waypoint_number = current_waypoint_number + 1;
            end
        end
           
        trajectory_state(1:3, iter) = waypoints(1:3, current_waypoint_number);
        trajectory_state(9, iter) = waypoints(4, current_waypoint_number);
        if iter > 1
            delta_z = trajectory_state(3, iter) - trajectory_state(3, iter - 1);
            trajectory_state(6, iter) = delta_z / time_step;
        else
            trajectory_state(6, iter) = 0;
        end
    end
end



end
