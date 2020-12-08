function b=PCMDEC2(code,n)

for i=1:n
    if code(8*(i-1)+2:8*(i-1)+4)==[0 0 0]
        temp=0;del=1;
    elseif code(8*(i-1)+2:8*(i-1)+4)==[0 0 1]
        temp=16;del=1;
    elseif code(8*(i-1)+2:8*(i-1)+4)==[0 1 0]
        temp=32;del=2;
    elseif code(8*(i-1)+2:8*(i-1)+4)==[0 1 1]
        temp=64;del=4;
    elseif code(8*(i-1)+2:8*(i-1)+4)==[1 0 0]
        temp=128;del=8;
    elseif code(8*(i-1)+2:8*(i-1)+4)==[1 0 1]
        temp=256;del=16;
    elseif code(8*(i-1)+2:8*(i-1)+4)==[1 1 0]
        temp=512;del=32;
    elseif code(8*(i-1)+2:8*(i-1)+4)==[1 1 1]
        temp=1024;del=64;
    end
    b1=0;
    for m=5:8
        b1=2*b1+code(8*(i-1)+m);
    end
    b(i)=(2*code(8*(i-1)+1)-1)*round(temp+(b1+0.5)*del)/2047;
end
