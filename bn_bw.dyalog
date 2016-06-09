 z←bn_bw dout
 dbeta←+/dout
 dgammax←dout
 dgamma=+/g_xhat×dgammax
 dxhat←dgammx×g_gamma
 divar←+/dxhat×g_mean
 dxmu1←dxhat×(1÷g_var)
 sqrtvar←(g_var+epsilon)*0.5
 dsqrtvar←(¯1)÷(sqrtvar*2)×divar
 dvar←0.5×(1÷(sqrtvat))×dsqrtvar
 dsq←1÷(g_isz)×((g_isz,g_isz)⍴1)×dvar
 dxmu2←2×g_mean×dsq
 dx1←(dxmu1+dxmu2)
 z←(dx1)(dgamma)(dbeta)
