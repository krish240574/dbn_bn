 z←bn_bw dout
 epsilon←0.00001
 dbeta←+/dout
 dgammax←dout
 tmp←(g_isz,g_isz)⍴,⊃g_xhat
 dgamma←+/tmp×dgammax
 dxhat←dgammax×(g_isz,g_isz)⍴g_gamma
 divar←+/,dxhat×g_mean
 sqrtvar←(g_var+epsilon)*0.5
 ivar←1÷sqrtvar
 dxmu1←dxhat×ivar
 sqrtvar←(g_var+epsilon)*0.5
 dsqrtvar←divar×(¯1)÷(sqrtvar*2)
 dvar←dsqrtvar×0.5×(1÷(sqrtvar))
 dsq←dvar×1÷(g_isz)×((g_isz,g_isz)⍴1)
 dxmu2←2×g_mean×dsq
 dx1←(dxmu1+dxmu2)
 z←(dx1)(dgamma)(dbeta)
