 z←bn_gencreateinput;input;tmp;mnist;nr;nc;isz;nin;nout;numlayers;numclasses;labels;t;binlabels;mnistmat;w;b;u;d;hhatarr
 ⎕←'Reading CSV file, few seconds...'
 ⍝mnist←DealWithCsv'd:\datasets\mnist\mnist_train_small.csv'
 mnist←DealWithCsv'd:\datasets\numerai\numerai_training_data.csv'
 ⍝mnist←DealWithCsv'd:\datasets\numerai\numerai_train_small.csv'
 mnist←mnist[;22],mnist[;⍳21]
 ⎕←'Read, now onto glw training...'
 nr←(1↑⍴mnist)
 nc←((-1)↑⍴mnist)
 isz←(¯1+nc)
 nin←isz
 nout←nin

 numlayers←5
 numclasses←2

 labels←(¯1+⍳nr),((nr,1)⍴(1+mnist[;1]))
 t←(nr×numclasses)⍴0
 t[(numclasses×(labels[;1]))+labels[;2]]←1
 binlabels←(nr,numclasses)⍴t


 mnistmat←(nr,isz)⍴mnist[(⍳nr);1+⍳((-1)+nc)]

 lr←0.0002
 ⍝ initialize weights
 a←0.5*(6÷(nin+nout))
 ⍝ http://docs.scipy.org/doc/numpy-1.10.0/reference/generated/numpy.random.uniform.html

 tmp←DealWithCsv'c:\users\lenovo1\tmp.txt' ⍝ random numbers, uniformly distributed

 ⍝ create w as a 3D array
 w←(numlayers,nin,nout)⍴tmp
 ⍝w[1;;]←(nin,nout)⍴tmp

 b←(numlayers,isz)⍴0 ⍝ biases
 t←,w[2;;]


 u←(numclasses,nin)⍴t[(numclasses×nin)?⍴t]
 d←(1,numclasses)⍴0.1 ⍝ class-biases


 ⍝ create the input nested array here

 hhatarr←(numlayers,nin)⍴0
 input←(nr)(numclasses)(isz)(hhatarr)(w)(b)(lr)(nin)(numlayers)(mnistmat)(u)(d)(binlabels)
 hhatarr←0
 w←0
 b←0
 mnistmat←0
 mnist←0
 u←0
 d←0
 labels←0
 t←0

 z←input
