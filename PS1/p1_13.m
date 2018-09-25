
%Gram-Schmidt
%x=linspace(-pi,pi);
syms x;
V=[x.^0;x.^1;x.^2;x.^3;x.^4;x.^5];
U=sin(x);

%(a)
Q=V;
for i=1:6
    if(i>1)
        for j=1:i-1
            innerprod = innerprod_(Q(j),V(i));%int(V(i)*Q(j),-pi,pi);
            Q(i,1)=Q(i,1)-innerprod*Q(j);
        end
    end
    norm=sqrt(innerprod_(Q(i),Q(i)));
    Q(i)=Q(i)/norm;
end


%(b)
A=zeros(6,1);
for i=1:6
    A(i,1)=innerprod_(U,Q(i))/innerprod_(Q(i),Q(i));
end

f=0;
for i=1:6
   f= f+A(i)*Q(i);
end

hold on 
fplot(f,[-pi,pi])

hold on
fplot(U,[-pi,pi])

hold on 
fplot(x-x^3/6+x^5/120, [-pi,pi])

legend('Orthonomal basis approximation','sinx','Taylor approximation')

function e = innerprod_(v_,q_)
e=int(v_*q_,-pi,pi);
end

