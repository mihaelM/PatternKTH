function mfccs = normM (mfccs, t_res)
mfccs = (mfccs - repmat(mean(mfccs,2), [1 length(t_res)])) ./ repmat(std(mfccs,0,2), [1 length(t_res)]);