 z←bn_calclatesthhat layernum;jj
 jj←1
 hhat0←(1,g_nin)⍴g_hhatarr[1;]

 :While j≤layernum
     ⍝ need to flip w here, between alternate layers
     axt←((1,g_nin)⍴g_b[jj;])+(hhat0+.×g_w[jj;;])
     ⍝ ReLu
     hhat←0⌈axt
     ⍝ hhat←(1÷(1+*-1×axt))
     g_hhatarr[jj;]←hhat ⍝ store each layer's posterior
     hhat0←hhat ⍝ output becomes input to next layer
     jj←jj+1
     :If ((jj>1)∧(jj<layernum+1))
         g_w[jj;;]←⍉g_w[jj-1;;]
     :EndIf
 :EndWhile

 z←1
