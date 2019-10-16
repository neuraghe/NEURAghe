
import sys
import time
import onnx
import os
import struct



class Initializer:
    def __init__ (self, model, nodes, path):
                    
        self.path              = path
        self.model             = model
        self.initializer       = self.model.graph.initializer
        self.all_nodeslist     = nodes #self.model.graph.node
        self.weights           = self.find_weights()
        self.bias              = self.find_bias()
        self.net_input         = self.net_input()
        self.wdict             = {}
        self.bdict             = {}
        self.wdict_shape       = {}
        self.bdict_shape       = {}
        

#---------------------------------------- individua l'input della rete---------------------------------------------------------------------------------------
    def net_input (self):
        all_nodeslist = self.all_nodeslist
        weights_and_nodes = self.weights
        bias_and_nodes = self.bias
    # Estraggo il nome dei pesi e bias, corrispondo alle chiavi del dizionario
        keys_w = []
        with open(os.path.join(self.path,"keys.txt"), "w") as f:
          for key in weights_and_nodes:
              keys_w.append(key)
              f.write("%s\n" % key) 
              print(key)
        keys_b = []
        with open(os.path.join(self.path,"keys.txt"), "a") as f:
          for key in bias_and_nodes:
              keys_b.append(key)
              f.write("%s\n" % key) 
        output_list = []
        with open(os.path.join(self.path,"nodes_list.txt"),"w") as f:
          f.write("LIST OF LAYERS\n")
          for node in all_nodeslist:
              f.write("%s\t"%node.op_type)
              f.write("%s\n"%node.name)
              for l in node.output:
                  l = l.replace("/","_")
                  l = "_{}".format(l)
                  output_list.append(l)
        with open(os.path.join(self.path,"nodes_par.txt"),"w") as f:
          for node in all_nodeslist:
              f.write("PARAMETERS\n")
              f.write("%s\n"%node)
                           
        # Indiviuo l'input della rete, non deve essere contenuto nel dizionario e non deve trovarsi tra gli output di qualche layer
        for node in all_nodeslist:
            lenght = len(node.input)
            for k in range (lenght):
                node.input[k] =node.input[k]. replace("/","_")
                node.input[k] = "_{}".format(node.input[k])
                if node.input[k] not in weights_and_nodes.keys() and node.input[k] not in bias_and_nodes.keys() and node.input[k] not in output_list:#keys_w and node.input[k] not in output_list and node.input[k] not in keys_b :
                    net_input = node.input[k]
                    net_input = net_input.replace("/","_")
                node.input[k] = node.input[k][1:]
        return net_input
        
