% load data and remap labels[tvec tlab tstv tstl] = readSets(); tlab += 1;tstl += 1;% remove columns with zero std toRemove = std(tvec) != 0;tvec = tvec(:, toRemove);tstv = tstv(:, toRemove);% Data is ready - first prepare ANN classifier% we'll need:%	activation function (actf)%	two matrices containing weights of our ANN%		let's close this code in separate function (crann)%	classifier function itself% x = -5:0.1:5;% plot(x, actf(x))%[hidl outl] = crann(2, 3, 2);%size(hidl)%size(outl)% xor data set%tset = [-1 1; 1 1; 1 -1; -1 -1];%tslb = [1; 2; 1; 2];%%res = anncls(tset, hidl, outl);%cmx = confMx(tslb, res)%compErrors(cmx)% classifier is ready; now time for training% we'll need:%	derivative of the activation function%	backprop function which performs iterative backpropagation training%plot(x, actdf(x))%[hhidl ooutl ter] = backprop(tset, tslb, hidl, outl, 0.1);%res = anncls(tset, hhidl, ooutl);%cmx = confMx(tslb, res)%compErrors(cmx)