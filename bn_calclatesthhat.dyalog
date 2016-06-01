 z←bn_calclatesthhat layernum
 ⍝ j=1⋄while j<=layernum-1

 nc←g_nin
⍝ :If gtflag=2 ⍝ fine-tuning
⍝     nc←isz+1
⍝ :EndIf

 j←1
 hhat0←(1,g_nin)⍴⊃g_mnistmat[1;;]  ⍝  for a whole batch now
 :While j≤layernum-1
     ⍝ need to flip w here, between alternate layers
     hhat0←(g_isz,g_isz)⍴,⊃(bn_x hhat0)
     r←(hhat0+.×g_w[1;;])
     l←(1,g_nin)⍴g_b[j;]
     axt←(g_isz,g_isz)⍴↑l+¨(1,g_isz)⍴↓r
     ⍝ ReLU - hhat←⍟(1+*axt)
     hhat←(1÷(1+*-1×axt))
     g_hhatarr[j;]←hhat[g_nin;] ⍝ store each layer's posterior as last row, might need to avg
     hhat0←hhat ⍝ output becomes input to next layer
     j←j+1
 :EndWhile

 z←1
