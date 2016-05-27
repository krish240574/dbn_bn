 z←layernum bn_glw x;w;tmp;hhat0;nin;nc;gtflag;b;hhat;hhatinput;li;updates;numlayers;lr;inputtocd;hhatarr
 hhat0←⊃x[1] ⍝ use row of input as posterior
 b←⊃x[3] ⍝ biases
 w←⊃x[2] ⍝ weights
 lr←⊃x[4]
 nin←⊃x[5]
 numlayers←⊃x[6]
 gtflag←⊃x[8]

 nc←nin
 :If gtflag=2
     nc←nin+1
 :EndIf




 ⍝ calculate hidden layer posterior
 :If ((layernum>1)∧(layernum≤numlayers))
     tmp←bn_calclatesthhat(layernum)(b)(hhat0)(w)(nin)(numlayers)(gtflag)
     hhat←(1,nc)⍴⊃tmp[1]
     hhatarr←tmp[2] ⍝ 2-D array here,with one row for each h-layer
     hhatinput←hhat
     li←(0)(layernum)(4)  ⍝ CD 4
 :Else
     hhatarr←(numlayers,nc)⍴0 ⍝ empty
     ⍝ normalize
     hhatinput←bn_x hhat0
⍝    hhatinput←hhat0
     li←(0)(layernum+1)(10) ⍝ indexing from 1 in APL
 :EndIf
 ⍝ create the input nested array here
 inputtocd←(hhatinput)(w)((numlayers,nin)⍴b)(lr)

 ⍝ CD here
 ⍝ update structure : (v1)(w)(b) -
 ⍝ v1 is the visible layer output from CD
 updates←li kcontdiv inputtocd
 updates←updates,(nin)(numlayers)(hhatarr)(gtflag)
 :If layernum=numlayers
     z←updates
 :Else
     z←(layernum+1 bn_)glw updates
 :EndIf
