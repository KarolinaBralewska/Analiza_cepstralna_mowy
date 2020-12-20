function [mel,f] = filtr_mel(liczba_filtrow, fp,r)

%zakres czestotliwosci
min_f = 0;
max_f = fp/2;%czêstotliwoœæ Niquista
freq = [min_f max_f];
%zamiana na skale melow¹
f2m = 2595*(log10(1+freq/700));
fmin=min(f2m);
fmax=max(f2m);

f = linspace( min_f, max_f , r );

sf = (fmax-fmin)/(liczba_filtrow+1); 

%zamiana na skalê czêstotliwoœciow¹
K = fmin+[0:liczba_filtrow+1]*sf;
m2f = 700 * (exp (K / 1125) -1);
mel = zeros( liczba_filtrow, r );   

    for m = 1:liczba_filtrow
        k = f<m2f(m);
        mel(m,k)=0;
        k = f>=m2f(m) & f<=m2f(m+1);          
        mel(m,k) = (f(k)-m2f(m)) / (m2f(m+1)-m2f(m));
        k = f>=m2f(m+1)&f<=m2f(m+2);        
        mel(m,k) = (m2f(m+2)-f(k)) /(m2f(m+2)-m2f(m+1));
        k = f>m2f(m+2);
        mel(m,k)=0;
    end
    
%     plot(f, mel);
%     title('Bank filtrów melowych');
%     xlabel('Czêstotliwoœæ (Hz)');
%     ylabel('Amplituda');
 %Spoken Language Processing: A guide to theory, algorithm, and system development. 
   
