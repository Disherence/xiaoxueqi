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
    if(b(k)==1 &&c(k)==1)          %如果CMI码的前序列和后序列为"1",则运行下一步;
       y_DCMI(k)=1;
       %fprintf(' 1 '); %输出显示"1";
    end
    if (b(k)==0 &&c(k)==0)         %如果CMI码的前序列和后序列都为"0",则运行下一步;
        y_DCMI(k)=1;
        %fprintf(' 1  ');  %输出显示"1";
    end
     if (b(k)==0 &&c(k)==1)        %如果CMI码的前序列为"0"且后序列为"1",则运行下一步;
        y_DCMI(k)=0;
        %fprintf(' 0  ');        %输出显示"0";
     end
end