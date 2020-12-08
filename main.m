%empty the processing
clc;
close all;
clear all;
 
%original signal
clear;
fs=8000;%抽样频率
fc=100;
dt=1/fs;
Ts=dt;
t=0:dt:0.02-dt;
y=0.3*cos(2*pi*fc*t)+0.5*sin(4*pi*fc*t)+0.2*sin(8*pi*fc*t);%输入模拟信号
figure(1);
plot(t,y);
ylim([-2,2]);
title('源信号');
 
%PCM modulation
n=length(t);
y_PCM=PCMENC2(y,n);
figure(2);
stairs(y_PCM);
%zoom xon;
xlim([0 100]);
ylim([-0.2,1.2]);
title('PCM编码信号');
 
%CMI modulation
y_CMI = CMI_coding(y_PCM) ;
t2 = 0:Ts:41*Ts;
figure(3)
stairs(y_CMI);
xlim([0 200]);
ylim([-0.2 1.2]);
%zoom xon;axis([0 length(y_CMI) -0.2 1.2]);
title('CMI编码信号');
 
%Hamming modulation
y_Hamming=encode(y_CMI,7,4,'hamming') ;
figure(4)              
stairs(y_Hamming);
xlim([0 200]);
ylim([-0.2 1.2]);
%zoom xon;axis([0 length(y_Hamming) -0.2 1.2]);
title('Hamming编码');
 
%ASK modulaiton and rayleigh channel
y_DASK = ASK(y_Hamming);
 
%Hamming demodulation
y_DHamming=decode(y_DASK,7,4,'hamming'); 
figure(8)
stairs(y_DHamming);
xlim([0 200]);
ylim([-0.2 1.2]);
%zoom xon;axis([0 length(y_DHamming) -0.2 1.2]);
title('Hammming译码输出信号（CMI）');
 
%CMI demodulation
y_DCMI = CMI_decoding(y_DHamming);
figure(9)
stairs(y_DCMI);
xlim([0 100]);
ylim([-0.2 1.2]);
%zoom xon;axis([0 length(y_DCMI) -0.2 1.2]);
title('CMI译码输出信号（PCM信号）');
 
%PCM demodulation
y_DPCM=PCMDEC2(y_DCMI,n);
figure(10);
plot(t,y_DPCM);
ylim([-2 2]);
title('解码输出');
 
%original signal modulation
figure(11)
plot(t,y);ylim([-2 2]);hold on;
plot(t,y_DPCM);ylim([-2 2]);
title('发送和接收信号对比，蓝色为源信号，红色为接收信号');
 
%signal distortion
di=0;
for k=1:n
    d=(y(k)-y_DPCM(k))^2/n;
    di=di+d;
end
di=sqrt(di);
disp('失真度为 '); 
disp(di);
