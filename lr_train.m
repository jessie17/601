function [ model ] = lr_train( Xtrain, Ytrain)
%% lr_train
%Initialize the weight vector w, and the learning rate a
Xtrain = full(Xtrain);
[m,n] = size(Xtrain);
w = zeros(1, n);
a = 0.01;
%According to the result of 10-fold cross-validation on training set,
%lambda equals to 1 is the best regularization coefficient.
lambda = 0.0001;
delta = 1;
L_2(1) = 0;
L_2(2) = 0;
%While objective function not converged, run again.
%To determine when to stop this optimization, I keep track of the value of L_2.
%If the change in L_2 is less than a small number(in this case using 0.001),
%I assume algorithm has found the global optimum.
while delta>0.5
    %Randomly shuffle the order of the examples in the training set.
    index = randperm(m);
    Xtrain = Xtrain(index , : );
    Ytrain = Ytrain(index , : );   

    for j = 1:m
 	  p = 1/(1+exp(-dot(Xtrain(j,:),w)));
      w = w + a*((Ytrain(j,1) - p)*Xtrain(j,:)- 2*w*lambda); 
    end
    p_vec = arrayfun(@(x) 1/(1+exp(-x)), Xtrain*w');
    LCL = Ytrain' * arrayfun(@(x) log(x), p_vec) + (ones(m, 1) - Ytrain)' * arrayfun(@(x) log(1-x), p_vec);
    L_2(1) = L_2(2);
    L_2(2) = LCL-lambda*((norm(w))^2); 
    delta = abs(L_2(2)-L_2(1));
end 
model = w;  
end

