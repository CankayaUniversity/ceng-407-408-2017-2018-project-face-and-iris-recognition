function [x, y] = circlepoints(r)

x = [];
y = [];
for rad = r
    [xp, yp] = circlepoints1(rad);
    x = [x xp];
    y = [y yp];
end

end
    
function [x, y] = circlepoints1(r)    

l = round(r/sqrt(2));
if round(sqrt(r.^2 - l.^2)) < l   % if crosses diagonal
    l = l-1;
end

x0 = 0:l;
y0 = round(sqrt(r.^2 - x0.^2));

if y0(end) == l
    l2 = l;
else
    l2 = l+1;
end

x = [x0 y0(l2:-1:2)]; 
y = [y0 x0(l2:-1:2)];

x0 = [x y];
y0 = [y -x];

x = [x0 -x0];
y = [y0 -y0];
end