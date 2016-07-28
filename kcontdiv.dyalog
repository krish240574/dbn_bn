 z←bn_kcontdiv li;samples;biash;biasv;hzero;vzero;count;cdn;nin;l;no_val
 ⍝ CD-n
 no_val←0
 cdn←⊃li[3] ⍝ number of iterations of the Gibb's chain
 l←⊃li[2] ⍝ layer number


 :If l>g_numlayers ⍝ last layer
     v←((1,g_numclasses)⍴(g_binlabels[g_counter;])),((1,g_nin)⍴,⊃g_hhatarr[l-1;])
     h←1÷(1+*-1×biash+v+.×g_softmax)
     biash←0
     biasv←((1,g_numclasses)⍴g_d),(1,g_nin)⍴g_b[l-1;]
 :Else
     v←(1,g_nin)⍴,⊃g_hhatarr[l-1;] ⍝ training sample
     h←1÷(1+*-1×biash+v+.×⍉g_w[l-1;;])
     biash←(1,g_nin)⍴g_b[l;]
     biasv←(1,g_nin)⍴g_b[l-1;]
 :EndIf
 samples←sample_from_layer h
 count←1
 ⍝ Gibbs walk here
 h←samples
 :While count≤cdn
     :If l>g_numlayers
         v←1÷(1+*-1×biasv+h+.×⍉g_Wtopmost)
         v←sample_from_layer v
         h←1÷(1+*-1×biash+v+.×g_Wtopmost)
         h←sample_from_layer h
     :Else
         v←1÷(1+*-1×biasv+h+.×g_w[l-1;;])
         v←sample_from_layer v
         h←1÷(1+*-1×biash+v+.×⍉g_w[l-1;;])
         h←sample_from_layer h
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
     g_Wtopmost←g_Wtopmost+⍉g_lr×(vhzero-((⍉h)+.×v))
 :EndIf
 
 :If l=2 ⍝ 1st layer(should be 1, but indexing in APL is from 1)
     g_hhatarr[l;]←hzero     ⍝ return h0hat=first row of input
 :Else
     :If l≤g_numlayers
         g_hhatarr[l;]←v
     :EndIf
 :EndIf
 z←no_val
