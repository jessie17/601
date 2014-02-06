a = [71.8,71.8,72.1,72.1,70.6,64.3,58.1,55.3,53,52.1];
lambda = [0.0000001,0.000001,0.00001,0.0001,0.001,0.01,0.1,0.2,0.5,1];

figure(1)
plot(lambda,a);
hold on;
plot(lambda,a,'R*');
title('logistic regression');
xlabel('Lambda');
ylabel('Accuracy(%)');

figure(2)
plot(log10(lambda),a);
hold on;
plot(log10(lambda),a,'R*');
title('logistic regression');
xlabel('log10 of Lambda');
ylabel('Accuracy(%)');
