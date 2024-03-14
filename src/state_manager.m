function [] = state_manager(question)

if question == 4
    total_asm = ones(15, 1);
    total_adm = ones(15, 1);
    total_tv = 0
    disp("Question 4 sequence")
    goals = [4.2, 4.3, 4.4, 4.5, 4.6];
    matrix = 0:0.005:0.005*10005
    %goaltimes = [0 5 10 15 20];


for i = 1:length(goals)
    %main(goals(i));
    [act_state_matrix, act_des_matrix, timev] = state_main(goals(i));
    %disp(timev);
    %pause(10);
    total_asm = [total_asm, act_state_matrix];
    total_adm = [total_adm, act_des_matrix];
    total_tv = [total_tv];
    % 
    disp(size(total_asm)) 
    disp(size(total_adm))
    disp(size(total_tv))
    % Pause for the goal time duration

end 
  disp(size(total_asm)) 
  disp(total_asm(1))
  disp(size(total_adm))
  disp(size(matrix))
% 
plot_quadrotor_errors(total_asm, total_adm, matrix);

end
