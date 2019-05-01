function x = BubbleSort(x)
[~,n] = size(x);
while (n > 0)
    % Iterate through x
    nnew = 0;
    for i = 2:n
        % Swap elements in wrong order
        if (x(1,i) < x(1,i - 1))
            x = swap(x,i,i - 1);
            nnew = i;
        end
    end
    n = nnew;
end
end
function x = swap(x,i,j)
%fprintf('Swapping: \n');
%fprintf('Before: ');
%disp(x(1,i));
%fprintf('And ');
%disp(x(1,j));
% Swap x(i) and x(j)
% Note: In practice, x xhould be passed by reference
val = x(1,i);
x(1,i) = x(1,j);
x(1,j) = val;
val = x(2,i);
x(2,i) = x(2,j);
x(2,j) = val;
%fprintf('After: ');
%disp(x(1,i));
%fprintf('And ');
%disp(x(1,j));
end