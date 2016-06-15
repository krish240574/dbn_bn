 z←bn_gencreateinput
 ⎕←'Reading CSV file, few seconds...'
 mnist←DealWithCsv'd:\datasets\mnist\mnist_train_small.csv'
 ⎕←'Read, now onto glw training...'
 nr←(1↑⍴mnist)
 nc←((-1)↑⍴mnist)
 isz←28
 nin←isz
 nout←nin

 numlayers←5
 labels←(¯1+⍳100),(100 1⍴(1+mnist[;1]))
 t←(nr×10)⍴0
 t[(10×(labels[;1]))+labels[;2]]←1
 binlabels←(nr,10)⍴t


 mnistmat←(nr,isz,isz)⍴mnist[(⍳nr);1+⍳((-1)+nc)]

 lr←0.0001 ⍝ for now
 ⍝ initialize weights
 a←0.5*(6÷(nin+nout))
 ⍝ http://docs.scipy.org/doc/numpy-1.10.0/reference/generated/numpy.random.uniform.html

 tmp←DealWithCsv'c:\users\lenovo1\tmp.txt' ⍝ 28X28 random numbers, uniformly distributed b/w
 ⍝ (-a/4) and (a/4)
 ⍝ create w as a 3D array
 w←((numlayers+1),nin,nout)⍴0
 ⍝ Initialize 1st laywe weights
 w[1;;]←(nin,nin)⍴⊃,tmp
 t←numlayers+1
 b←((1+numlayers),isz,isz)⍴0 ⍝ biases
 numclasses←10
 u←(numclasses,nin)⍴,w[1;;] ⍝ just borrow from g_w - class-hidden wts
 d←(1,numclasses)⍴1 ⍝ class-biases


 ⍝ create the input nested array here

 hhatarr←((numlayers+1),nin,nin)⍴0 ⍝ numlayers+1 is just to indicate the topmost layer is different
 input←(numclasses)(isz)(hhatarr)(w)(((numlayers+1),nin,nin)⍴b)(lr)(nin)(numlayers)(mnistmat)(u)(d)(binlabels)
 z←input
