function [y_out] = laff_copy(x,y)
[x_r,x_c] = size(x);
[y_r,y_c] = size(y);
if(x_r ~= 1 & x_c ~= 1)| (y_r ~= 1 & y_c ~= 1)
    y_out = 'FAILED';
    return
end
if(x_r*x_c ~= y_r*y_c)
    y_out = 'FAILED';
    return
end
if x_r == 1             %x row = 1
    if y_r == 1         %y row = 1
        for i=1:x_c
            y(i,1) = x(1,i);
        end
    else                %y row > 1
        for i=1:x_c
            y(i,1) = x(1,i);
        end
    end        
else
    if y_r == 1
        for i=1:x_r
            y(1,i) = x(i,1);
        end
    else
        for i=1:x_r
            y(1,i) = x(1,i);
        end
    end
end

y_out = y;

return
end