function f = mylu(A,b)
    %%LU Decomposition
    %Get Augmented Matrix
    Ab=[A,b]
    n = length(A);
    L = eye(n);
    P=eye(n)
    %With A(1,1) as pivot Element
    %Row exchange to make sure A(1,1) is the last in Column
    col1=Ab(:,1);
    [temp,idx] = max(col1);
    temp = Ab(1,:);
    Ab(1,:) = Ab(idx,:);
    Ab(idx,:) = temp;
    %Computation in the pivot column
    for i=2:3;
        alpha = Ab(i,1) / Ab(1,1);
        L(i,1) = alpha;
        Ab(i,:) = Ab(i,:) - alpha*Ab(1,:);
    end
    %With A(2,2) as pivot Element
    %Row exchange to ensure A(2,2) is the largest in column 2
    col2 = Ab(2:end,2);
    [temp,idx] = max(col2);
    temp = Ab(2,:);
    Ab(2,:) = Ab(idx,:);
    Ab(idx,:) = temp;
    for i=3;
        alpha = Ab(i,2) / Ab(2,2);
        L(i,2) = alpha
        Ab(i,:) = Ab(i,:) - alpha*Ab(2,:);
    end
    U=Ab(1:n,1:n)
end