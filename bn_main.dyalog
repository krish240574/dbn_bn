   ⍝ Just call this in the main console so one has globals to work with 
   (g_hhatarr g_w g_b g_lr g_nin g_numlayers)←bn_gencreateinput yx 
   
  updates←bn_glw 1 ⍝  Will update all global values. 
   
 ⎕←'GLW training done ! DFinal avalues are in global variables :'
 ⎕←'w - weights'   ⍝  ((numlayersXninXnin)
 ⎕←'b←biases for each layer'  ⍝   (numlayersXnin)
 ⎕←'hhatarr←Posterior for each layer'  ⍝  (numlayersXnin)
