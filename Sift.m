function [ fa da ] = Sift( I, peak_thresh )

I = single(rgb2gray(I)) ;
[fa,da] = vl_sift(I, 'PeakThresh', peak_thresh) ;

end

