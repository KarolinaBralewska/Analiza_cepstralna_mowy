function mel = filtr_mel(ilosc_filtrow, fp,r)

%zakres czestotliwosci
min_f = 0;
max_f = fp/2;
freq = [min_f max_f];
%zamiana na skale melow¹
f2m = 2595*(log10(1+freq/700));
fmin=min(f2m);
fmax=max(f2m);
szerokosc_filtru = (fmax-fmin)/(ilosc_filtrow+1);

f = linspace( min_f, max_f , r ); 

K = fmin+[0:ilosc_filtrow+1]*szerokosc_filtru;
m2f = 700 * (exp (K / 1125) -1);
mel = zeros( ilosc_filtrow, r );   

    for m = 1:ilosc_filtrow
      
        k = f>=m2f(m) & f<=m2f(m+1);          
        mel(m,k) = (f(k)-m2f(m)) / (m2f(m+1)-m2f(m));
        k = f>=m2f(m+1)&f<=m2f(m+2);        
        mel(m,k) = (m2f(m+2)-f(k)) /(m2f(m+2)-m2f(m+1));
        
    end
    
