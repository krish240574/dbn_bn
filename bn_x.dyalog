 z←bn_x x
 mu←mean,x
 sigma2←stdev,x
 epsilon←0.000001
 var←(1÷g_isz)×+/,(x-mu)*2
 tmp←(1,g_isz)⍴g_b[1;]
 xhat←(1,g_isz)⍴,((tmp+((1,g_isz)⍴x)+.×g_w[1;;])-mu)÷(sigma2+epsilon)*0.5
 beta←(1,g_isz)⍴0
 gamma←(1,g_isz)⍴1
 yx←(1,g_isz)⍴beta+gamma×xhat
 beta←0
 gamma←0
 z←(yx)(mu)(sigma2)(xhat)(var)
