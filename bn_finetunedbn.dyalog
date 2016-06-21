 ctr bn_finetunedbm yhat;tmp1;kk;topmosthhat;errderivative;dout;da_bn;dgamma;dbeta;dx;da;dw;db
⍝ forward-prop
⍝ calculate hhat till the top layer
 bn_calclatesthhat g_numlayers
 lhhat←g_hhatarr[g_numlayers+1;]

⍝ n←(*(g_b[g_numlayers+1;;])+lhhat+.×g_w[g_numlayers;;]) ⍝ all topmost layer values
⍝ n←,⊃+/¨{n[⍵;]÷+/n[⍵;]}¨⍳g_isz
⍝ d←(+/*(g_b[g_numlayers+1;;])+lhhat+.×g_w[g_numlayers;;]) ⍝ all topmost layer values
⍝ topmosthhat←n÷d
 topmosthhat←g_binlabels[ctr;] ⍝ ahh-haa !
⍝ back-prop
 errderivative←yhat-(1,g_numclasses)⍴topmosthhat
⍝ g_b[g_numlayers;]←((1,g_isz)⍴g_b[g_numlayers;])+errderivative
⍝ w[g_numlayers;]←w[g_numlayers;]+g_lr×errderivative×lhhat

 kk←g_numlayers+1

 :While kk≥1
     ⍝ relU backkward
     tmp1←,⊃g_hhatarr[kk;]
     tmp1[(tmp1≤0)/⍳g_isz]←0
     dout←(1,g_isz)⍴tmp1
     da_bn←dout

     ⍝ BN backkward
     (da dgamma dbeta)←bn_bw dout

     ⍝ affine backkward
     dx←da+.×⍉g_w[kk;;]
     dw←g_hhatarr[kk;]+.×⍉da
     db←(1,g_isz)⍴+/da
     :If kk≤g_numlayers
         g_w[kk;;]←g_w[kk;;]+g_lr×dw
     :EndIf
     g_b[kk;]←((1,g_isz)⍴,⊃g_b[kk;])-g_lr×db
     g_gamma←g_gamma-g_lr×dgamma
     g_beta←g_beta-g_lr×dbeta
     kk←kk-1

 :EndWhile
 z←0
