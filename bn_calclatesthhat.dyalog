 z←bn_calclatesthhat layernum
 j←1
 hhat0←(1,g_nin)⍴g_hhatarr[layernum;]
 :While j≤layernum
     ⍝ need to flip w here, between alternate layers
     axt←((1,g_nin)⍴g_b[j;])+(hhat0+.×g_w[1;;])
     ⍝ ReLu
     hhat←0⌈axt
     ⍝ hhat←(1÷(1+*-1×axt))
     g_hhatarr[j;]←hhat
     hhat0←hhat ⍝ output becomes input to next layer
     j←j+1
 :EndWhile

 z←1
