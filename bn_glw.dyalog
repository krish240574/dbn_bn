 bn_glw layernum;li;hhat0;updates

 :While layernum≤g_numlayers
     :If ((layernum>1)∧(layernum≤g_numlayers))
         r←bn_calclatesthhat layernum
         li←(0)(layernum)(10)
     :Else
         hhat0←(1,g_isz)⍴g_yx
         g_hhatarr[layernum;]←hhat0
         li←(0)(layernum+1)(10)
     :EndIf
     updates←bn_kcontdiv li ⍝ all changes happen to the global data
     layernum←layernum+1
 :EndWhile
