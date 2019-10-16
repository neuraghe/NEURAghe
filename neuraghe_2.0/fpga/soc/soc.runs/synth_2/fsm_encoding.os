
 add_fsm_encoding \
       {uC_to_prog.CS_snd} \
       { }  \
       {{0000 0000} {0001 0101} {0010 0110} {0011 0111} {0100 1000} {0101 0011} {0110 0001} {0111 0100} {1000 0010} {1001 1001} }

 add_fsm_encoding \
       {mchan_prog.CS} \
       { }  \
       {{00000 0000} {00001 1011} {00010 1100} {00011 0001} {00100 0010} {00101 0011} {00110 0100} {00111 0101} {01000 0110} {01001 0111} {01010 1000} {01011 1001} {01100 1010} }

 add_fsm_encoding \
       {trans_aligner.CS} \
       { }  \
       {{0000 0000} {0001 0001} {0010 0010} {0011 0100} {0100 0110} {0101 0111} {0110 0101} {0111 0011} {1000 1000} {1001 1001} }

 add_fsm_encoding \
       {icache_ctrl_unit.CS} \
       { }  \
       {{000 000} {001 001} {010 010} {100 011} {101 100} }

 add_fsm_encoding \
       {instr_core_interface.CS} \
       { }  \
       {{000 000} {001 010} {010 011} {011 100} {100 001} }

 add_fsm_encoding \
       {controller.dbg_fsm_cs} \
       { }  \
       {{000 000} {001 001} {010 010} {011 011} {100 100} {101 101} {111 110} }

 add_fsm_encoding \
       {controller.ctrl_fsm_cs} \
       { }  \
       {{000 00} {001 01} {010 10} {011 11} }

 add_fsm_encoding \
       {exc_controller.exc_fsm_cs} \
       { }  \
       {{000 000} {001 001} {010 101} {011 010} {100 011} {101 100} }

 add_fsm_encoding \
       {load_store_unit.CS} \
       { }  \
       {{000 000} {001 001} {010 100} {011 011} {100 010} }

 add_fsm_encoding \
       {debug_unit.BP_State_SP} \
       { }  \
       {{000 00} {010 01} {011 10} {111 11} }

 add_fsm_encoding \
       {uC_to_wei.CS_snd} \
       { }  \
       {{0000 000} {0001 011} {0010 100} {0011 001} {0100 010} {0101 101} }

 add_fsm_encoding \
       {uC_to_wei__parameterized0.CS_snd} \
       { }  \
       {{0000 000} {0001 011} {0010 100} {0011 001} {0100 010} {0101 101} }

 add_fsm_encoding \
       {hwce_wrapper_fsm.wrapper_state} \
       { }  \
       {{00 00} {01 01} {10 10} {11 11} }

 add_fsm_encoding \
       {hwce_engine_fsm.fsm_state} \
       { }  \
       {{000 000} {001 001} {010 100} {011 011} {100 101} {101 010} }

 add_fsm_encoding \
       {axi_write_only_ctrl.CS} \
       { }  \
       {{000 000} {001 010} {010 001} {011 011} {100 100} }

 add_fsm_encoding \
       {axi_read_only_ctrl.CS} \
       { }  \
       {{000 000} {001 110} {010 001} {011 111} {100 100} {101 011} {110 010} {111 101} }
