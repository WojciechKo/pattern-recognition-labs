% EPART - linear classification

[tvec tlab tstv tstl] = readSets();
% we have image data and labels in separate matrices this time 
% let's look at our data
[size(tvec) size(tlab)]
[size(tstv) size(tstl)]
unique(tlab)
unique(tstl)
labels = unique(tlab)';
% how many samples of individual digits are there?
[labels; sum(tlab == labels)]
[labels; sum(tstl == labels)]

% are these real digits?
imshow(reshape(tvec(1,:), 28, 28))
% we need to transpose and invert image
imshow(1 - reshape(tvec(1,:), 28, 28)')

% let's return to work
% the first problem are the labels - zero is not a valid index
% we map digit to more convenient labels by simple shift
tlab += 1;
tstl += 1;

% '0' has label 1 now; '1' -> 2 and so on
labels = unique(tlab)';
[labels; sum(tlab == labels)]

% now it's time to reduce dimensionality of our data
% today 57 primary components seems to be right choice :)
[mu trmx] = prepTransform(tvec, 57);

tvec = pcaTransform(tvec, mu, trmx);
tstv = pcaTransform(tstv, mu, trmx);

% after transformation we're ready to prepare 
% linear classifiers' ensemble


%%%% YOUR CODE GOES HERE %%%%

% (some work is hidden deep in trainOVOensemble dependencies)
ovo = trainOVOensamble(tvec, tlab);

% let's classify something (lincls to modify)
votes = voting(tvec, ovo);

% what's the result of voting
votes(1:8, :)

% produce classification decisions
[mv mid] = max(votes, [], 2);
clsres = mid;

% add reject desision when there's disagreement
clsres(mv ~= 9) = 11; 

cfmx = confMx(tlab, clsres)
errcf = compErrors(cfmx)

% after that you can start experiments with 
% a better classification approach
