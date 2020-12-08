function  y_DASK =ASK(code)

codn=length(code);
fc=10;
fs=fc*6;
code_len=8;
for i=1:codn                 % �������ֻ����ź�
    x((i-1)*code_len+1:code_len*i)=code(i);
end
car=cos(2*pi*fc/fs*(0:length(x)-1)); 
y_ASK=x.*car;
figure(5);
plot(y_ASK);
xlim([0 800]);
ylim([-5 5]);
%zoom xon;axis([0 length(y_ASK) -1.2 1.2]);
title('ASK�����ź�');

%˥���ŵ�
%y_rayleigh=Rayleigh(y_ASK);
%figure(6);
%plot(y_rayleigh);zoom xon;
%axis([0 800 -2 2]); 
%axis([0 length(y_rayleigh) -2 2]); 
%title('˥���ŵ�'); 
chan=rayleighchan(1/15000,0);
%1/15000�������ǵĲ���Ƶ�ʣ�Ҳ������һ���������Ƕ೤һ��ʱ�䵥λ��
%0������������Ƶ��
y_rayleigh=filter(chan,y_ASK);
figure(6);
plot(abs(y_rayleigh));zoom xon;
axis([0 800 -5 5]); 
%axis([0 length(y_rayleigh) -5 5]); 
title('˥���ŵ�'); 

%���
yn3=y_rayleigh.*car;
for i=1:length(yn3)
    if(yn3(i)>=0.02)
        yn3(i)=1;
    else 
        yn3(i)=0;
    end
end
y_DASK=zeros(1,codn);
i1=1;
for i=1:8:length(yn3)
    y_DASK(i1)=yn3(i);
    i1=i1+1;
end
figure(7);
%plot(y_DASK);
stairs(y_DASK);
xlim([0 200]);
ylim([-0.2 1.2]);
%zoom xon;axis([0 length(y_DASK) -0.2 1.2]);
title('ASK����źţ�Hamming��');