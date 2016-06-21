 z←bn_calclatesthhat layernum;jj;kk
 jj←1
 hhat0←(1,g_nin)⍴g_hhatarr[1;]
 kk←0
 :While jj≤layernum
     kk←jj
     :If jj=layernum
         kk←jj-1
     :EndIf
     axt←((1,g_nin)⍴g_b[jj;])+(hhat0+.×g_w[kk;;])
     ⍝ ReLu
     hhat←0⌈axt
     ⍝ hhat←(1÷(1+*-1×axt))
     g_hhatarr[jj;]←hhat ⍝ store each layer's posterior
     hhat0←hhat ⍝ output becomes input to next layer
     jj←jj+1
     ⍝ need to flip w here, between alternate layers
     :If ((jj>1)∧(jj≤layernum-1))
         g_w[jj;;]←⍉g_w[jj-1;;]
     :EndIf
 :EndWhile

 z←1
