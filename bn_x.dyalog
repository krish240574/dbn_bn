 z←bn_x x
 mu←mean x
 sigma2←stdev x
 epsilon←0.000001
 xhat←(firstimg-mu)÷(0.5*sigma2+epsilon)
 beta←(1,(isz×isz))⍴1
 gamma←(1,(isz×isz))⍴0
 yx←beta+gamma×xhat
 z←yx
