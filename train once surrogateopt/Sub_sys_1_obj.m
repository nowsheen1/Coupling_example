function f= Sub_sys_1_obj(x,xs,t1,t2)
%    count1=count1+1;
f.Fval=0.5*(((x(1)-xs))^2+(((x(1))^2+2*x(2)-x(3)+2*sqrt(t2))-t1)^2);

f.Ineq(1)=2-((x(1))^2+2*x(2)+x(3)+x(2)*exp(-t2));
f.Ineq(2)=((x(1))^2+2*x(2)+x(3)+x(2)*exp(-t2))-20;

end