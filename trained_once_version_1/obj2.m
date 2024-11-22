
% f = OBJ(x)
%   f: Objective Function Value


function f = obj2(x,xs,t1,t2)
   % a = 20;
    %b = 0.2;
    %c = 2*pi;
    %d = 2;
    %f = -a*exp(-b*sqrt(1/d*sum(x.^2))) ...
%        - exp(1/d*sum(cos(c*x))) + a + exp(1);
%global U_S V_S u01 var
%global U_S V_S output_fun_IDF_2
%u02=x(4);
%Coupling0=[1;1];    
%Sys_1=parfeval(@IDF_sys_eqn_solv_U_S,1,x,u02);
%wait(Sys_1);
%U_S=fetchOutputs(Sys_1);


%out_2=fetchOutputs(Sys_1);
%U_S=double(out_2(1));
%output_fun_IDF_2=double(out_2(1))

%t=sys_eqn_solv_couplingvar( x,Coupling0 );
%U_S = IDF_sys_eqn_solv_U_S(x,u02);
%U_S = IDF_sys_eqn_solv_U_S(x,u02);
f=0.5*(((x(1)-x(4)))^2+((x(1)*x(2)+(x(2))^2+x(3)+x(5))-x(6))^2); %xs is x4, t1 is x5, t2 is x6;
%f=abs(0.5*(((x(1)-xs1)).^2+(((x(1)).^2+2.*x(2)-x(3)+2.*sqrt(V_S))-U_S).^2))+1000*abs(2-((x(1)).^2+2.*x(2)+x(3)+x(2).*exp(-V_S)))...
 %   +1000*(abs(2-((x(1)).^2+2.*x(2)+x(3)+x(2).*exp(-V_S))))+1000*(abs(x(4)-U_S));
%f1=(((x(1))^2+2*x(2)-x(3)+2*sqrt(t(2))));
%fun_out_2=computeall(x,xs1);

    
%c(1)=abs(2-((x(1)).^2+2.*x(2)+x(3)+x(2).*exp(-V_S)))
%c(2)=abs(((x(1)).^2+2.*x(2)+x(3)+x(2).*exp(-V_S))-20)
%ceq(1)=abs(x(4)-U_S);
%function [ u1 ] = sys_eqn_solv_couplingvar1( x,Coupling )
 %u1 =Coupling(1)-(x(1)^2+2*x(2)-x(3)+2*sqrt(Coupling(2)));% fe f1 frt discipline
 %end
%function [ u2 ] = sys_eqn_solv_couplingvar2( x,Coupling)
 % u2=Coupling(2)-(x(1)*x(2)+x(2)^2+x(3)+Coupling(1));% for f2 2nd discipline
%end
%function [ u ] = sys_eqn_solv_coup

%f=0.5*(((x(:,1)-xs)).^2+(x(:,2)-a2).^2)+1000*(x(:,3)-x(:,1)+2)+1000*(2.*x(:,2)+x(:,1)-x(:,3)); %x2 is xs and x1, a2 is x2, x3 is x3

%f=0.5*(((x(:,1)-xs)).^2+(x(:,2)-a1).^2)+1000*(x(:,3)+x(:,1)-1)+1000.*(2.*x(:,2)+x(:,1)-x(:,3));
%gradf=[0.5*2*((x1s^2+x(1)+x3s-0.2*y2s)-y1s)*2*x1s; 0.5*2*((x1s^2+x(1)+x3s-0.2*y2s)-y1s)*1;0.5*2*((x1s^2+x(1)+x3s-0.2*y2s)-y1s)*(-1);0.5*2*((x1s^2+x(1)+x3s-0.2*y2s)-y1s)*(-0.2)];
%derivative wrt x1s, x2s y1s y3s.
end