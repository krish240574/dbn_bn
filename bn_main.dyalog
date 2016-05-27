 z←bn_main;count;layernum;nin;nout;a;nr;nc;isz;mnist;numlayers;mnistmat;firstimg;input
 ⍝ greedy layer-wise pre-training for a DBN
 ⍝ Training set D = {Xt}(t=1..T)
 ⍝ pre-training learning rate epsilonp
 ⍝ nin = number of units in layer (i-1)
 ⍝ nout = number of units in layer i
 ⍝ initialize weights a = 6÷(nin + nout)
 ⍝ wi(jk) - U(-4×0.5*a, 4×0.5*a)
 ⍝ hhatx = posterior of x
 ⍝ hi = output from layer i
 ⍝ o is the output of the whole network
 ⍝ b = bias for each layer
 ⍝ sigm = sigmoid activation function
 ⍝ Bengio(2012) - http://arxiv.org/pdf/1206.5533v2.pdf
 ⍝ for MNist data
 ⍝ 100 images read
 ⎕←'Reading CSV file, few seconds...'
 mnist←DealWithCsv'd:\datasets\mnist\mnist_train_small.csv'
 nr←(1↑⍴mnist)
 nc←((-1)↑⍴mnist)
 nin←nr
 nout←nin
 isz←28

 numlayers←5
 mnistmat←(nr,isz,isz)⍴mnist[(⍳nr);1+⍳((-1)+nc)]

 ⍝ sending whole 28X28 image as a minibatch
 batchsz←isz
 firstimg←mnistmat[1;;]
 ⍝ normalize here
 yx←bn_x,firstimg

 ⍝ create input to first layer using normalized values
 input←gencreateinput yx

 ⍝ input←(xt or batch)(w)((numlayers,nin)⍴b)(lr)(nin)(numlayers)(hhatarr)(gtflag)

 gtflag←1  ⍝ layer-wise training flag
 input←input,(gtflag)
 count←1
 ⍝ change glw to add BN layer in before non-linear activation
 updates←count bn_glw input  ⍝ this will glw the DBN - gamma and beta also will be returned

 ⍝ Now to get moving averages for various batches
 ⍝ Use multiple images read in images
 ⍝ calculate moving averages using multiple batches
 ⍝ calculate var[x] ← (m÷m-1)ExpVal[mean stdev over B batches]
 ⍝ calculate mean[x]←ExpVal[x] ← mean[all batchwise means]
 tmp←mnistmat[1+⍳(¯1+nr);;]
 (muma sma)←bn_ma←bn_calcma tmp
 Ex←muma
 ma_batchsz←⍴,tmp[1;;]
 Varx←(ma_batchsz)÷((ma_batchsz)-1)×sma

 ⍝ replace all BN(x) with
 ⍝ y=(gamma×x)÷(0.5*(Varx+epsilon)+(beta-(gamma×muma)÷(0.5*(Varx+epsilon))
 yx←(gamma×x)÷(0.5*(Varx+epsilon))+(beta-(gamma×muma)÷(0.5*(Varx+epsilon)))
 ⍝ recreate inputs now, so we have a fresh start with new BN vals
 input←gencreateinput yx

 ⍝ Now to modify the top layer for y inputs
 y←(1,batchsz)⍴1 ⍝ 1 for now , need to generate y later
 tmp←(1,isz)⍴(⊃updates[1])
 tmp←tmp,y
 updates[1]←⊂tmp ⍝ shove back in


 w←⊃updates[2]
 tmp←w[nin;]
 w←w,[1]tmp ⍝ just append last row of learned weights for now
 updates[2]←⊂w

⍝ b←⊃updates[3]
⍝ b←b,b[;isz]
⍝ updates[3]←⊂b
 ⍝ updates←updates,(nin)(numlayers)(hhatarr)(gtflag)

 nin←⊃updates[5]
 updates[5]←⊂(1+nin) ⍝added y

⍝ z←updates
 gtflag←2
 updates[8]←⊂gtflag ⍝ fine-tuning


 finetuneinput←(tmp)(w)(⊃updates[3])(⊃updates[4])(⊃updates[5])(⊃updates[6])(⊃updates[7])(⊃updates[8])
 ⎕←'finetuning...'
 z←finetunedbm finetuneinput
 ⍝o←layernum glw 0 ⍝ return updates from glw