function [ ] = lr_run( Xtrain, Ytrain, Xtest, Ytest)
%%  lr_run
%   This function take Xtrain, Ytrain, Xtest, and Ytest as input and output
%   percision, recall and accuracy.
model = lr_train(Xtrain,Ytrain);
Pred_lr = lr_test(model,Xtest);

m = size(Ytest,1);
precision = (Pred_lr' * Ytest) / sum(Ytest);
recall = (Pred_lr' * Ytest) / sum(Pred_lr);
accuracy = 1 - (norm(Pred_lr - Ytest)^2) / m;

save Pred_lr.mat Pred_lr;
fprintf('P:%.3f, R:%.3f, A:%.3f\n', precision, recall, accuracy);
end

