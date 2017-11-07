%In class 19

% Problem 1. Imagine a clincal trial for two drugs that are intended to lower
% cholesterol. Assume 30 subjects are randomly divided into 3 groups that
% either receive a placebo or one of the two treatments. The mean initials
% levels of total cholesterol in each group are the same. The final
% measurements look like

placebo = [   194   183   199   189   189   214   212   186   191   190];
treatment1 = [    138   217   188   126   249   217   255   196   279   123];
treatment2 =[   152   152   151   143   161   142   142   141   161   135];



%A. Make a bar plot of the means of each group with errorbars (Hint, use
%bar and then use 'hold on' and then errorbar). 

figure;
hold on;
bar(1, mean(placebo));
hold on;
errorbar(1,mean(placebo), std(placebo), '.')
hold on;
bar(2, mean(treatment1));
hold on;
errorbar(2,mean(treatment1),std(treatment1), '.')
hold on;
bar(3, mean(treatment2));
hold on;
errorbar(3,mean(treatment2),std(treatment2), '.')

%B. Run a one way ANOVA analysis to see whether any of the treatment groups showed
%a statistically signficant difference. 

total_trial = [placebo treatment1 treatment2];
groups  = {'Control','treatment1','Treatment2'};
groups = repelem(groups, 10);
[p table stats] = anova1(total_trial, groups)

% P value of 0.0029 indicates significant differnece between groups

%C. use the multcompare function to look at all pairs of samples and
%indicate which are significantly different. 

[c,m,h,nms] = multcompare(stats)
plot(multcompare(stats))

% means of control and treatment2 group are significantly different

%Problem 2. In this directory, you will find a .mat file with three
%variables, xdat, ydat, and ydat2. For each pair (xdat, ydat) and (xdat,
%ydat2), fit the data to a first, second and third order polynomial. Which
%one is the best fit in each case? In at least one of the cases, do the
%problem with both the polyfit/polyval functions and with the 'fit' function.

input_data = load('data.mat');
xdat = input_data.xdat;
ydat = input_data.ydat;
ydat2 = input_data.ydat2;

% Fitting datasets based on first order polynomial

fit_1 = fit(xdat', ydat', 'poly1');
plot(fit_1, xdat', ydat')
set(gca,'FontSize',24);
fit_2 = fit(xdat', ydat2', 'poly1');
plot(fit_2, xdat', ydat2')
set(gca,'FontSize',24);

fit_3 = fit(xdat', ydat', 'poly2');
plot(fit_3, xdat', ydat')
set(gca,'FontSize',24);
fit_4 = fit(xdat', ydat2', 'poly2');
plot(fit_4, xdat', ydat2')
set(gca,'FontSize',24);

fit_5 = fit(xdat', ydat', 'poly3');
plot(fit_5, xdat', ydat')
set(gca,'FontSize',24);
fit_6 = fit(xdat', ydat2', 'poly3');
plot(fit_6, xdat', ydat2')
set(gca,'FontSize',24);

[coeff, s] = polyfit(xdat', ydat2', 2);
figure;
plot(xdat',ydat2','r.','MarkerSize',20);
hold on;
plot(xdat',polyval(coeff, xdat'),'l-','LineWidth',3);
hold off;


%xdat and ydat are linear and best fit is on polynomal of degree 1, aka
%line

%xdat and ydat2 are non linear and best fit is on polynomial of degree 3



