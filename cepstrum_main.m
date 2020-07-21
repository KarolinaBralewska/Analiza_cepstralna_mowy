clear all;
clc;

%% za³adowanie sygna³u
% x- sygna³ mowy
% fp- czestotliwosc probkowania
[x, fp]= audioread('TZ1M1_5_.wav');

N=length(x);%liczba probek
%t=[0:N-1]./fp;
%figure(1); plot(t,x); %sygna³ wejsciowy

%% preemfaza- wzmocnienie wysokich czestotliwosci

x = filter([1 -0.9375], 1, x);%na podstawie ksi¹zki 'Cyfrowe przetwarzanie sygna³ów: od teorii do zastosowañ'
%figure(2); plot(t,x); %sygnal po preemfazie

%% ramkowanie i okno Hamminga

dlugosc_ramki = 25;%w milisekundach
r = dlugosc_ramki*0.001*fp;%liczba próbek ramki
nakladkowanie = 10;%w milisekundach
n = nakladkowanie*0.001*fp;%liczba probek nakladkowania

ilosc_ramek = round((N-r)/(r-n));

hamm = hamming(r);

sygnal_po_segmentacji=ramkowanie(x,hamm,n,r,ilosc_ramek);


%% szybka transformata Fouriera
p = 2^nextpow2(r);%nextpow2 oblicza nastêpn¹ potêgê 2 wy¿sz¹ ni¿ d
%zwiêksza wydajnoœæ fft gdy d³ugoœæ nie jest potêg¹ 2.

for i=1:ilosc_ramek-1
x_fft(:,i) = fft(sygnal_po_segmentacji(:,i),p);
end

%% banki melowe
ilosc_filtrow = 25;
d=1+(p/2);

mel = filtr_mel(ilosc_filtrow,fp,d);

x_mel = mel * abs( x_fft(1:d,:)).^2;

%% DCT
% wynik DCT matematycznie jest równowa¿ny wynikowi FFT z sekwencji 2x razy d³u¿szej,
% której 2. czêœæ jest odbiciem lustrzanym 1. czêœci. Przez obliczenie
% modu³u i logarytmu doprowadzi³am do takiej symetrii. Mo¿na wiêc u¿yæ FFT 
% dla ca³ego bloku wspó³czynników albo DCT dla po³owy. Ró¿nica jest tylko taka,
% ¿e w DCT bêdzie 4 razy mniej operacji. 

log_cep=log(x_mel);

c = dct(log_cep);
c(1,:)=[];

mesh(c);
