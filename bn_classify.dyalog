 z←bn_classify

⍝ LaRochelle paper 
 p_y_given_x_0←(*g_d[1;1])×(×/(1+*(g_b[g_numlayers+1;;]+(g_isz,g_isz)⍴(g_u[1;]+g_classifier_rbm[1;(⍳g_isz)]+.×g_w[g_numlayers+1;;]))))
 p_y_given_x_1←(*g_d[1;2])×(×/(1+*(g_b[g_numlayers+1;;]+(g_isz,g_isz)⍴(g_u[2;]+g_classifier_rbm[1;(⍳g_isz)]+.×g_w[g_numlayers+1;;]))))

 pzero←p_y_given_x_0÷(p_y_given_x_0+p_y_given_x_1)
 pone←p_y_given_x_1÷(p_y_given_x_0+p_y_given_x_1)

 :If pzero[1]>pone[1]
     z←pzero
 :Else
     z←pone
 :EndIf
