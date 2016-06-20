 ctr bn_finetunedbm yhat;tmp1;k;topmosthhat;errderivative;dout;da_bn;dgamma;dbeta;dx;da;dw;db
⍝ forward-prop
⍝ calculate hhat till the top layer
 bn_calclatesthhat g_numlayers+1
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

 k←g_numlayers

 :While k≥1
     ⍝⎕←k
     ⍝ relU backward
     tmp1←,⊃g_hhatarr[k;]
     tmp1[(tmp1≤0)/⍳g_isz]←0
     dout←(1,g_isz)⍴tmp1
     da_bn←dout

     ⍝ BN backward
     (da dgamma dbeta)←bn_bw dout

     ⍝ affine backward
     dx←da+.×⍉g_w[k;;]
     dw←g_hhatarr[k;]+.×⍉da
     db←(1,g_isz)⍴+/da

     g_w[k;;]←g_w[k;;]+g_lr×dw
     g_b[k;]←((1,g_isz)⍴,⊃g_b[k;])-g_lr×db
    ⍝ g_gamma←g_gamma-g_lr×dgamma
⍝     g_beta←g_beta-g_lr×dbeta
     k←k-1

 :EndWhile
 z←0
