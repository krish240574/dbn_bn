 z←bn_bw dout;tmpbw;xc;epsilon;dxc;dstd;dmu;dx;dbeta;dgamma;dgammax;dxhat;dvar;dxn
 epsilon←0.00001
 xc←(1,g_isz)⍴(g_firstimg1-g_mean)

 dbeta←+/dout

 tmpbw←(1,g_isz)⍴,⊃g_xhat
 dgamma←+/tmpbw×dout

 dxn←dout×(1,g_isz)⍴g_gamma

 dxc←dxn÷g_stdev

 dstd←(¯1)×+/(dxn×xc÷(g_stdev*2))

 dvar←0.5×dstd×g_stdev
 dxc←dxc+(2÷g_isz)×(xc×dvar)
 dmu←+/dxc
 dx←dxc-(dmu÷g_isz)
 
 z←(dx)(dgamma)(dbeta)
