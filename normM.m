function mfccs = normM (mfccs, t_size)
mfccs = ( mfccs - repmat( mean(mfccs,2), [1 t_size] ) ) ./ repmat( std(mfccs,0,2), [1 t_size] );
% mean(x, 2) je po retcima srednja vrijednost, repeatamo na dobru
% vrijednost i podijelimo, sada s matricom analogno za devijaciju
%ovaj std racuna po drugoj dimenziji (recima) s faktorom N-1 devijaciju

%zero mean, unit variance