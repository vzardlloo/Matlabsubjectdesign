clc;clear all;close all


tic

soln = zeros(1,1000);

for a=1:333

    p=1;

    b=a;

    while p < 1000

        b = b+1;

        c = sqrt((a^2) + (b^2));

        p = a+b+c;

        if mod(p,1)==0

            soln(1,p) = soln(1,p) + 1;

        end

    end

end

toc


[n,i] = max(soln);


fprintf('The answer is %.0d\n',i);