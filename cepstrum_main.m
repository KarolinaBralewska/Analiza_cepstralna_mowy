function [c,mean_c] = cepstrum_main(x,fp,tmp)
%% za³adowanie sygna³u
% x- sygna³ mowy
% fp- czestotliwosc probkowania
%[x, fp]= audioread(x1);
% sound(x,fp);
% figure(1)
% spectrogram(x);

N=length(x);
t=[0:1/fp:(N-1)./fp];

% figure;
% plot(t,x); %sygna³ wejsciowy

%% preemfaza- wzmocnienie wysokich czestotliwosci

x = filter([1 -0.9735], 1, x);%na podstawie ksi¹zki 'Cyfrowe przetwarzanie sygna³ów: od teorii do zastosowañ'
% figure;
% plot(t,x); %sygnal po preemfazie


%% ramkowanie i okno Hamminga

dlugosc_ramki = 25;%w milisekundach
r = dlugosc_ramki*0.001*fp;%liczba próbek ramki
nakladkowanie = 10;%w milisekundach
n = nakladkowanie*0.001*fp;%liczba probek nakladkowania

liczba_ramek = round((N-r)/(r-n))+1;%%mathworks https://uk.mathworks.com/help/audio/ref/mfcc.html

hamm = hamming(r);

sygnal_po_segmentacji=ramkowanie(x,hamm,n,r,liczba_ramek);


%% szybka transformata Fouriera
p = 2^nextpow2(r);%nextpow2 oblicza nastêpn¹ potêgê 2 wy¿sz¹ ni¿ r
%zwiêksza wydajnoœæ fft gdy d³ugoœæ nie jest potêg¹ 2.

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
% wynik DCT matematycznie jest równowa¿ny wynikowi FFT z sekwencji 2x razy d³u¿szej,
% której 2. czêœæ jest odbiciem lustrzanym 1. czêœci. Przez obliczenie
% modu³u i logarytmu doprowadzi³am do takiej symetrii. Mo¿na wiêc u¿yæ FFT 
% dla ca³ego bloku wspó³czynników albo DCT dla po³owy. Ró¿nica jest tylko taka,
% ¿e w DCT bêdzie 4 razy mniej operacji. 

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
title('Zmiana  MFCC dla sygna³u: ',tmp);

% figure(5);
% mesh(c);
% title("Wykres wspó³czynników melcepstralnych badanego sygna³u");
% xlabel("Iloœæ ramek");
% ylabel("numer mfcc");
% zlabel("Wartoœæ wspó³czynników melcepstralnych");
