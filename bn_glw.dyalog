 z←bn_glw layernum;li;no_val;hhat0;updates

 no_val←0
 nc←g_nin
 :If gtflag=2
     nc←nc+1
 :EndIf
 
 :While layernum≤g_numlayers
     ⍝ calculate hidden layer posterior
     hhat0←g_hhatarr[1;] ⍝ take from global, xt
     :If ((layernum>1)∧(layernum≤g_numlayers))
         r←bn_calclatesthhat layernum
         li←(0)(layernum)(10)  ⍝ CD 4
     :Else
         ⍝ normalize and update global
         g_hhatarr[1;]←bn_x hhat0
         li←(0)(layernum+1)(10) ⍝ indexing from 1 in APL
     :EndIf
     updates←kcontdiv li ⍝ all changes happen to the global data
     layernum←layernum+1
 :EndWhile
 z←no_val
