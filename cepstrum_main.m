function [c,mean_c] = cepstrum_main(x,fp,tmp)
%% za�adowanie sygna�u
% x- sygna� mowy
% fp- czestotliwosc probkowania
%[x, fp]= audioread(x1);
% sound(x,fp);
% figure(1)
% spectrogram(x);

N=length(x);
t=[0:1/fp:(N-1)./fp];

% figure;
% plot(t,x); %sygna� wejsciowy

%% preemfaza- wzmocnienie wysokich czestotliwosci

x = filter([1 -0.9735], 1, x);%na podstawie ksi�zki 'Cyfrowe przetwarzanie sygna��w: od teorii do zastosowa�'
% figure;
% plot(t,x); %sygnal po preemfazie


%% ramkowanie i okno Hamminga

dlugosc_ramki = 25;%w milisekundach
r = dlugosc_ramki*0.001*fp;%liczba pr�bek ramki
nakladkowanie = 10;%w milisekundach
n = nakladkowanie*0.001*fp;%liczba probek nakladkowania

liczba_ramek = round((N-r)/(r-n))+1;%%mathworks https://uk.mathworks.com/help/audio/ref/mfcc.html

hamm = hamming(r);

sygnal_po_segmentacji=ramkowanie(x,hamm,n,r,liczba_ramek);


%% szybka transformata Fouriera
p = 2^nextpow2(r);%nextpow2 oblicza nast�pn� pot�g� 2 wy�sz� ni� r
%zwi�ksza wydajno�� fft gdy d�ugo�� nie jest pot�g� 2.

%odrzucona ostatnia ramka
for i=1:liczba_ramek-1
x_fft(:,i) = fft(sygnal_po_segmentacji(:,i),p);
end

%% banki melowe
liczba_filtrow = 25;
b=1+(p/2);%liczba pasm czestotliwosci

[mel,f] = filtr_mel(liczba_filtrow,fp,b);

x_mel = mel * abs( x_fft(1:b,:)).^2;
plot(abs( x_fft(1:b,:)).^2);
%% DCT
% wynik DCT matematycznie jest r�wnowa�ny wynikowi FFT z sekwencji 2x razy d�u�szej,
% kt�rej 2. cz�� jest odbiciem lustrzanym 1. cz�ci. Przez obliczenie
% modu�u i logarytmu doprowadzi�am do takiej symetrii. Mo�na wi�c u�y� FFT 
% dla ca�ego bloku wsp�czynnik�w albo DCT dla po�owy. R�nica jest tylko taka,
% �e w DCT b�dzie 4 razy mniej operacji. 

log_cep=log(x_mel);

c = dct(log_cep);
c(1,:)=[];

c=c(1:12,:);
c_tran=c';
mean_c=mean(c_tran);
mean_c=mean_c';


% % figure(4);
[r1, r2]=size(c);
r1=(1:r1);
wykres = imagesc(t,r1,c);
xlabel('Czas (s)');
ylabel('Numer wspolczynnika MFCC');
colormap(turbo);
colorbar;
set(gca, 'YDir', 'normal');
title('Zmiana  MFCC dla sygna�u: ',tmp);

% figure(5);
% mesh(c);
% title("Wykres wsp�czynnik�w melcepstralnych badanego sygna�u");
% xlabel("Ilo�� ramek");
% ylabel("numer mfcc");
% zlabel("Warto�� wsp�czynnik�w melcepstralnych");
