clear all;
load Handout.mat;
Xtrain = full(Xtrain);
[m,n] = size(Xtrain);
a = zeros(10,1);

for i = 1:10
    x_heldout = Xtrain((m*(i-1)/10+1):m*i/10, : );
    y_heldout = Ytrain((m*(i-1)/10+1):m*i/10, 1 );
    x_train = [Xtrain(1:m*(i-1)/10, :);Xtrain(m*i/10+1:n, : )];
    y_train = [Ytrain(1:m*(i-1)/10, 1);Ytrain(m*i/10+1:n, 1 )];
    a(i) = lr_run(x_train,y_train,x_heldout,y_heldout,0.2);
    
end

aver = sum(a(:));

aver = aver/10;

fprintf('average:%.3f\n', aver);    