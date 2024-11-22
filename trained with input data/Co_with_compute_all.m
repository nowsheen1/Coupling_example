FUN = @Sys_obj;
global count count1 count2 u1 u2;
count=0;
count1=0;
count2=0;
X0 = [1;2;4]; % x(1)=xs,x(2)=t1,x(3)=t2
A = [];
B = [];
Aeq = [];
Beq = [];
LB = [0;0;0];
UB = [10;10;10];
NONLCON = @constraints_Sys;
%options = optimset('PlotFcns','optimplotfval','TolX',1e-7,'MaxIter',100000,'MaxFunEvals',100000,'Algorithm','sqp');
options=optimoptions('fmincon','Algorithm','interior-point','MaxFunEvals' ,100000,'MaxIter' ,100000,'TolX',1e-100,'TolFun',1e-10,'Display','iter');
%options = optimoptions(options,'MaxFunEvals' ,100000);
%%TolFun is optimality tolerance%%fmincon takes the last option so be
%%careful about the options.
%options = optimoptions(options,'MaxIter' ,100000);
%options = optimset ('LargeScale', 'off', 'TolCon', 1e-8, 'TolX', 1e-8, 'TolFun',1e-7);
[X,fval,exitflag,Output] = fmincon(FUN,X0,A,B,Aeq,Beq,LB,UB,NONLCON,options);
z_co=count;
h_co=count1;
f_co=count2;
function f= Sys_obj(x)
Sub_system_1_output=Sub_system_1_opt(x(1));
Sub_system_2_output=Sub_system_2_opt(x(1));
x2=Sub_system_1_output(2);
x3=Sub_system_1_output(3);
x4=Sub_system_2_output(2);
x5=Sub_system_2_output(3);
sigma1=Sub_system_1_output(1); %as sigma1* means that sub system er solution which is sigma1
sigma2=Sub_system_2_output(1);
f=(x(1))^0.5+x4+x5*(0.4*x(2));
end
function X_Sub_sys_2=Sub_system_2_opt(xs)
global count;
%FUN = @Sub_sys_2_obj;
X0 = [1;1;1]; %x(2)=x4 and x(3)=x5
A = [];
B = [];
Aeq = [];
Beq = [];
LB = [0;0;0];
UB = [10;10;10];
%NONLCON = @constraints_Sub_sys_2;
%options = optimset('PlotFcns','optimplotfval','TolX',1e-7,'MaxIter',100000,'MaxFunEvals',100000,'Algorithm','sqp');
options=optimoptions('fmincon','Algorithm','interior-point','MaxFunEvals' ,100000,'MaxIter' ,100000,'TolX',1e-100,'TolFun',1e-10,'Display','iter');
%options = optimoptions(options,'MaxFunEvals' ,100000);
%%TolFun is optimality tolerance%%fmincon takes the last option so be
%%careful about the options.
%options = optimoptions(options,'MaxIter' ,100000);
%options = optimset ('LargeScale', 'off', 'TolCon', 1e-8, 'TolX', 1e-8, 'TolFun',1e-7);
%[X_Sub_sys_2,fval2,exitflag2,Output2] = fmincon(FUN,X0,A,B,Aeq,Beq,LB,UB,NONLCON,options);




    
    xLast = []; % Last place computeall was called
    myf = []; % Use for objective at xLast
    myc = []; % Use for nonlinear inequality constraint
    myceq = []; % Use for nonlinear equality constraint
     objfun=@FUN;
     constr=@NONLCON;
     % The constraint function, nested below
   
    % Call fmincon
    [ X_Sub_sys_2,fval2,exitflag2,Output2] = fmincon(objfun,X0,A,B,Aeq,Beq,LB,UB,constr,options);
    %[x,f,eflag,outpt] = fmincon(FUN,x0,[],[],[],[],lb,ub,NONLCON); %
    %shared variable can go upto second function not more than it. In third
    %function it is not transferred properly.
function y = FUN(x)
    
        if ~isequal(x,xLast) % Check if computation is necessary
            [myf,myc,myceq] = computeall(x,xs);
            xLast = x;
        end
        % Now compute objective function
        y = myf;
        count=count+1;
    end

    function [c,ceq] = NONLCON(x)
        if ~isequal(x,xLast) % Check if computation is necessary
            [myf,myc,myceq] = computeall(x,xs);
            xLast = x;
        end
        % Now compute constraint function
        c = myc; % In this case, the computation is trivial
        ceq = myceq;
    end
end





function [f,c,ceq] = computeall(x,xs)
global u1 u2;
Coupling0=[2;4]; 

t=sys_eqn_solv_couplingvar( x,Coupling0 );
f=0.5*(((x(1)-xs))^2+((x(1)*x(2)+(x(2))^2+x(3)+t(1))-t(2))^2);

c(1)=2-(sqrt(x(1)+x(2)+x(3)*0.4*t(1)));
c(2)=(sqrt(x(1)+x(2)+x(3)*0.4*t(1)))-20;
ceq=[];

  
u1 = sys_eqn_solv_couplingvar1( x,Coupling );
function [ u2 ] = sys_eqn_solv_couplingvar2( x,Coupling)
  u2=Coupling(2)-(x(1)*x(2)+x(2)^2+x(3)+Coupling(1));% for f2 2nd discipline
