 z←bn_kcontdiv li;biash;biasv;v0;v1;count;cdn;h0hat;h1hat;lr;nin;l;no_val
 ⍝ CD-n
 no_val←0
 cdn←⊃li[3] ⍝ number of iterations of the Gibb's chain
 l←⊃li[2] ⍝ layer number

 v←(1,g_nin)⍴,⊃g_hhatarr[l-1;] ⍝ training sample
 h0hat←(1,g_nin)⍴,⊃g_hhatarr[l-1;] ⍝ initialize posterior of visible as input

 count←1
 biash←(1,g_nin)⍴g_b[l;]
 biasv←(1,g_nin)⍴g_b[l-1;]

 :While count≤cdn
  ⍝  https://www.cs.toronto.edu/~hinton/csc2535/notes/lec4new.pdf
  ⍝  slide 7
     h←1÷(1+*-1×biash+v+.×⍉g_w[l-1;;])
     v←1÷(1+*-1×biasv+h+.×g_w[l-1;;])
     :If count=1
         vhzero←h+.×⍉v
         hzero←h
         vzero←v
     :EndIf
     count←count+1
 :EndWhile
 ⍝ v and h have latest values, update using them
 
 g_w[l;;]←g_w[l;;]+g_lr×(vhzero-(h+.×⍉v))
 g_b[l;]←((1,g_nin)⍴g_b[l;])+g_lr×(hzero-h)
 g_b[l-1;]←((1,g_nin)⍴g_b[l;])+g_lr×(vzero-v)

 :If l=2 ⍝ 1st layer(should be 1, but indexing in APL is from 1)
     g_hhatarr[l;]←hzero     ⍝ return h0hat=first row of input
 :Else
     g_hhatarr[l;]←v
 :EndIf
 z←no_val
