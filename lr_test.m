function [ Pred_lr ] = lr_test( model, Xtest )
%% lr_test
%  This function will return the predicted labels
Xtest = full(Xtest);

Pred_lr = arrayfun(@(x) 1/(1+exp(-x)), Xtest*model');
   
%compare p1 and p0, if p1 >= p0, Y = 1;
%if p1 < p0, Y = 0.
Pred_lr(Pred_lr >= 0.5) = 1;
Pred_lr(Pred_lr < 0.5) = 0;

end

