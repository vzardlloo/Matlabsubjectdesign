triNum = 0; k = 0;count = 0;        //初始化数据
while count < 500                   //判断约数数量
    k = k + 1;
    triNum = triNum + k;            //根据上一个三角形数来构造当前三角形数
    up = sqrt(triNum);          
    count = sum(~mod(uint32(triNum), 1:uint32(up)))*2 - (up == floor(up));  //求出当前三角形数的约数数量
end
triNum
