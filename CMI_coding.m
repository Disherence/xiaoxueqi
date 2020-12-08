function y = CMI_coding(y1)

a=reshape(y1',1,numel(y1));
n=0;
m=1;
b=zeros(1,length(a));
c=zeros(1,length(a));
for k=1:length(a)
    m=mod(n,2);   %CMI编码结果“00”和“11”交替的判决语句;
    if (a(k)==0)  %如果输入码为“0”，则进行下一步;
        b(k)=0;   %CMI编码输出的前一位为“0”;
        c(k)=1;   %CMI编码输出的后一位为“1”;
    end
     if (a(k)==0)
         continue;
     end
     
    if (a(k)==1 && m==1)  %如果输入码为“1”且判决码为1，则进行下一步;
        b(k)=1;           %CMI编码输出的前一位为“1”;
        c(k)=1;           %CMI编码输出的后一位为“1”;
         n=n+1;           %判决辅助码加“1”
         
    end
    
    if (a(k)==1 && m==0)    %如果输入码为“1”且判决码为0，则进行下一步;
        b(k)=0;            %CMI编码输出的前一位为“0”;
        c(k)=0;            %CMI编码输出的后一位为“0”;
         n=n+1;            %判决辅助码加“1”
    end
    
end
 
%display('Display encode result:');
y=zeros(1,2*length(a));
for k=1:length(a)
    if (b(k)==1 &&c(k)==1)     %如果编码后的前一位和后一位都为“1”，则进行下一步;
       y(1,2*k-1)=1;y(1,2*k)=1;
       %fprintf('   1 1   ') ;   %CMI编码输出为"11";
    else if (b(k)==0 &&c(k)==0)   %如果编码后的前一位和后一位都为“0”，则进行下一步;
       y(1,2*k-1)=0;y(1,2*k)=0;    
       %fprintf('   0 0   ') ; %CMI编码输出为"00";
    else 
       y(1,2*k-1)=0;y(1,2*k)=1;      
      % fprintf('   0 1   ') ;  %CMI编码输出为"01";
        end
    end
end