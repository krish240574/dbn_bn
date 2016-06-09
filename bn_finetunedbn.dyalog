 z←bn_finetunedbm yhat


⍝ forward-prop
⍝ calculate hhat till the top layer

 hhats←bn_calclatesthhat g_numlayers
 lhhat←⊃hhats[g_numlayers]
 ⍝hhatarr←(g_numlayers,(g_isz+1))⊃hhats[2]  ⍝ 5X29
 n←(*((1,g_isz)⍴b[g_numlayers;])+lhhat+.×g_w[numlayers-1;;]) ⍝ all topmost layer values
 d←(+/((1,g_isz)⍴b[g_numlayers;])+lhhat+.×g_w[g_numlayers-1;;]) ⍝ all topmost layer values
 topmosthhat←n÷d

⍝ back-prop
 errderivative←yhat-topmosthhat
 g_b[g_numlayers;]←((1,g_isz)⍴g_b[g_numlayers;])+errderivative
 w[g_numlayers;]←w[g_numlayers;]+g_lr×errderivative×lhhat

 i←numlayers-1
 dout←(g_isz,g_isz)⍴g_w[1;;]
 :While i>1
     ⍝ relU backward
     tmp←((1,g_isz)⍴g_hhatarr[i;])
     dout[(tmp≤0)/⍳⍴g_isz]←0
     da_bn←dout

     ⍝ BN backward
     (da dgamma dbeta)←bn_bw dout

     ⍝ affine backward
     dx←da+.×⍉g_w[i;;]
     dw←g_hhatarr[i;]+.×da
     db←+/da
     i←i-1
     g_w[i;;]←g_w[i;;]-g_lr×dw
     g_b[i;]←g_b[i;]-g_lr×db

 :EndWhile
