function y_DCMI=CMI_decoding(y)

a=reshape(y',1,numel(y)); 
b=zeros(1,length(a)/2); 
for i=1:length(a)/2 
  b(i)=a(i*2-1);
end
c=zeros(1,length(a)/2);   
for i=1:length(a)/2 
  c(i)=a(i*2);
end
y_DCMI=zeros(1,length(a)/2);     
%display('Display decode result:');
for k=1:length(a)/2
    if(b(k)==1 &&c(k)==1)          %���CMI���ǰ���кͺ�����Ϊ"1",��������һ��;
       y_DCMI(k)=1;
       %fprintf(' 1 '); %�����ʾ"1";
    end
    if (b(k)==0 &&c(k)==0)         %���CMI���ǰ���кͺ����ж�Ϊ"0",��������һ��;
        y_DCMI(k)=1;
        %fprintf(' 1  ');  %�����ʾ"1";
    end
     if (b(k)==0 &&c(k)==1)        %���CMI���ǰ����Ϊ"0"�Һ�����Ϊ"1",��������һ��;
        y_DCMI(k)=0;
        %fprintf(' 0  ');        %�����ʾ"0";
     end
end