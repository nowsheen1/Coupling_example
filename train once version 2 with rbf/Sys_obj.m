function f= Sys_obj(x)
global count_sys;
count_sys=count_sys+1;
load('optimal_solution_sub_1.mat', 'z1');
load('optimal_solution_sub_2.mat', 'z2');
sub_system_1_output=z1;
sub_system_2_output=z2;

x11=sub_system_1_output(1);
x12=sub_system_1_output(2);
x13=sub_system_1_output(3);


x21=sub_system_2_output(1);
x22=sub_system_2_output(2);
x23=sub_system_2_output(3);


%f=(x(1))^0.5+x4+x5*(0.4*x(2));
f=(x(1))^0.5+x22+x23*(0.4*x(2));
end