 z←flag bn_calclatesthhat layernum;jj;kk;bn_axt

 :If flag=1
     g_w[layernum;;]←⍉g_w[layernum-1;;]
     hhat0←(1,g_nin)⍴g_hhatarr[layernum-1;]
     axt←((1,g_nin)⍴g_b[layernum;])+(hhat0+.×g_w[layernum-1;;])
     g_hhatarr[layernum;]←(1+(10⍟(*axt)))
 :Else
     jj←2
     hhat0←(1,g_nin)⍴g_hhatarr[1;]
     :While jj≤layernum
         axt←((1,g_nin)⍴g_b[jj;])+(hhat0+.×g_w[jj-1;;])
        ⍝ ReLu
         hhat←0⌈axt
        ⍝ hhat←(1÷(1+*-1×axt))
         g_hhatarr[jj;]←hhat ⍝ store each layer's posterior
         hhat0←hhat ⍝ output becomes input to next layer
         jj←jj+1
        ⍝ need to flip w here, between alternate layers
         :If ((jj>1)∧(jj≤layernum))
             g_w[jj;;]←⍉g_w[jj-1;;]
         :EndIf
     :EndWhile
 :EndIf
 z←1
