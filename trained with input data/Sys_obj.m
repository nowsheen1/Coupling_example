function f= Sys_obj(x)
global count_sys;
count_sys=count_sys+1;



load('gprModel_sub11.mat', 'Mdl11');
load('gprModel_sub12.mat', 'Mdl12');
load('gprModel_sub13.mat', 'Mdl3');

load('gprModel_sub21.mat', 'Mdl21');
load('gprModel_sub22.mat', 'Mdl22');
load('gprModel_sub23.mat', 'Mdl23');

pred_point=[x(1),x(2),x(3)];
Sub_system_1_output(1)=predict(Mdl11,pred_point);
Sub_system_1_output(2)=predict(Mdl12,pred_point);
Sub_system_1_output(3)=predict(Mdl3,pred_point);

Sub_system_2_output(1)=predict(Mdl21,pred_point);
Sub_system_2_output(2)=predict(Mdl22,pred_point);
Sub_system_2_output(3)=predict(Mdl23,pred_point);


x2=Sub_system_1_output(2);
x3=Sub_system_1_output(3);
x4=Sub_system_2_output(2);
x5=Sub_system_2_output(3);
sigma1=Sub_system_1_output(1); %as sigma1* means that sub system er solution which is sigma1
sigma2=Sub_system_2_output(1);
f=(x(1))^0.5+x4+x5*(0.4*x(2));
end