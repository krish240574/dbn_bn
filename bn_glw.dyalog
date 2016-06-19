 z←bn_glw layernum;li;no_val;hhat0;updates

 no_val←0

 :While layernum≤g_numlayers
     ⎕←'Layer number - '
     ⎕←layernum
     ⍝ calculate hidden layer posterior

     :If ((layernum>1)∧(layernum≤g_numlayers))
         r←bn_calclatesthhat layernum
         li←(0)(layernum)(2)
     :Else
         hhat0←(1,g_isz)⍴g_yx
         g_hhatarr[layernum;]←hhat0
         li←(0)(layernum+1)(2)
     :EndIf
     updates←bn_kcontdiv li ⍝ all changes happen to the global data
     layernum←layernum+1
 :EndWhile
 z←no_val
