


%Gram-Schmidt
%x=linspace(-pi,pi);
syms x a0 a1 a2 a3 a4 a5;
%a1=0.987862;
V=[x.^0;x.^1;x.^2;x.^3;x.^4;x.^5];
U=sin(x);%a0+a1*x+a2*x.^2+a3*x.^3+a4*x.^4+a5*x.^5;
%A=[a0;a1;a2;a3;a4;a5];

%fun = @(x) V(x).*Q(x-1);
%Q(1)=@(x) x.^(1-1)


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
%Q
%Q_norm

%(b)
A=zeros(6,1);
for i=1:6
    A(i,1)=innerprod_(U,Q(i))/innerprod_(Q(i),Q(i));
end


function e = innerprod_(v_,q_)
e=int(v_*q_,-pi,pi);
end
%{E
%[G,H]= equationsToMatrix(E, [a0,a1,a2,a3,a4,a5]);
%G
%H
%[A,R]= linsolve(G,H)
