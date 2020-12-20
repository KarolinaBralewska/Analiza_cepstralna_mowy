function mean_c = cepstrum_test(x1)
%% załadowanie sygnału
[x, fp]= audioread(x1);
N=length(x);
t=[0:1/fp:(N-1)./fp];

%% preemfaza- wzmocnienie wysokich czestotliwosci

x = filter([1 -0.9735], 1, x);%na podstawie ksiązki 'Cyfrowe przetwarzanie sygnałów: od teorii do zastosowań'
%% ramkowanie i okno Hamminga

dlugosc_ramki = 25;%w milisekundach
r = dlugosc_ramki*0.001*fp;%liczba próbek ramki
nakladkowanie = 10;%w milisekundach
n = nakladkowanie*0.001*fp;%liczba probek nakladkowania

liczba_ramek = round((N-r)/(r-n))+1;%%mathworks https://uk.mathworks.com/help/audio/ref/mfcc.html

hamm = hamming(r);

sygnal_po_segmentacji=ramkowanie(x,hamm,n,r,liczba_ramek);


%% szybka transformata Fouriera
p = 2^nextpow2(r);

%odrzucona ostatnia ramka
for i=1:liczba_ramek-1
x_fft(:,i) = fft(sygnal_po_segmentacji(:,i),p);
end

%% banki melowe
liczba_filtrow = 25;
b=1+(p/2);%liczba pasm czestotliwosci

[mel,f] = filtr_mel(liczba_filtrow,fp,b);

x_mel = mel * abs( x_fft(1:b,:)).^2;

%% DCT 
log_cep=log(x_mel);

c = dct(log_cep);
c(1,:)=[];

c_tran=c';
mean_c=mean(c_tran);
mean_c=mean_c';

