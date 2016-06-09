 z←bn_gencreateinput
 ⎕←'Reading CSV file, few seconds...'
 mnist←DealWithCsv'd:\datasets\mnist\mnist_train_small.csv'
 
 nr←(1↑⍴mnist)
 nc←((-1)↑⍴mnist)
 g_isz←28
 nin←g_isz
 nout←nin

 numlayers←5
 mnistmat←(nr,g_isz,g_isz)⍴mnist[(⍳nr);1+⍳((-1)+nc)]

 ⍝ sending whole 28X28 image as a minibatch
 batchsz←g_isz
 g_firstimg←mnistmat[1;;]

 ⍝ normalize here
 (yx mu sigma xhat var)←(g_isz,g_isz)⍴bn_x g_firstimg


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
 u←(numclasses,nin)⍴,w[1;;] ⍝ just borrow from g_w - class-hidden wts
 d←(1,numclasses)⍴1 ⍝ class-biases


 ⍝ create the input nested array here

 hhatarr←(numlayers,nin)⍴0 ⍝ numlayers+1 is just to indicate the topmost layer is different
 input←(isz)(hhatarr)(w)((numlayers,nin)⍴b)(lr)(nin)(numlayers)(mnistmat)(u)(d)(yx)(mu)(sigma)(xhat)(var)
 z←input
