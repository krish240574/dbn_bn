 bn_finetunedbm ctr;tmp1;kk;topmosthhat;errderivative;dout;da_bn;dgamma;dbeta;dx;da;dw;db;i;thhat;ddxa;ddxh
⍝ forward-prop
⍝ calculate hhat till the top layer
 bn_calclatesthhat g_numlayers
 lhhat←g_hhatarr[g_numlayers;]


 topmosthhat←g_binlabels[ctr;] ⍝ ahh-haa !
⍝ back-prop
 errderivative←(g_isz,g_numclasses)⍴,↑¨(⊃lhhat-⊂g_yhat[ctr;])
 ⍝errderivative←((1,g_numclasses)⍴,⊃g_yhat[ctr;])-(1,g_numclasses)⍴topmosthhat



⍝ back-prop
⍝ errderivative←yhat-topmosthhat
⍝ g_b[g_numlayers;]←((1,g_isz)⍴g_b[g_numlayers;])+errderivative
⍝ w[g_numlayers;]←w[g_numlayers;]+g_lr×errderivative×lhhat
 ;
 i←g_numlayers
 :While i≥1
     ddxh←g_w[i;;]+.×errderivative
     ddxa←(1,g_isz)⍴,⊃(+/[1]((⍉ddxh)+.×(g_isz,1)⍴(⍉g_hhatarr[i;]))+.×(1,g_isz)⍴(1-g_hhatarr[i;]))
     g_b[i;]←((1,g_isz)⍴,⊃g_b[i;])+g_lr×ddxa
     ⎕←'ddxa'
     ⎕←ddxa
     :If i=1
         thhat←(1,g_isz)⍴g_hhatarr[1;]
     :Else
         thhat←(1,g_isz)⍴g_hhatarr[i-1;]
     :EndIf
     g_w[i;;]←g_w[i;;]+(ddxa+.×⍉thhat)
     i←i-1
 :EndWhile
⍝
⍝ kk←g_numlayers
⍝ :While kk≥1
⍝     ⍝ relU backward
⍝     tmp1←,⊃g_hhatarr[kk;]
⍝     tmp1[(tmp1≤0)/⍳g_isz]←0
⍝     dout←(1,g_isz)⍴tmp1
⍝     da_bn←dout
⍝     ;
⍝     ⍝ BN backkward
⍝     (da dgamma dbeta)←bn_bw dout
⍝
⍝     ⍝ affine backward
⍝     dx←da+.×⍉g_w[kk;;]
⍝     dw←g_hhatarr[kk;]+.×⍉da
⍝     db←(1,g_isz)⍴+/da
⍝     :If kk≤g_numlayers
⍝         g_w[kk;;]←g_w[kk;;]+g_lr×dw
⍝     :EndIf
⍝     g_b[kk;]←((1,g_isz)⍴,⊃g_b[kk;])-g_lr×db
⍝     g_gamma←g_gamma-g_lr×dgamma
⍝     g_beta←g_beta-g_lr×dbeta
⍝     kk←kk-1
⍝
⍝ :EndWhile
 z←0
