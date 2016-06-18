 z←bn_glw layernum;li;no_val;hhat0;updates

 no_val←0

 :While layernum≤g_numlayers
     ⎕←'Layer number - '
     ⎕←layernum
     ⍝ calculate hidden layer posterior
     ⍝hhat0←(g_isz,g_isz)⍴g_yx[1;;] ⍝ take from global batch, 1 whole img
     hhat0←(1,g_isz)⍴g_yx ⍝ for now, just 1 batch
     :If ((layernum>1)∧(layernum≤g_numlayers))
         r←bn_calclatesthhat layernum
         li←(0)(layernum)(2)
     :Else
         ⍝ normalize and update global
         tmp←(1,g_isz)⍴,⊃bn_x hhat0
         g_hhatarr[layernum;]←tmp
         li←(0)(layernum+1)(2)
     :EndIf
     updates←bn_kcontdiv li ⍝ all changes happen to the global data
     layernum←layernum+1
 :EndWhile
 z←no_val
