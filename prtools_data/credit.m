%CREDIT Credit card approval data
%PRTools dataset import from UCI, 690 objects, 15 mixed features, 2 classes
%
%  A = CREDIT
%
%DESCRIPTION
%This command downloads one of the UCI data sets, converts it into PRTools
%format and stores it locally for future use. Consult the <a href="http://archive.ics.uci.edu/ml/datasets/Credit+Approval">related website</a>
%for further information. Please make the appropriate references in
%publications that make use of this dataset.
%
%This dataset contains a number of categorical features with N > 2
%categories. They may be converted to N new real features by CAT2REAL.
%
%There are missing values, coded by NaNs. They may be handled by MISVAL.
%
%SEE ALSO <a href="http://37steps.com/prtools">PRTools Guide</a>, <a href="http://archive.ics.uci.edu/ml/">UCI Website</a>
%PRTOOLS, DATASETS, SETFEATDOM, MISVAL, CAT2REAL

% Copyright: R.P.W. Duin, r.p.w.duin@37steps.com

function a = credit

form = '%s%n%n%s%s%s%s%n%s%s%n%s%s%n%n%s';
form = 'cnnccccnccnccnnc';
a = pr_download_uci('Credit+Approval','crx.data',form);