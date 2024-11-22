function[c,ceq]= constraints_Sys(x)
load('gprModel_sub11.mat', 'model_frst_optimal_soln_sub1');
load('gprModel_sub12.mat', 'model_second_optimal_soln_sub1');
load('gprModel_sub13.mat', 'model_third_optimal_soln_sub1');

load('gprModel_sub21.mat', 'model_frst_optimal_soln_sub2');
load('gprModel_sub22.mat', 'model_second_optimal_soln_sub2');
load('gprModel_sub23.mat', 'model_third_optimal_soln_sub2');
newData = [x(1),x(2),x(3)];

% Make predictions using the loaded model
sigma1 = predict(model_frst_optimal_soln_sub1, newData);
x2=predict(model_second_optimal_soln_sub1, newData);
x3=predict(model_third_optimal_soln_sub1, newData);

sigma2 = predict(model_frst_optimal_soln_sub2, newData);
x4=predict(model_second_optimal_soln_sub2, newData);
x5=predict(model_third_optimal_soln_sub2, newData);

%Sub_system_1_output=Sub_system_1_opt(x(1),x(2),x(3));
%Sub_system_2_output=Sub_system_2_opt(x(1),x(2),x(3));
%x2=Sub_system_1_output(2);
%x3=Sub_system_1_output(3);
%x4=Sub_system_2_output(2);
%x5=Sub_system_2_output(3);
%sigma1=Sub_system_1_output(1); %as sigma1* means that sub system er solution which is sigma1
%sigma2=Sub_system_2_output(1);

%x6=Sub_system_1_output(4);
%x7=Sub_system_2_output(4);

ceq(1)=0.5*(((sigma1-x(1)))^2+((sigma1^2+2*x2-x3+2*sqrt(x(3)))-x(2))^2);% xs is x(1) and t1 is x(2) and t2 is x(3)
ceq(2)=0.5*(((sigma2-x(1)))^2+((sigma2*x4+x4^2+x5+x(2))-x(3))^2);

%ceq(1)=x6;
%ceq(2)=x7;

c=[];
end