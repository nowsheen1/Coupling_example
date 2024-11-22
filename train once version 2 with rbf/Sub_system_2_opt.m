function X_Sub_sys_2=Sub_system_2_opt(xs,t1,t2)
global count;
FUN = @Sub_sys_2_obj;
X0 = [1;1;1]; %x(2)=x4 and x(3)=x5
A = [];
B = [];
Aeq = [];
Beq = [];
LB = [0;0;0];
UB = [10;10;10];
NONLCON = @constraints_Sub_sys_2;
%options = optimset('PlotFcns','optimplotfval','TolX',1e-7,'MaxIter',100000,'MaxFunEvals',100000,'Algorithm','sqp');
options=optimoptions('fmincon','Algorithm','interior-point','MaxFunEvals' ,100000,'MaxIter' ,100000,'TolX',1e-100,'TolFun',1e-10,'Display','iter');
%options = optimoptions(options,'MaxFunEvals' ,100000);
%%TolFun is optimality tolerance%%fmincon takes the last option so be
%%careful about the options.
%options = optimoptions(options,'MaxIter' ,100000);
%options = optimset ('LargeScale', 'off', 'TolCon', 1e-8, 'TolX', 1e-8, 'TolFun',1e-7);
[X_Sub_sys_2,fval2,exitflag2,Output2] = fmincon(FUN,X0,A,B,Aeq,Beq,LB,UB,NONLCON,options);
function f= Sub_sys_2_obj(x)
count=count+1;
f=0.5*(((x(1)-xs))^2+((x(1)*x(2)+(x(2))^2+x(3)+t1)-t2)^2);
end
function [c,ceq]=constraints_Sub_sys_2(x)
c(1)=2-(sqrt(x(1)+x(2)+x(3)*0.4*t1));
c(2)=(sqrt(x(1)+x(2)+x(3)*0.4*t1))-20;
ceq=[];
end
end