#------------------------------------------------------------------------------------------------------------------------------#

    def find_weights(self):
        from onnx import numpy_helper
        start_time_weights = time.time()
        initializer = self.initializer
        all_nodeslist = self.all_nodeslist
        weights ={}
        for k in initializer:
            # elimino i caratteri "/" dalle stringe dei pesi per evitare errori con pytorch
            weight_w = k.name
            weight_name = weight_w.replace("/","_")
            weight_name = "_{}".format(weight_name)
            start_time_numpy = time.time()
            init_el = numpy_helper.to_array(k)
            if init_el.ndim != 1 :   # individuo i pesi , la matrice dei pesi è multidimensionale
                 weights[weight_name] = init_el                 #metto i pesi e l'input corrispondente in un dizionario i cui indici sono i nomi delgi input
        print("---weights Completed in  %s seconds ---" % (time.time() - start_time_weights))
        return (weights)

    def find_bias(self):
        from onnx import numpy_helper
        start_time_bias = time.time()
        initializer =  self.initializer
        all_nodeslist = self.all_nodeslist
        bias = {}
        # elimino i caratteri "/" dalle stringe dei bias per evitare errori con pytorch
        for k in initializer:
            bias_name = k.name
            bias_name = bias_name.replace("/","_")
            bias_name = "_{}".format(bias_name)
            init_el = numpy_helper.to_array(k)
            if init_el.ndim == 1:   # individuo i bias, la matrice dei bias ha una sola dimensione
                    bias[bias_name] = init_el            #metto i pesi e l'input corrispondente in un dizionario i cui indici sono i nomi delgi input
        print("---bias Completed in  %s seconds ---" % (time.time() - start_time_bias))
        return bias

    def write_weights(self):
        import numpy as np
        import os
        start_time_write_weights = time.time()
      # scrive una lista contente i pesi e il nome del nodo a cui sono associati
       # np.savez(os.path.join(self.path, "weights.npz"), **self.weights)
        #a=self.weights["_ip1_w"].transpose()

        with open(os.path.join(self.path,"keys.txt"),'r') as file1:
          for a in file1.readlines():                
            filename=a.replace('\n','_')
            if (a.find('w')!=-1):
              filename=filename.replace(".","_")
              with open(os.path.join(self.path,filename+".txt"), "w") as f:
                if (a.find('Gemm')==-1):
                #  print(self.weights[a[:-1]].reshape(self.weights[a[:-1]].shape[0],self.weights[a[:-1]].shape[1],9).shape)
                 # for wb in self.weights[a[:-1]].reshape(self.weights[a[:-1]].shape[0],self.weights[a[:-1]].shape[1],9).swapaxes(0,1).flatten():   #'F'
                  for wb in self.weights[a[:-1]].flatten():   #'F'
                    f.write("%.10f\n" % wb)                        
                else:
                  for wb in self.weights[a[:-1]].flatten('F'):   #'F'
                    f.write("%.10f\n" % wb)
              if (a.find('Conv')!=-1):
                #print (self.weights[a[:-1]].shape)
                self.wdict[a.split(".")[0]]       = filename+".bin"
                self.wdict_shape[a.split(".")[0]] = self.weights[a[:-1]].shape
              with open(os.path.join(self.path,filename+".bin"), "wb") as f:
                for wb in self.weights[a[:-1]].flatten():   #'F'
                  w_byte=struct.pack("f",wb)
                  f.write(w_byte)  
                   
        print("---write_weights Completed in  %s seconds ---" % (time.time() - start_time_write_weights))


    def write_bias(self):
        import numpy as np
        import os
        start_time_write_bias = time.time()
        #np.savez(os.path.join(self.path, "bias.npz"), **self.bias)
        with open(os.path.join(self.path,"keys.txt"),'r') as file1:
          for a in file1.readlines():
            filename=a.replace('\n','_')
            if (a.find('b')!=-1):
              filename=filename.replace(".","_")
              with open(os.path.join(self.path,filename+".txt"), "w") as f:
                for wb in self.bias[a[:-1]].flatten():
                  f.write("%.10f\n" % wb) 
              if (a.find('Conv')!=-1):
               # print (self.bias[a[:-1]].shape)
                self.bdict[a.split(".")[0]]       = filename+".bin"
                self.bdict_shape[a.split(".")[0]] = self.bias[a[:-1]].shape
              with open(os.path.join(self.path,filename+".bin"), "wb") as f:
                for wb in self.bias[a[:-1]].flatten():   #'F'
                  b_byte=struct.pack("f",wb)
                  f.write(b_byte)
        print("---write_bias Completed in  %s seconds ---" % (time.time() - start_time_write_bias))













if __name__ == "__main__":
    import argparse

    parser = argparse.ArgumentParser(description='Call the onnxextract function passing the parameters you want to setself. If no parameters are inserted by the user(exept model file),network parameters are by default extracted from the model file.')
    parser.add_argument('model', default=None, type=str, help =" .onnx file model")
    parser.add_argument('-P','--class_path', default = './', type = str, help= ' Path where you want to save the class, weights and bias file')

    args = parser.parse_args()

    model_file = (args.model)
    if args.class_path != "./":
        #create a folder for  class, weight and bias file if the user has selected a path different from ./
        path =("mkdir {}").format(args.class_path)
        os.system(path)
        
    path = args.class_path
    
    print ("Model:", model_file)
    print ("\nNet parameters:")
    print ("path:", path)

   
    #start_time = time.time()

    # load the onnx model
    model = onnx.load(model_file)
    # extract all nodes from the model (each layer corresponds to a node)
    nodes = model.graph.node

    # create the initializer. In the onnx file all the parameters are stored in a structure called initalizer.
    # We extract from it the sizes of the layers and the parameters if the onnx stores a trained net.
    initializer = Initializer(model, nodes, path)
    
    #input_shape = initializer.model_input_shape

    
    # extract weights and biases
    initializer.write_weights()
    initializer.write_bias()
    
    maxog = 4
    conv_line = '{"name":"%s","weights":{"file":"%s","size":[%d,%d,%d,%d]},"bias":{"file":"%s","size":[%d]}, "maxog":%d}\n'
    
    with open(os.path.join(path,"conv.json"), 'w') as f:
      for k in initializer.wdict.keys():
        if k in initializer.bdict.keys():
          w = initializer.wdict[k]
          b = initializer.bdict[k]
          wshape = initializer.wdict_shape[k]
          bshape = initializer.bdict_shape[k]
          
          f.write(conv_line%(k, w, wshape[0], wshape[1], wshape[2], wshape[3], b, bshape[0], maxog))
        
    
    print ("done.\n")
    
    
    
    
    
    
    
