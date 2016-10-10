* Formula from prop to OR 
* (0.069*(1-0.105)) / (0.105*(1-0.069));

ods pdf file="c:/temp/seqdesign.pdf" style=journal;
proc seqdesign boundaryscale=pvalue;
 TwoSampleFreq: design 
                nstages=1
                alt=twosided alpha=0.05 beta=0.20;
 samplesize model=twosamplefreq(nullprop=0.105 prop=0.069 test=logor);
run;

ods graphics on;
proc seqdesign boundaryscale=pvalue errspend plots=all;
 TwoSidedOBrienFleming: design
                       alt=twosided alpha=0.05 beta=0.20 
                       method(alpha)= errfuncobf
                       method(beta) = errfuncobf
                       stop=both(betaboundary=nonbinding)
                       nstages=3 info=cum(0.5, 0.67, 1);
 samplesize model=twosamplefreq(nullprop=0.105 prop=0.069 test=logor);
run;
ods graphics off;
ods pdf close;