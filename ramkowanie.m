function r = ramkowanie(x,okno,n,d,ilosc_ramek)

    okno=okno(:);
    
for i=1:ilosc_ramek-1
    
    r(:,i) = x((i-1)*(d-n)+1:(i-1)*(d-n)+d).*okno;
    
end
end