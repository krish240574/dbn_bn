 bn_glw layernum;li;hhat0;updates

 :While layernum≤g_numlayers
     :If layernum>1
         r←1 bn_calclatesthhat layernum
         li←(0)(layernum)(10)
         updates←bn_kcontdiv li ⍝ all changes happen to the global data
     :Else
         hhat0←(1,g_isz)⍴g_firstimg1
         g_hhatarr[layernum;]←hhat0
     :EndIf
     layernum←layernum+1
 :EndWhile
⍝ train softmax layer here
 li←(0)(g_numlayers+1)(10)
 updates←bn_kcontdiv li
