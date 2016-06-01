 z←kcontdiv li;biash;biasv;v0;v1;count;cdn;h0hat;h1hat;lr;nin;l;no_val
 ⍝ CD-n
 no_val←0
 cdn←⊃li[3] ⍝ number of iterations of the Gibb's chain
 l←⊃li[2] ⍝ layer number

 lr←⊃g_lr  ⍝ learning rate
 nin←((-1)↑(⍴g_b[l;]))
 v0←(1,nin)⍴⊃g_hhatarr[l;]
 h0hat←(1,nin)⍴⊃g_hhatarr[l;] ⍝ initialize posterior of visible as input

 count←1
 :While count≤cdn
     biash←((1,nin)⍴g_b[l;])
     h1hat←1÷(1+*-1×biash+v0+.×⍉g_w[l;;])
     biasv←((1,nin)⍴g_b[l;])
     v1←1÷(1+*-1×biasv+h1hat+.×g_w[l;;])
     count←count+1
 :EndWhile

 g_w[l;;]←g_w[l;;]+g_lr×((h1hat+.×⍉v0)-(h1hat+.×⍉v1))
 g_b[l;]←((1,nin)⍴g_b[l;])+g_lr×(h0hat-h1hat)
 g_b[l-1;]←((1,nin)⍴g_b[l;])+g_lr×(v0-v1)

 :If l=2 ⍝ 1st layer(should be 1, but indexing in APL is from 1)
     g_hhatarr[l;]←h0hat     ⍝ return h0hat=first row of input
 :Else
     g_hhatarr[l;]←v1
 :EndIf
 z←no_val
