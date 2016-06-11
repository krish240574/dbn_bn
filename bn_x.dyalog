 z←bn_x x
 mu←mean,x
 sigma2←stdev,x
 epsilon←0.000001
 var←(1÷g_isz)×+/,(x-mu)*2
 tmp←(g_isz,g_isz)⍴g_b[1;;]
 xhat←(1,g_isz×g_isz)⍴,((tmp+x+.×g_w[1;;])-mu)÷(sigma2+epsilon)*0.5
 beta←(1,g_isz×g_isz)⍴0
 gamma←(1,(g_isz×g_isz))⍴1
 yx←(g_isz,g_isz)⍴beta+gamma×xhat
 z←(yx)(mu)(sigma2)(xhat)(var)
