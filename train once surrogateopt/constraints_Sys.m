function[c,ceq]= constraints_Sys(x)


load('gp_model_1.mat', 'gpModel1');
load('gp_model_2.mat', 'gpModel2');

load('optimal_solution_1.mat', 'X_Sub_sys_1');
load('optimal_solution_2.mat', 'X_Sub_sys_2');


x11=X_Sub_sys_1(1);
x12=X_Sub_sys_1(2);
x13=X_Sub_sys_1(3);

x21=X_Sub_sys_2(1);
x22=X_Sub_sys_2(2);
x23=X_Sub_sys_2(3);

pred_point_1=[x11,x12,x13,x(1),x(2),x(3)];
pred_point_2=[x21,x22,x23,x(1),x(2),x(3)];



ceq(1)=predict(gpModel1,pred_point_1);
ceq(2)=predict(gpModel2,pred_point_2 );

c=[];
end