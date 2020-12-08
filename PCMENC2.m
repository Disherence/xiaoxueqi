function a=PCMENC2(y,n)                      %SŒ™ ‰»Î–≈∫≈
a=zeros(1,8*n);
for i=1:n
    a(8*(i-1)+1)=(sign(y(i))+1)/2;
    s=round(abs(y(i))*2047);
    if s<16
        a(8*(i-1)+2:8*(i-1)+4)=[0 0 0];temp=0;del=1;
    elseif s<32
        a(8*(i-1)+2:8*(i-1)+4)=[0 0 1];temp=16;del=1;
    elseif s<64
        a(8*(i-1)+2:8*(i-1)+4)=[0 1 0];temp=32;del=2;
    elseif s<128
        a(8*(i-1)+2:8*(i-1)+4)=[0 1 1];temp=64;del=4;
    elseif s<256
        a(8*(i-1)+2:8*(i-1)+4)=[1 0 0];temp=128;del=8;
    elseif s<512
        a(8*(i-1)+2:8*(i-1)+4)=[1 0 1];temp=256;del=16;
    elseif s<1024
        a(8*(i-1)+2:8*(i-1)+4)=[1 1 0];temp=512;del=32;
    elseif s<2048
        a(8*(i-1)+2:8*(i-1)+4)=[1 1 1];temp=1024;del=64;
    end
    b=zeros(1,4);
    m=4;
    s1=fix((s-temp)/del);
    while s1>0
        b(1,m)=mod(s1,2);
        s1=(s1-b(1,m))/2;
        m=m-1;
    end
    a(8*(i-1)+5:8*i)=b;
end
