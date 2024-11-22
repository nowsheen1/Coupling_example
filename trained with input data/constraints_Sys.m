function[c,ceq]= constraints_Sys(x)


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


ceq(1)=0.5*(((sigma1-x(1)))^2+((sigma1^2+2*x2-x3+2*sqrt(x(3)))-x(2))^2);% xs is x(1) and t1 is x(2) and t2 is x(3)
ceq(2)=0.5*(((sigma2-x(1)))^2+((sigma2*x4+x4^2+x5+x(2))-x(3))^2);

%ceq(1)=x6;
%ceq(2)=x7;

c=[];
end