function pdf = pdf_indep(pts, para)
% Computes Gaussian probability density value with the assumption 
%	that features are independent
% pts - matrix of samples for which pdf should be computed (row == sample)
% para - structure with pdf_indep parameters:
%	para.labels - column vector of training set labels
%	para.mu - mean values of features (one row per class)
%	para.sig - standard deviations of features (one row per class)

% pdf - probability density matrix
%	number of rows == number of samples (rows) in pts
%	number of columns == number of classes

	% we know the dimensions of the result, so we allocate it
	pdf = zeros(rows(pts), rows(para.mu));
	
	% YOUR CODE GOES HERE
	
	% for each class you should compute multidimensional pdf
		% for each feature you should compute one-dimensional pdf for given feature
		%	remember that you have normpdf function in Octave
		
		% compute product of individual features' pdfs (features are independent!)
		
end