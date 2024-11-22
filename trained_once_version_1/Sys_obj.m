function f= Sys_obj(x)
global count_sys;
count_sys=count_sys+1;
%Sub_system_1_output=Sub_system_1_opt(x(1),x(2),x(3));
%Sub_system_2_output=Sub_system_2_opt(x(1),x(2),x(3));
%x2=Sub_system_1_output(2);
%x3=Sub_system_1_output(3);
%x4=Sub_system_2_output(2);
%x5=Sub_system_2_output(3);
%sigma1=Sub_system_1_output(1); %as sigma1* means that sub system er solution which is sigma1
%sigma2=Sub_system_2_output(1);


%load('gprModel_sub11.mat', 'model_frst_optimal_soln');
%load('gprModel_sub12.mat', 'model_second_optimal_soln');
%load('gprModel_sub13.mat', 'model_third_optimal_soln');

%load('gprModel_sub21.mat', 'model_frst_optimal_soln');
load('gprModel_sub22.mat', 'model_second_optimal_soln_sub2');
load('gprModel_sub23.mat', 'model_third_optimal_soln_sub2');
newData = [x(1),x(2),x(3)];

% Make predictions using the loaded model

x4=predict(model_second_optimal_soln_sub2, newData);
x5=predict(model_third_optimal_soln_sub2, newData);

f=(x(1))^0.5+x4+x5*(0.4*x(2));
end