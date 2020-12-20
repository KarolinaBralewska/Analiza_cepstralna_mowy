clear all;
clc;
%%
load('sygnaly.mat');
%%
len1=length(sygnaly1);
len2=length(sygnaly2);
len3=length(sygnaly3);
len4=length(sygnaly4);
len5=length(sygnaly5);
len6=length(sygnaly6);
len7=length(sygnaly7);
len8=length(sygnaly8);
len9=length(sygnaly9);
len10=length(sygnaly10);
len11=length(sygnaly11);
len12=length(sygnaly12);

cep1=zeros(24,len1);
cep2=zeros(24,len2);
cep3=zeros(24,len3);
cep4=zeros(24,len4);
cep5=zeros(24,len5);
cep6=zeros(24,len6);
cep7=zeros(24,len7);
cep8=zeros(24,len8);
cep9=zeros(24,len9);
cep10=zeros(24,len10);
cep11=zeros(24,len11);
cep12=zeros(24,len12);
%%
for i=1:len1
    x1=sygnaly1{i};
    cep1(:,i)=cepstrum_test(x1);
   
    x2=sygnaly2{i};
    cep2(:,i)=cepstrum_test(x2);
    
end

for i=1:len3
    
    x3=sygnaly3{i};
    cep3(:,i)=cepstrum_test(x3);
    
    x4=sygnaly4{i};
    cep4(:,i)=cepstrum_test(x4);
    
end


for i=1:len5
    
    x5=sygnaly5{i};
    cep5(:,i)=cepstrum_test(x5);
    
    x6=sygnaly6{i};
    cep6(:,i)=cepstrum_test(x6);
    
end

for i=1:len7
    
    x7=sygnaly7{i};
    cep7(:,i)=cepstrum_test(x7);
    
    x8=sygnaly8{i};
    cep8(:,i)=cepstrum_test(x8);
   
end

for i=1:len9
    
    x9=sygnaly9{i};
    cep9(:,i)=cepstrum_test(x9);
    
    x10=sygnaly10{i};
    cep10(:,i)=cepstrum_test(x10);
    
end

for i=1:len11
    x11=sygnaly11{i};
    cep11(:,i)=cepstrum_test(x11);
    
    x12=sygnaly12{i};
    cep12(:,i)=cepstrum_test(x12);
    
end