load('/nfs/ug/homes-2/c/chenliy5/Desktop/Matrix Algebra/PS1/PS01_dataSet/wordVecV.mat')
dsize = size(V,2);
tsize = size(V,1);

%(a)---------------------------------------
fprintf('a)\n');
min_distantce(V);

%(b)---------------------------------------
fprintf('b)\n');
sum_fterm = sum(V,1);
Vd_norm = V;

for i=1:dsize
    Vd_norm(:,i) = V(:,i)/sum_fterm(i);
end
min_distantce(Vd_norm);

%(c)---------------------------------------
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
min_distantce(Wd);