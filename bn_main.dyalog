   ⍝ Just call this in the main console so one has globals to work with 
 (g_hhatarr g_w g_b g_lr g_nin g_numlayers g_mnistmat)←bn_gencreateinput

 updates←bn_glw 1  ⍝ this will glw-train the DBN 
 g_beta←(1,(g_isz×g_isz))⍴1
 g_gamma←(1,(g_isz×g_isz))⍴0
 
 ⎕←'GLW training done ! Distributions are in global values:'
 ⎕←'w - weights'
 ⎕←'b←biases for each layer'
 ⎕←'hhatarr←Posterior for each layer'
