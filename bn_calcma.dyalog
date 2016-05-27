 z←bn_calcma input
 nr←(-1)↑⍴input
 i←1
 mu←0
 sigma2←0
 :While i≤nr
     x←input[i;;]
     mu←mu+mean x
     sigma2←sigma2+stdev x
     i←i+1
 :EndWhile
 muma←mu÷nr
 sma←sigma2÷nr
 z←(muma)(sma)
