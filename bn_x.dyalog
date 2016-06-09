 z←bn_x x
 mu←mean,x
 sigma2←stdev,x
 epsilon←0.000001
 var←(1÷g_isz)×+/(x-mu)*2
 xhat←(1,g_isz×g_isz)⍴,((g_b[1;]+g_firstimg+.×g_w[1;;])-mu)÷(0.5*sigma2+epsilon)
 beta←(1,g_isz×g_isz)⍴1
 gamma←(1,(g_isz×g_isz))⍴0
 yx←beta+gamma×xhat
 z←(yx)(mu)(sigma2)(xhat)(var)
