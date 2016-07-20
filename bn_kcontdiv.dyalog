 z←bn_kcontdiv li;biash;biasv;hzero;vzero;count;cdn;nin;l;no_val
 ⍝ CD-n
 no_val←0
 cdn←⊃li[3] ⍝ number of iterations o
 l←⊃li[2] ⍝ layer number

 :If l>g_numlayers
     v←((1,g_numclasses)⍴(g_binlabels[g_counter;])),((1,g_nin)⍴,⊃g_hhatarr[l-1;])
 :Else
     v←(1,g_nin)⍴,⊃g_hhatarr[l-1;] ⍝ training sample
 :EndIf
 h0hat←(1,g_nin)⍴,⊃g_hhatarr[l-1;] ⍝ initialize posterior of visible as input

 count←1
 :If l>g_numlayers
     biash←0
     biasv←((1,g_numclasses)⍴g_d),(1,g_nin)⍴g_b[l-1;]
 :Else
     biash←(1,g_nin)⍴g_b[l;]
     biasv←(1,g_nin)⍴g_b[l-1;]
 :EndIf

 :While count≤cdn
  ⍝  https://www.cs.toronto.edu/~hinton/csc2535/notes/lec4new.pdf
  ⍝  slide 7
     :If l>g_numlayers
         h←1÷(1+*-1×biash+v+.×g_softmax)
         v←1÷(1+*-1×biasv+h+.×⍉g_softmax)
     :Else
         h←1÷(1+*-1×biash+v+.×⍉g_w[l-1;;])
         v←1÷(1+*-1×biasv+h+.×g_w[l-1;;])
     :EndIf
     :If count=1
         vhzero←(⍉h)+.×v
         hzero←h
         vzero←v
     :EndIf
     count←count+1
 :EndWhile
 ⍝ v and h have latest values, update using them
 :If l≤g_numlayers
     g_w[l-1;;]←g_w[l-1;;]+g_lr×(vhzero-(h+.×⍉v))
     g_b[l;]←((1,g_nin)⍴g_b[l;])+g_lr×(hzero-h)
     g_b[l-1;]←((1,g_nin)⍴g_b[l;])+g_lr×(vzero-v)
 :Else
     g_softmax←g_softmax+⍉g_lr×(vhzero-((⍉h)+.×v))
 :EndIf


 :If l=2 ⍝ 1st layer(should be 1, but indexing in APL is from 1)
     g_hhatarr[l;]←hzero     ⍝ return h0hat=first row of input
 :Else
     :If l≤g_numlayers
         g_hhatarr[l;]←v
     :EndIf
 :EndIf
 z←no_val
