 z←bn_gencreateinput sample
 ⎕←'Reading CSV file, few seconds...'
 mnist←DealWithCsv'd:\datasets\mnist\mnist_train_small.csv'
 ⎕←'Read, now onto glw training...'
 nr←(1↑⍴mnist)
 nc←((-1)↑⍴mnist)
 nin←nr
 nout←nin
 g_isz←28
 numlayers←5
 mnistmat←(nr,g_isz,g_isz)⍴mnist[(⍳nr);1+⍳((-1)+nc)]

 ⍝ sending whole 28X28 image as a minibatch
 batchsz←g_isz
 g_firstimg←mnistmat[1;;]

 ⍝ normalize here
 yx←(g_isz,g_isz)⍴bn_x g_firstimg
 
 layernum←1 ⍝ for now
 nin←(-1)↑(⍴sample)
 nout←nin
 lr←0.0001 ⍝ for now
 ⍝ initialize weights
 a←0.5*(6÷(nin+nout))
 ⍝ http://docs.scipy.org/doc/numpy-1.10.0/reference/generated/numpy.random.uniform.html

 tmp←DealWithCsv'c:\users\lenovo1\tmp.txt' ⍝ 28X28 random numbers, uniformly distributed b/w
 ⍝ (-a/4) and (a/4)
 ⍝ create w as a 3D array
 w←(numlayers,nin,nout)⍴0
 ⍝ Initialize 1st laywe weights
 w[1;;]←(nin,nin)⍴⊃,tmp
 b←(numlayers,nin)⍴0 ⍝ biases

 ⍝ create the input nested array here
 hhatarr←(numlayers,nin)⍴0
 input←(hhatarr)(w)((numlayers,nin)⍴b)(lr)(nin)(numlayers)
 z←input
