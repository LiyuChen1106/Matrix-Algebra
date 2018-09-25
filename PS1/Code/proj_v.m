function res = proj_v(x, v)
    % project x onto v
    alpha = dot(x, v) / norm(v, 2)^2;
    res = alpha * v;
end