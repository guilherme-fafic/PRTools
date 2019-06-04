%PREX_CLASSIFIERS
%
% Test all classifier defaults

classf = {knnc([],1),knnc,parzenc,parzendc,nmc,nmsc,udc,ldc,qdc,mogc,...
          fisherc,quadrc,klldc,pcldc,treec,randomforestc,dtc,svc,nusvc, ...
          rbsvc,libsvc,nulibsvc,rblibsvc,loglc,bpxnc,lmnc,rbnc, ...
          subsc,rnnc,fdsc,perlc,naivebc,adaboostc};

classf = { ...
  setname(knnc([],1),'1-NN'), ...
  setname(knnc,'k-NN'), ...
  setname(parzenc,'ParzenC'), ...
  setname(parzendc,'ParzenD'), ...
  setname(nmc,'NM'), ...
  setname(nmsc,'NMS'), ...
  setname(udc,'UDA'), ...
  setname(ldc,'LDA'), ...
  setname(qdc,'QDA'), ...
  setname(mogc,'MOG'), ...
  setname(fisherc,'Fisher'), ...
  setname(treec,'CART'), ...
  setname(randomforestc,'RandForest'), ...
  setname(dtc,'VDTree'), ...
  setname(svc,'SVC'), ...
  setname(nusvc,'nu-SVC'), ...
  setname(rbsvc,'rb-SVC'), ...
  setname(libsvc,'LibSVC'), ...
  setname(nulibsvc,'nu-LibSVC'), ...
  setname(rblibsvc,'rb-LibSVC'), ...
  setname(loglc,'Logistic'), ...
  setname(bpxnc,'BackProp-NN'), ...
  setname(lmnc,'LM-NN'), ...
  setname(rbnc,'RB-NN'), ...
  setname(subsc,'Subspace'), ...
  setname(rnnc,'Random-NN'), ...
  setname(fdsc([],[],[],[],[],loglc),'DisSpaceL'), ...
  setname(perlc,'Perceptron'), ...
  setname(naivebc,'NaiveBayes'), ...
  setname(adaboostc,'Adaboost')};

%classf = classf(1:10);
trainsize = 50;
testsize = 10000;
iter = 25;

e = zeros(iter,numel(classf));
s = zeros(iter,numel(classf));

for i=1:iter
  randreset(i);
  a = gendatd([trainsize trainsize]);
  t = gendatd([testsize testsize]);
  for j=1:numel(classf)
    t0 = tic;
    w = a*classf{j}*setbatch;
    e(i,j) = t*w*testc;
    t1 = toc(t0);
    s(i,j) = t1;
    fprintf('%2i %2i %20s %7.3f \n',i,j,getname(classf{j}),e(i,j));
end
end