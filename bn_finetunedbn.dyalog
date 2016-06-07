 z←bn_finetunedbm yhat
⍝ nin←⊃input[5]
⍝ w←⊃input[2]
⍝ numlayers←⊃input[6]
⍝ b←(numlayers,nin)⍴⊃input[3]
⍝ lr←⊃input[4]
⍝ tmp←(1,nin+1)⍴⊃input[1]
⍝ gtflag←2
⍝
⍝ yhat←tmp[1;nin+1]
⍝ hhat0←⊃input[1]
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
 :While i>1
     ddxh←g_w[i+1;;]×errderivative ⍝ from layer above
     ddxa←ddxh×g_hhatarr[i;](1-g_hhatarr[i;])
     g_b[i;]←g_b[i;]+lr×ddxaj
     w[i;;]←w[i;;]+ddxa×g_hhatarr[i-1;]
     i←i-1
 :EndWhile
