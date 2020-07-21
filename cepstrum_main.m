clear all;
clc;

%% za�adowanie sygna�u
% x- sygna� mowy
% fp- czestotliwosc probkowania
[x, fp]= audioread('TZ1M1_5_.wav');

N=length(x);%liczba probek
%t=[0:N-1]./fp;
%figure(1); plot(t,x); %sygna� wejsciowy

%% preemfaza- wzmocnienie wysokich czestotliwosci

x = filter([1 -0.9375], 1, x);%na podstawie ksi�zki 'Cyfrowe przetwarzanie sygna��w: od teorii do zastosowa�'
%figure(2); plot(t,x); %sygnal po preemfazie

%% ramkowanie i okno Hamminga

dlugosc_ramki = 25;%w milisekundach
r = dlugosc_ramki*0.001*fp;%liczba pr�bek ramki
nakladkowanie = 10;%w milisekundach
n = nakladkowanie*0.001*fp;%liczba probek nakladkowania

ilosc_ramek = round((N-r)/(r-n));

hamm = hamming(r);

sygnal_po_segmentacji=ramkowanie(x,hamm,n,r,ilosc_ramek);


%% szybka transformata Fouriera
p = 2^nextpow2(r);%nextpow2 oblicza nast�pn� pot�g� 2 wy�sz� ni� d
%zwi�ksza wydajno�� fft gdy d�ugo�� nie jest pot�g� 2.

for i=1:ilosc_ramek-1
x_fft(:,i) = fft(sygnal_po_segmentacji(:,i),p);
end

%% banki melowe
ilosc_filtrow = 25;
d=1+(p/2);

mel = filtr_mel(ilosc_filtrow,fp,d);

x_mel = mel * abs( x_fft(1:d,:)).^2;

%% DCT
% wynik DCT matematycznie jest r�wnowa�ny wynikowi FFT z sekwencji 2x razy d�u�szej,
% kt�rej 2. cz�� jest odbiciem lustrzanym 1. cz�ci. Przez obliczenie
% modu�u i logarytmu doprowadzi�am do takiej symetrii. Mo�na wi�c u�y� FFT 
% dla ca�ego bloku wsp�czynnik�w albo DCT dla po�owy. R�nica jest tylko taka,
% �e w DCT b�dzie 4 razy mniej operacji. 

log_cep=log(x_mel);

c = dct(log_cep);
c(1,:)=[];

mesh(c);
