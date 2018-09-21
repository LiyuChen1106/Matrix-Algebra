load('/nfs/ug/homes-2/c/chenliy5/Desktop/Matrix Algebra/PS1/PS01_dataSet/wordVecV.mat')
dsize = size(V,2);
tsize = size(V,1);

%p1.8-(a)
fprintf('a)\n');
[a1,a2,a3,a4] = min_distantce(V);

%p1.8-(b)
fprintf('b)\n');
sum_fterm = sum(V,1);
Vd_norm = V;

for i=1:dsize
    Vd_norm(:,i) = V(:,i)/sum_fterm(i);
end
[b1,b2,b3,b4] = min_distantce(Vd_norm);

%p1.8-(c)
fprintf('c)\n');
fdot=zeros(1,tsize);
for row=1:tsize
    for col=1:dsize
        if(V(row,col) > 0)
            fdot(row)= fdot(row) + 1;
        end
    end
end

Wd=V;
for row=1:tsize
    for col=1:dsize
        Wd(row,col) = (Vd_norm(row,col))*sqrt(log(dsize/fdot(row)));
    end
end
[c1,c2,c3,c4] = min_distantce(Wd);