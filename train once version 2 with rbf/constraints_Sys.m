function[c,ceq]= constraints_Sys(x)
global weight center weight_2 center_2

load('optimal_solution_sub_1.mat', 'z1');
load('optimal_solution_sub_2.mat', 'z2');

load('weight_sub_1.mat', 'weight');
load('center_sub_1.mat', 'center');

load('weight_sub_2.mat', 'weight_2');
load('center_sub_2.mat', 'center_2');

sub_system_1_output=z1;
sub_system_2_output=z2;
x11=sub_system_1_output(1);
x12=sub_system_1_output(2);
x13=sub_system_1_output(3);

func=@tps_rbf_objfn;
x_new=[x11,x12,x13,x(1),x(2),x(3)];
    function surr_response_1 = applyFunction(func, x_new,weight,center)
    surr_response_1 = func(x_new,weight,center); % Call the passed function handle with the input
    end

x21=sub_system_2_output(1);
x22=sub_system_2_output(2);
x23=sub_system_2_output(3);

func2=@tps_rbf_objfn;
x_new_2=[x21,x22,x23,x(1),x(2),x(3)];
    function surr_response_2 = applyFunction_2(func2, x_new_2,weight_2,center_2)
    surr_response_2 = func2(x_new_2,weight_2,center_2); % Call the passed function handle with the input
    end

ceq(1)=applyFunction(func, x_new,weight,center);
ceq(2)=applyFunction_2(func2, x_new_2,weight_2,center_2);

%ceq(1)=x6;
%ceq(2)=x7;

c=[];
end