
% f = OBJ(x)
%   f: Objective Function Value
%   x: Design Variables

function f = obj(x,xs,t1,t2)
%global U_S V_S output_fun_IDF_1
   % a = 20;
    %b = 0.2;
    %c = 2*pi;
    %d = 2;
    %f = -a*exp(-b*sqrt(1/d*sum(x.^2))) ...
%        - exp(1/d*sum(cos(c*x))) + a + exp(1);
%z=output_fun_IDF_1;
%V_S = IDF_sys_eqn_solv_V_S(x,u01);
%var=x;
%u01=x(4); %initial guess for cuple var 1.
%Sys_2=parfeval(@IDF_sys_eqn_solv_V_S,1,x,u01);
%z=output_fun_IDF_1;
%out_1=fetchOutputs(Sys_2);
%V_S=double(out_1(1));
%output_fun_IDF_1=double(out_1(1));
%z=z+output_fun_IDF_1
%V_S = IDF_sys_eqn_solv_V_S(x,u01); %as it is subsystem 2

%Coupling0=[1;1];    
%t=sys_eqn_solv_couplingvar( x,Coupling0 );
f=0.5*(((x(1)-x(4)))^2+(((x(1))^2+2*x(2)-x(3)+2*sqrt(x(6)))-x(5))^2);  % xs is x4, t1 is x5, t2 is x6
%f=((x(1)*x(2)+(x(2))^2+x(3)+t(1)));

%c(1)=abs(2-(sqrt(x(1)+x(2)+x(3)*0.4*U_S)));
%c(2)=abs((sqrt(x(1)+x(2)+x(3)*0.4*U_S))-20);
%ceq(1)=abs(x(4)-V_S);
%f=0.5*(((x(:,1)-xs)).^2+(x(:,2)-a1).^2)+1000*(x(:,3)+x(:,1)-1)+1000.*(2.*x(:,2)+x(:,1)-x(:,3));
%gradf=[0.5*2*((x1s^2+x(1)+x3s-0.2*y2s)-y1s)*2*x1s; 0.5*2*((x1s^2+x(1)+x3s-0.2*y2s)-y1s)*1;0.5*2*((x1s^2+x(1)+x3s-0.2*y2s)-y1s)*(-1);0.5*2*((x1s^2+x(1)+x3s-0.2*y2s)-y1s)*(-0.2)];
%derivative wrt x1s, x2s y1s y3s.
end