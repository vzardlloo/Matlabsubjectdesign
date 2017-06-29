triNum = 0; k = 0;count = 0;
while count < 500
    k = k + 1;
    triNum = triNum + k;
    up = sqrt(triNum);   
    count = sum(~mod(uint32(triNum), 1:uint32(up)))*2 - (up == floor(up));
end
triNum