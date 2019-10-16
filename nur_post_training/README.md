Post training scripts are 3:
  post_training.py -> given a weights set and biases create an array with weights and biases disposed, interlaced and subdivided
  input_features.py -> this script is optional. with it you can interlace test input features for the simulation of the system.
  create_header.py -> this script groups each array created by previous scripts into one header file.

The additional script fake_input.py cab be used to genarate tests.

The zero_padding.py script processes an input stream to add the needed zeroes to perform software ZP.

See the HOW TO file for further informations.
