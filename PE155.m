clc;clear;
v1=60;
for i=2:18
    eval(['v',num2str(i),'=[];']);
    for j=1:floor(i/2)
        eval(['x1=v',num2str(j),';']);
        eval(['x2=v',num2str(i-j),';']);
        J=[];
        for k=1:length(x1)
            J=[J x1(k)+x2 1./(1/x1(k)+1./x2)];
            J=unique(J);
        end
        eval(['v',num2str(i),'=unique([v',num2str(i),' J]);']);
    end
end
a=unique([v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 v12 v13 v14 v15 v16 v17 v18]);
da=diff(a);
length(a)-length(da(da<1e-8))