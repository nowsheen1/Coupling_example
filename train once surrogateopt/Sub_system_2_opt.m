function out=Sub_system_2_opt()
global count1 evalHistory2 ;
evalHistory2=[];
FUN = @Sub_sys_2_obj;
X0 = [1;1;1]; %x(2)=x4 and x(3)=x5
A = [];
B = [];
Aeq = [];
Beq = [];
LB = [0;0;0;0;0;0];
UB = [10;10;10;10;10;10];
NONLCON = @constraints_Sub_sys_2;
%options = optimset('PlotFcns','optimplotfval','TolX',1e-7,'MaxIter',100000,'MaxFunEvals',100000,'Algorithm','sqp');

%options=optimoptions('fmincon','Algorithm','interior-point','MaxFunEvals' ,100000,'MaxIter' ,100000,'TolX',1e-100,'TolFun',1e-10,'Display','iter');

%options = optimoptions(options,'MaxFunEvals' ,100000);
%%TolFun is optimality tolerance%%fmincon takes the last option so be
%%careful about the options.
%options = optimoptions(options,'MaxIter' ,100000);
%options = optimset ('LargeScale', 'off', 'TolCon', 1e-8, 'TolX', 1e-8, 'TolFun',1e-7);

%[X_Sub_sys_2,fval2,exitflag2,Output2] = fmincon(FUN,X0,A,B,Aeq,Beq,LB,UB,NONLCON,options);


options=optimoptions('surrogateopt','MinSampleDistance',10^-1);
[X_Sub_sys_2,fval2,exitflag2,Output_sub_system_2] = surrogateopt(@(x)Sub_sys_2_obj(x),LB,UB,options);
out=[X_Sub_sys_2];
X = [evalHistory2(:, 1),evalHistory2(:, 2),evalHistory2(:, 3),evalHistory2(:, 4),evalHistory2(:, 5),evalHistory2(:, 6)] ;% Inputs
Y = evalHistory2(:, 7); % Objective values
% Fit a Gaussian process to visualize the surrogate
gpModel2 = fitrgp(X, Y);

% Predict across the domain
save('gp_model_2.mat', 'gpModel2', '-v7.3');
save('optimal_solution_2.mat', 'X_Sub_sys_2', '-v7.3')



end
function f= Sub_sys_2_obj(x)
%count=count+1;
global evalHistory2;
xs=x(4);
t1=x(5);
t2=x(6);

f.Fval=0.5*(((x(1)-xs))^2+((x(1)*x(2)+(x(2))^2+x(3)+t1)-t2)^2);
f.Ineq(1)=2-(sqrt(x(1))+x(2)+x(3)*0.4*t1);
f.Ineq(2)=(sqrt(x(1))+x(2)+x(3)*0.4*t1)-20;

evalHistory2 = [evalHistory2; x, f.Fval]; % Log evaluation

end
