clear all;
clc;
%% załadowanie sygnałów i wprowadzenie sygnałów bazowych

load('sygnaly.mat');

sygnal_bazowy_kobiety_a=    [6.1480;-2.0726;-0.9406;-5.5055;-0.6550;-5.0115;-0.4676;	
                             3.6322;-2.3357;-2.6116;-1.3457;-1.0644;-0.3951;-0.4584;-0.3241;
                            -1.1692;-0.2992; -1.1100;-1.0817;-0.5883;-0.9108;0.2264;-1.2263;-1.0113];

sygnal_bazowy_mezczyzni_a=  [10.1820;-2.0222;0.6494	;-3.5483;-2.3027;-3.0364;-1.0150;1.9851;1.9037;
                             0.2511;-0.1635;-0.2425;0.5550;0.8906;-0.3911;0.5281;0.1578;-1.5023;
                            -0.4111;-0.0153	;-0.1798;-0.3574;0.4057;0.5794];
                        
sygnal_bazowy_kobiety_u=    [4.5439;4.0265;5.7107;-4.0151;-2.6016;-2.7615;-3.9816;-1.0390;-0.7494;-0.3680;
                             0.2244	;-0.5424;-2.8051;-1.3662;-0.8841;-1.7760;-0.6914;-0.6158;0.2220	;-0.1220;
                             -0.9637;-1.2262;-1.0966;0.0803];


sygnal_bazowy_mezczyzni_u=  [6.7273;6.1021;5.6208;2.9812;-0.3274;-0.6218;-1.4553;-1.3056;-0.1368;0.1628;
                            -0.4520;0.2058;0.1574;-0.1734;-0.5894;-0.8016;-0.1386;-0.7028;-1.0956;-0.0400;1.0511;
                             0.1868;-0.1824;0.1605];

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
%% obliczenie odległości euklidesowej dla kolejnych sygnałów
for i=1:len1
    x1=sygnaly1{i};
    cep1(:,i)=cepstrum_test(x1);
    
    x2=sygnaly2{i};
    cep2(:,i)=cepstrum_test(x2);
    
end

odleglosc1=porownanie(sygnal_bazowy_kobiety_a,cep1);
odleglosc2=porownanie(sygnal_bazowy_kobiety_u,cep2);

for i=1:len3
    
    x3=sygnaly3{i};
    cep3(:,i)=cepstrum_test(x3);
    
    x4=sygnaly4{i};
    cep4(:,i)=cepstrum_test(x4);
    
end

odleglosc3=porownanie(sygnal_bazowy_mezczyzni_a,cep3);
odleglosc4=porownanie(sygnal_bazowy_mezczyzni_u,cep4);

for i=1:len5
    
    x5=sygnaly5{i};
    cep5(:,i)=cepstrum_test(x5);
    
    x6=sygnaly6{i};
    cep6(:,i)=cepstrum_test(x6);
    
end

odleglosc5=porownanie(sygnal_bazowy_kobiety_a,cep5);
odleglosc6=porownanie(sygnal_bazowy_kobiety_u,cep6);

for i=1:len7
    
    x7=sygnaly7{i};
    cep7(:,i)=cepstrum_test(x7);
    
    x8=sygnaly8{i};
    cep8(:,i)=cepstrum_test(x8);
   
end

odleglosc7=porownanie(sygnal_bazowy_mezczyzni_a,cep7);
odleglosc8=porownanie(sygnal_bazowy_mezczyzni_u,cep8);

for i=1:len9
    
    x9=sygnaly9{i};
    cep9(:,i)=cepstrum_test(x9);
    
    x10=sygnaly10{i};
    cep10(:,i)=cepstrum_test(x10);
    
end

odleglosc9=porownanie(sygnal_bazowy_mezczyzni_a,cep9);
odleglosc10=porownanie(sygnal_bazowy_mezczyzni_u,cep10);

for i=1:len11
    x11=sygnaly11{i};
    cep11(:,i)=cepstrum_test(x11);
  
    x12=sygnaly12{i};
    cep12(:,i)=cepstrum_test(x12);
    
end

odleglosc11=porownanie(sygnal_bazowy_kobiety_a,cep11);
odleglosc12=porownanie(sygnal_bazowy_kobiety_u,cep12);

%% Wykresy odległości euklidesowej dla kolejnych MFCC dla sygnałów zaburzonych w porównaniu z sygnałami zdrowymi
% figure('Name','Porównanie odległości euklidesowej dla głoski "a" kobiet zdrowych i z dysfonią');
% for j=1:12
% 
% subplot(4,3,j);
% plot(odleglosc1(j,:),'k');
% hold on;
% plot(odleglosc5(j,:),'r');
% hold off;
% title('MFCC nr:',j);
% 
% end
% 
% figure('Name','Porównanie odległości euklidesowej dla głoski "a" kobiet zdrowych i z niedowładem mięśnia krtani');
% for j=1:12
% 
% subplot(4,3,j);
% plot(odleglosc1(j,:),'k');
% hold on;
% plot(odleglosc11(j,:),'r');
% hold off;
% title('MFCC nr:',j);
% 
% end

% figure('Name','Porównanie odległości euklidesowej dla głoski "u" kobiet zdrowych i z dysfonią');
% for j=1:12
% 
% subplot(4,3,j);
% plot(odleglosc2(j,:),'k');
% hold on;
% plot(odleglosc6(j,:),'r');
% hold off;
% title('MFCC nr:',j);
% 
% end
% 
% figure('Name','Porównanie odległości euklidesowej dla głoski "u" kobiet zdrowych i z niedowładem mięśnia krtani');
% for j=1:12
% 
% subplot(4,3,j);
% plot(odleglosc2(j,:),'k');
% hold on;
% plot(odleglosc12(j,:),'r');
% hold off;
% title('MFCC nr:',j);
% 
% end

figure('Name','Porównanie odległości euklidesowej dla głoski "a" mężczyzn zdrowych i z zapaleniem krtani');
for j=1:12

subplot(4,3,j);
plot(odleglosc3(j,:),'k');
hold on;
plot(odleglosc7(j,:),'r');
hold off;
title('MFCC nr:',j);

end

figure('Name','Porównanie odległości euklidesowej dla głoski "u" mężczyzn zdrowych i z zapaleniem krtani');
for j=1:12

subplot(4,3,j);
plot(odleglosc4(j,:),'k');
hold on;
plot(odleglosc8(j,:),'r');
hold off;
title('MFCC nr:',j);

end

figure('Name','Porównanie odległości euklidesowej dla głoski "a" mężczyzn zdrowych i z rakiem strun głosowych');
for j=1:12

subplot(4,3,j);
plot(odleglosc3(j,:),'k');
hold on;
plot(odleglosc9(j,:),'r');
hold off;
title('MFCC nr:',j);

end

figure('Name','Porównanie odległości euklidesowej dla głoski "u" mężczyzn zdrowych i z rakiem strun głosowych');
for j=1:12

subplot(4,3,j);
plot(odleglosc3(j,:),'k');
hold on;
plot(odleglosc10(j,:),'r');
hold off;
title('MFCC nr:',j);

end

%% Funkcja obliczająca odległość euklidesową
function odleglosc_euklidesowa=porownanie(sygnal_bazowy,sygnal_analizowany)
                  
odleglosc_euklidesowa=sqrt((sygnal_bazowy-sygnal_analizowany).^2);
odleglosc_euklidesowa=odleglosc_euklidesowa(1:12,:);

                  
end
