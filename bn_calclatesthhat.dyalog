 z←bn_calclatesthhat input
 ⍝ j=1⋄while j<=layernum-1
 layernum←⊃input[1]
 nin←⊃input[5]
 b←⊃input[2]
 hhat0←(1,nin)⍴⊃input[3]
 w←⊃input[4]

 numlayers←⊃input[6]
 gtflag←⊃input[7]

 nc←nin
⍝ :If gtflag=2 ⍝ fine-tuning
⍝     nc←isz+1
⍝ :EndIf

 hhatarr←(numlayers,nc)⍴0

 j←1
 :While j≤layernum-1
     ⍝ need to flip w here, between alternate layers
     hhat0←bn_x hhat0
     axt←((1,nin)⍴b[j;])+(hhat0+.×w)
     hhat←(1÷(1+*-1*axt))
     hhatarr[j;]←hhat ⍝ store each layer's posterior
     hhat0←hhat ⍝ output becomes input to next layer
     j←j+1
 :EndWhile
 finalhhat←(hhat)(hhatarr)

 z←finalhhat
