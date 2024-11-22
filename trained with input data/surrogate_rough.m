rng (42)
xs=1;
t1=1;
t2=1;
global count1;
FUN = @Sub_sys_1_obj;
X0 = [1;1;1]; 
A = [];
B = [];
Aeq = [];
Beq = [];
LB = [0;0;0];
UB = [10;10;10];
NONLCON = @constraints_Sub_sys_1;
%options = optimset('PlotFcns','optimplotfval','TolX',1e-7,'MaxIter',100000,'MaxFunEvals',100000,'Algorithm','sqp');

%options=optimoptions('fmincon','Algorithm','interior-point','MaxFunEvals' ,100000,'MaxIter' ,100000,'TolX',1e-100,'TolFun',1e-10,'Display','iter');

%options = optimoptions(options,'MaxFunEvals' ,100000);
%%TolFun is optimality tolerance%%fmincon takes the last option so be
%%careful about the options.
%options = optimoptions(options,'MaxIter' ,100000);
%options = optimset ('LargeScale', 'off', 'TolCon', 1e-8, 'TolX', 1e-8, 'TolFun',1e-7);

%[X_Sub_sys_1,fval1,exitflag1,Output1] = fmincon(FUN,X0,A,B,Aeq,Beq,LB,UB,NONLCON,options);

options=optimoptions('surrogateopt','MinSampleDistance',10^-1);
[X_Sub_sys_1,fval1,exitflag1,Output_sub_system_1] = surrogateopt(@(x)Sub_sys_1_obj(x,xs,t1,t2),LB,UB);
out=[X_Sub_sys_1,fval1];




