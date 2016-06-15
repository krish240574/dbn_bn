 z←bn_classify
 p_y_given_x←1 10⍴0
 count←1
 :While count≤g_numclasses
     t←(*g_d[1;count])×(×/(1+*(g_b[g_numlayers+1;;]+(g_isz,g_isz)⍴(g_u[count;]+g_classifier_rbm[1;]+.×g_w[g_numlayers+1;;]))))
     p_y_given_x[1;count]←t[1]
     count←count+1
 :EndWhile

⍝
⍝⍝ LaRochelle paper
⍝ p_y_given_x_0←(*g_d[1;1])×(×/(1+*(g_b[g_numlayers+1;;]+(g_isz,g_isz)⍴(g_u[1;]+g_classifier_rbm[1;(⍳g_isz)]+.×g_w[g_numlayers+1;;]))))
⍝ p_y_given_x_1←(*g_d[1;2])×(×/(1+*(g_b[g_numlayers+1;;]+(g_isz,g_isz)⍴(g_u[2;]+g_classifier_rbm[1;(⍳g_isz)]+.×g_w[g_numlayers+1;;]))))

 p←p_y_given_x÷(+/p_y_given_x)
 z←p

 ⍝
⍝ pzero←p_y_given_x_0÷(p_y_given_x_0+p_y_given_x_1)
⍝ pone←p_y_given_x_1÷(p_y_given_x_0+p_y_given_x_1)
⍝
⍝ :If pzero[1]>pone[1]
⍝     z←pzero
⍝ :Else
⍝     z←pone
⍝ :EndIf
