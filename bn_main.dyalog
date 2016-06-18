 z←bn_main;count;output;yhat;updates
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

 (g_numclasses g_isz g_hhatarr g_w g_b g_lr g_nin g_numlayers g_mnistmat g_u g_d g_binlabels)←bn_gencreateinput

 g_beta←(1,g_isz)⍴0
 g_gamma←(1,g_isz)⍴1
 count←1
 g_firstimg←0
 :While count≤nr
     g_firstimg←(1,g_isz)⍴(,⊃g_mnistmat[count;])
     g_firstimg[(g_firstimg≠0)/⍳g_isz]←1
    ⍝ normalize here
     (g_yx g_mean g_stdev g_xhat g_var)←bn_x g_firstimg
    ⍝ this will glw-train the DBN
     updates←bn_glw 1



⍝
⍝ ⍝ Now to get moving averages for various batches
⍝ ⍝ Use multiple images read in images
⍝ ⍝ calculate moving averages using multiple batches
⍝ ⍝ calculate var[x] ← (m÷m-1)ExpVal[mean stdev over B batches]
⍝ ⍝ calculate mean[x]←ExpVal[x] ← mean[all batchwise means]
⍝ tmp←mnistmat[1+⍳(¯1+nr);;]
⍝ (muma sma)←bn_ma←bn_calcma tmp
⍝ Ex←muma
⍝ ma_batchsz←⍴,tmp[1;;]
⍝ Varx←(ma_batchsz)÷((ma_batchsz)-1)×sma
⍝
⍝ ⍝ replace all BN(x) with
⍝ ⍝ y=(gamma×x)÷(0.5*(Varx+epsilon)+(beta-(gamma×muma)÷(0.5*(Varx+epsilon))
⍝ yx←(gamma×x)÷(0.5*(Varx+epsilon))+(beta-(gamma×muma)÷(0.5*(Varx+epsilon)))
⍝ ⍝ recreate inputs now, so we have a fresh start with new BN vals
⍝
⍝ input←bn_gencreateinput yx

     ⎕←'Classifying now....'
     g_classifier_rbm←g_firstimg
     yhat←bn_classify

     ⎕←'finetuning dbn...'
     output←bn_finetunedbm yhat
     count←count+1
     z←output

 :EndWhile
