z←bn_x x;mu;sigma2;epsilon;var;btmp;xhat;beta;gamma;yx
 mu←mean,x
 epsilon←0.000001
 var←(1÷g_isz)×+/,(x-mu)*2
 sigma2←(var+epsilon)*0.5
 xhat←(1,g_isz)⍴,(x-mu)÷(sigma2)
 yx←(1,g_isz)⍴g_beta+g_gamma×xhat
 beta←0
 gamma←0
 z←(yx)(mu)(sigma2)(xhat)(var)
