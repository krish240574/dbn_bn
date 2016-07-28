 z←sample_from_layer l;samples;tmp;ktmp;szl
 szl←⍴l
 tmp←(1↑szl)×(¯1↑szl)
 ktmp←(1,tmp)⍴(tmp?100×tmp)÷(100×tmp)
 samples←(ktmp>l)
 z←samples