end

function [ u ] = sys_eqn_solv_couplingvar( x,Coupling0 )
global count2;
options = optimset;
 
options = optimset(options,'Display' ,'off');
options = optimset(options,'MaxFunEvals' ,100000);
options = optimset(options,'MaxIter' ,100000);
 
[u,fval1,exitflag1,output1] = fsolve(@equations, Coupling0, options);  

 
 function f = equations(Coupling)
   
    f =[u1;...
      
    
sys_eqn_solv_couplingvar2( x,Coupling) ];
count2=count2+1;

 end   
end
end
function X_Sub_sys_1=Sub_system_1_opt(xs1)
 global count1;   
%FUN = @Sub_sys_1_obj;
X0 = [1;1;1]; 
A = [];
B = [];
Aeq = [];
Beq = [];
LB = [0;0;0];
UB = [10;10;10];
%NONLCON = @constraints_Sub_sys_1;
%options = optimset('PlotFcns','optimplotfval','TolX',1e-7,'MaxIter',100000,'MaxFunEvals',100000,'Algorithm','sqp');
options=optimoptions('fmincon','Algorithm','interior-point','MaxFunEvals' ,100000,'MaxIter' ,100000,'TolX',1e-100,'TolFun',1e-10,'Display','iter');
%options = optimoptions(options,'MaxFunEvals' ,100000);
%%TolFun is optimality tolerance%%fmincon takes the last option so be
%%careful about the options.
%options = optimoptions(options,'MaxIter' ,100000);
%options = optimset ('LargeScale', 'off', 'TolCon', 1e-8, 'TolX', 1e-8, 'TolFun',1e-7);
xLast1 = [];
    myf = []; % Use for objective at xLast
    myc = []; % Use for nonlinear inequality constraint
    myceq = []; % Use for nonlinear equality constraint

    objfun1 = @FUN1; % The objective function, nested below
    constr1 = @NONLCON1; % The constraint function, nested below
[ X_Sub_sys_1,fval1,exitflag1,Output1] = fmincon(objfun1,X0,A,B,Aeq,Beq,LB,UB,constr1,options);

  

     % The constraint function, nested below
    
    % Call fmincon
    %[x,f,eflag,outpt] = fmincon(FUN_Sys,x0,[],[],[],[],lb,ub,NONLCON_Sys,opts);
function y = FUN1(x)
        if ~isequal(x,xLast1) % Check if computation is necessary
            [myf,myc,myceq] = computeall1(x,xs1);
            xLast1 = x;
        end
        % Now compute objective function
        y = myf;
        count1=count1+1;
    end

    function [c,ceq] = NONLCON1(x)
        if ~isequal(x,xLast1) % Check if computation is necessary
            [myf,myc,myceq] = computeall1(x,xs1);
            xLast1 = x;
        end
        % Now compute constraint function
        c = myc; % In this case, the computation is trivial
        ceq = myceq;
    end
end








function [f1,c1,ceq1] = computeall1(x,xs1)
global u1 u2;
Coupling0=[2;4];    
t=sys_eqn_solv_couplingvar( x,Coupling0 );
f1=0.5*(((x(1)-xs1))^2+(((x(1))^2+2*x(2)-x(3)+2*sqrt(t(2)))-t(1))^2);


    
c1(1)=2-((x(1))^2+2*x(2)+x(3)+x(2)*exp(-t(2)));
c1(2)=((x(1))^2+2*x(2)+x(3)+x(2)*exp(-t(2)))-20;
ceq1=[];
  u2  = sys_eqn_solv_couplingvar2( x,Coupling );
 function[ u1 ] = sys_eqn_solv_couplingvar1( x,Coupling )
 u1 =Coupling(1)-(x(1)^2+2*x(2)-x(3)+2*sqrt(Coupling(2)));% fe f1 frt discipline
    end
%function [ u2 ] = sys_eqn_solv_couplingvar2( x,Coupling)

function [ u ] = sys_eqn_solv_couplingvar( x,Coupling0 )

options = optimset;
 
options = optimset(options,'Display' ,'off');
options = optimset(options,'MaxFunEvals' ,100000);
options = optimset(options,'MaxIter' ,100000);
 
[u,fval1,exitflag1,output1] = fsolve(@equations, Coupling0, options);  

 
 function f = equations(Coupling)
   
    f =[u1;...
    sys_eqn_solv_couplingvar2( x,Coupling)];


 end   
end




end




function[c,ceq]= constraints_Sys(x)
Sub_system_1_output=Sub_system_1_opt(x(1));
Sub_system_2_output=Sub_system_2_opt(x(1));
x2=Sub_system_1_output(2);
x3=Sub_system_1_output(3);
x4=Sub_system_2_output(2);
x5=Sub_system_2_output(3);
sigma1=Sub_system_1_output(1); %as sigma1* means that sub system er solution which is sigma1
sigma2=Sub_system_2_output(1);
ceq(1)=0.5*(((sigma1-x(1)))^2+((sigma1^2+2*x2-x3+2*sqrt(x(3)))-x(2))^2);% xs is x(1) and t1 is x(2) and t2 is x(3)
ceq(2)=0.5*(((sigma2-x(1)))^2+((sigma2*x4+x4^2+x5+x(2))-x(3))^2);
c=[];
end
