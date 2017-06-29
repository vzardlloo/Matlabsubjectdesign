clear 
tic  
L=1.5e6;%最大三角形周长 
x=zeros(1,L/2,'uint8');  %x用于存放每个周长可以以几种方式构成整数直角三角形 %由于勾股数的和一定是偶数，所以这里只用L/2的长度  %x有第i个数，表示周长为2i的三角形可以有几种构成整数边直角三角形的办法
for m=2:sqrt(L/2) 
    f=unique(factor(m));
    k=1:m-1; 
    for l=f,k(l:l:end)=0;end 
    if f(1)~=2,k(1:2:end)=0;end  
    k=k(k>0);%最后k是奇偶和m不同，且与m互质的小于m的数    
   for n=k %从k中取出一个值赋给n
    hs=m*(m+n); %2*hs就是周长         
    if 2*hs>L;break;end %周长超过L，不用考虑
    x(hs:hs:end)=x(hs:hs:end)+1;           %将这组勾股数三角形周长及其整数倍的构造办法增加1  
   end
end
num=sum(x==1)  %统计只有一种构造办法的个数 toc