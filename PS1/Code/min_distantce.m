function [d1,d2,d3,d4] = min_distantce(V)
angle=360;
distance=zeros(10,10);
d1=0;
d2=0;

%angle distance
for i=1:size(V,2)
    Vd1 = V(:,i);
    for j=1:size(V,2)
        if i~=j
            Vd2 = V(:,j);
            angle_temp = abs(acos(dot(Vd1,Vd2)/(norm(Vd1)*norm(Vd2))));
            if(angle_temp ~= 0 && angle>=angle_temp)
                angle=angle_temp;
                d1=i;
                d2=j;
            end
        end
    end
end

%Enclidean distance
for i=1:size(V,2)
    Vd1 = V(:,i);
    for j=1:size(V,2)
        if i~=j
            Vd2 = V(:,j);
            distance_temp = norm(Vd1-Vd2);
            distance(i,j) = distance_temp;
        end
    end
end

distanceCopy = (distance + diag(Inf(size(diag(distance)))));    % put Inf on diagonal
%[~,ndx] = min(distanceCopy);                   % get the linear index of the minimum value
misdistance=min(distanceCopy(:));
[d3,d4] = find(distanceCopy==misdistance);


fprintf('%dth and %dth are closest in Euclidean distance\n', d3(1), d3(2));
fprintf('The smallest Euclidean distance is %.4f\n', misdistance);
fprintf('%dth and %dth are closest in angle distance\n', d1, d2);
fprintf('The smallest angle distance is %.4f\n', angle);
end