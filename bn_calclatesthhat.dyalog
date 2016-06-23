 z←bn_calclatesthhat layernum;jj;kk;bn_axt

 ⍝hhat0←(1,g_nin)⍴g_hhatarr[1;]

 hhat0←(1,g_nin)⍴g_hhatarr[layernum-1;]
 axt←((1,g_nin)⍴g_b[layernum;])+(hhat0+.×g_w[layernum-1;;])
 g_hhatarr[layernum;]←0⌈axt
 g_w[layernum;;]←⍉g_w[layernum-1;;]

 jj←2
 ⍝kk←0
⍝ :While jj≤layernum
⍝     kk←jj
⍝     :If jj=layernum
⍝         kk←jj-1
⍝     :EndIf
⍝     axt←((1,g_nin)⍴g_b[jj;])+(hhat0+.×g_w[kk;;])
⍝     ⍝ normalize before non-lin
⍝     ⍝(g_yx g_mean g_stdev g_xhat g_var)←bn_x axt
⍝     ⍝ ReLu
⍝     hhat←0⌈axt
⍝     ⍝ hhat←(1÷(1+*-1×axt))
⍝     g_hhatarr[jj;]←hhat ⍝ store each layer's posterior
⍝     hhat0←hhat ⍝ output becomes input to next layer
⍝     jj←jj+1
⍝     ⍝ need to flip w here, between alternate layers
⍝     :If ((jj>1)∧(jj≤layernum))
⍝         g_w[jj;;]←⍉g_w[jj-1;;]
⍝     :EndIf
⍝ :EndWhile

 z←1
