function out=Sub_system_1_opt()
global count1 evalHistory ;
evalHistory=[];
FUN = @Sub_sys_1_obj;
X0 = [1;1;1;1;1;1]; 
A = [];
B = [];
Aeq = [];
Beq = [];
LB = [0;0;0;0;0;0];
UB = [10;10;10;10;10;10];
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
[X_Sub_sys_1,fval1,exitflag1,Output_sub_system_1] = surrogateopt(@(x)Sub_sys_1_obj(x),LB,UB,options);
out=[X_Sub_sys_1];
X = [evalHistory(:, 1),evalHistory(:, 2),evalHistory(:, 3),evalHistory(:, 4),evalHistory(:, 5),evalHistory(:, 6)] ;% Inputs
Y = evalHistory(:, 7); % Objective values
% Fit a Gaussian process to visualize the surrogate
gpModel1 = fitrgp(X, Y);

% Predict across the domain
save('gp_model_1.mat', 'gpModel1', '-v7.3');
save('optimal_solution_1.mat', 'X_Sub_sys_1', '-v7.3')

end

function f= Sub_sys_1_obj(x)
global evalHistory;
%    count1=count1+1;
xs=x(4);
t1=x(5);
t2=x(6);
f.Fval=0.5*(((x(1)-xs)).^2+(((x(1)).^2+2.*x(2)-x(3)+2.*sqrt(t2))-t1).^2); % xs is x(4), t1 is x(5), t2 is x(6)

f.Ineq(1)=2-((x(1)).^2+2.*x(2)+x(3)+x(2).*exp(-t2));
f.Ineq(2)=((x(1)).^2+2.*x(2)+x(3)+x(2).*exp(-t2))-20;
evalHistory = [evalHistory; x, f.Fval]; % Log evaluation
end

