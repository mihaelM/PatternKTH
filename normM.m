function mfccs = normM (mfccs, t_size)
mfccs = ( mfccs - repmat( mean(mfccs,2), [1 t_size] ) ) ./ repmat( std(mfccs,0,2), [1 t_size] );
