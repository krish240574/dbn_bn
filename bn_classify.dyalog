 z←bn_classify;count;p_y_given_x;p
 p_y_given_x←1 g_numclasses⍴0
 count←1
 :While count≤g_numclasses
     p_y_given_x[1;count]←(*g_d[1;count])×(×/(1+*(g_b[g_numlayers;]+(g_u[count;]+g_classifier_rbm[1;]+.×g_w[g_numlayers;;]))))
     count←count+1
 :EndWhile

 p←p_y_given_x÷(+/p_y_given_x)
 ⎕←p
 z←p
