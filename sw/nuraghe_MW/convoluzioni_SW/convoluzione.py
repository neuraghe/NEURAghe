#!/usr/bin/python

def convoluzione (input_features, output_features, weights, bias, IF, IH, IW,  OF, OH, OW, FS, zero_pad, stride):

  for outf in range (0, OF):
  
    bi = bias[outf]
    
    for oh in range (0,OH):
      for ow in range (0,OW):
        
        mac = bi
        
        for inpf in range (0,IF):
          
          for k_h in range (0,FS):
          
            hin = stride * oh + k_h - zero_pad
            
            if (hin >= 0 and hin < IH) == 0:
              continue
            
            for k_w in range (0,FS):
            
              win = stride * ow + k_w - zero_pad
              
              if (win >= 0 and win < IH) == 0:
                continue
                
              curr_in = input_features[(inpf*IH + hin)*IW + win]
              
              curr_wei = weights[((outf*IF + inpf)*FS + k_h)*FS + k_w]
              
              mac += curr_in * curr_wei
              
        
        output_features[(outf*OH + oh)*OW + ow] = mac      
        
  return
              
    
    
