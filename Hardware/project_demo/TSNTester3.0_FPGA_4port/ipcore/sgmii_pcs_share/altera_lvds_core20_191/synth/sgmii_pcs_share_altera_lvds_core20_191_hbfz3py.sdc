

#####################################################################
#
# THIS IS AN AUTO-GENERATED FILE!
# -------------------------------
# If you modify this files, all your changes will be lost if you
# regenerate the core!
#
# FILE DESCRIPTION
# ----------------
# This file specifies the timing constraints for the Altera LVDS interface


# Source helper script 
set script_dir [file dirname [info script]]
source "$script_dir/sdc_util.tcl"

set syn_flow 0
set sta_flow 0
set fit_flow 0
if { $::TimeQuestInfo(nameofexecutable) == "quartus_map" } {
   set syn_flow 1
} elseif { $::TimeQuestInfo(nameofexecutable) == "quartus_sta" } {
   set sta_flow 1
} elseif { $::TimeQuestInfo(nameofexecutable) == "quartus_fit" } {
   set fit_flow 1
}



##########################################################################################
# Modifiable user variables
# Change these values to match your design.
##########################################################################################



##########################################################################################
# The following functions are to find out all the instances and the corresponding PLL 
# refclk.  If you see an critical warning, modify to match your design.
##########################################################################################

set libname sgmii_pcs_share_altera_lvds_core20_191_hbfz3py 
set corename altera_lvds_core20 

set catch_exception [catch { 
   set lvds_instance_name_list [altera_iosubsystem_get_ip_instance_names $libname $corename]
 } ]
 
 if {$catch_exception != 0} {
    post_message -type critical_warning "Errors encountered when searching for LVDS instance name and ref clock pin names.  Please override variables lvds_instance_name_list and rerun read_sdc"
    return 
 }
 
##########################################################################################
# Derived user variables
##########################################################################################


###########################################################
# IP parameters
###########################################################

   
# Throw error only at TimeQuest but critical warning in Fitter\n"
if {$fit_flow} {
   set msg_error_type "critical_warning"
} else {
   set msg_error_type "error"
}

set OC_C2P_SU 0.0
set OC_C2P_H  0.0
set OC_P2C_SU 0.0
set OC_P2C_H  0.0
set use_external_pll 0
set j_factor 10 
set ref_clock_period_ns 8.0 
set slow_clock_period_ns 8.0 
set fast_clock_period_ns 0.8 
set sclk_multiply_by 10 
set sclk_divide_by 10 
set sclk_phase 0.0 
set fclk_multiply_by 10 
set fclk_divide_by 1 
set fclk_phase 180 
set loaden_multiply_by 10 
set loaden_divide_by 10 
set loaden_phase 324.0 
set loaden_duty 10.0 
set tx_outclock_fclk_multiply_by 10 
set tx_outclock_fclk_divide_by 10 
set tx_outclock_fclk_phase 0 
set tx_outclock_loaden_multiply_by 10 
set tx_outclock_loaden_divide_by 1 
set tx_outclock_loaden_phase 0.0 
set tx_outclock_loaden_duty 10.0 

# Iterate through all instances of this IP 
foreach lvds_instance_name $lvds_instance_name_list {  

   set ::RCCS($lvds_instance_name) 0.0 
   set half_RCCS [expr $::RCCS($lvds_instance_name) / 2.0] 

   set core_clocks [list]
   set periphery_clocks [list]

   set lvds_core_instance_name "${lvds_instance_name}|arch_inst" 

   ###########################################################################################
   # Create Common Clocks, Periods, and Delays
   ###########################################################################################

   

   set lvds_clock_tree_inst_name "${lvds_core_instance_name}|clock_pin_lvds_clock_tree.lvds_clock_tree_inst"
   set pll_fclk_tree_name "${lvds_clock_tree_inst_name}|lvdsfclk_in"
   if {[catch {get_node_info -name [get_edge_info -src [get_node_info -clock_edges $pll_fclk_tree_name]]} pll_fclk_name] != 0} {
      set pll_fclk_name $pll_fclk_tree_name
      if {$use_external_pll} {
      } else {
      }
   }

   if {[catch {
      set pll_instance_name [get_cell_info -name [get_node_info -cell $pll_fclk_name]]
      set pll_ref_ck_name "${pll_instance_name}|refclk[0]"
      set ref_ck_port_id [altera_iosubsystem_get_input_clk_id [get_nodes $pll_ref_ck_name]]
      set ref_ck_pin [get_port_info -name $ref_ck_port_id]
   }]} {
      set pll_fclk_name ""
      set pll_lden_name ""
      set pll_ref_ck_name ""
      set ref_ck_pin ""
   }
 
   if {[catch { get_node_info -name [altera_iosubsystem_get_src_pll_out_pin ${lvds_core_instance_name}|dprio_clk_gen.dprio_div_counter[1]] } pll_out_pin ]} {
      set pll_out_pin ""
      post_message -type $msg_error_type "SDC cannot find clock source DPRIO registers.  Please check PLL coreclock and pll_locked connectivity."
   }
   if {!$use_external_pll} { 
      if {$ref_ck_pin != ""} {
         if {[altera_iosubsystem_get_clock_name_from_target $ref_ck_pin] == ""} {
            create_clock -name $ref_ck_pin -period $ref_clock_period_ns $ref_ck_pin
         }
         if {$pll_fclk_name != "" } {
            altera_iosubsystem_create_generated_clock -source "${ref_ck_pin}" -divide_by $fclk_divide_by -multiply_by $fclk_multiply_by -phase $fclk_phase -duty_cycle 50.00 -name "$pll_fclk_name" -target "$pll_fclk_name"
         }
         if {$pll_out_pin != ""} {
            altera_iosubsystem_create_generated_clock -source "${ref_ck_pin}" -divide_by $sclk_divide_by -multiply_by $sclk_multiply_by -phase $sclk_phase -duty_cycle 50.00 -name "${pll_out_pin}" -target "${pll_out_pin}"
         }
      }
   }
   if {$pll_out_pin != ""} {
      altera_iosubsystem_create_generated_clock -multiply_by 1 -divide_by 4 -source ${pll_out_pin} -name ${lvds_instance_name}_dprio_clk -target ${lvds_core_instance_name}|dprio_clk_gen.dprio_div_counter[1]
      set_false_path -from ${lvds_instance_name}_dprio_clk -to ${lvds_core_instance_name}|dprio_clk_gen.dprio_div_counter[*]
      lappend core_clocks ${lvds_instance_name}_dprio_clk
   }

   lappend core_clocks ${pll_out_pin}
   lappend periphery_clocks $pll_fclk_name   
   
      
   # generate clocks at LVDS data output to capture the proper periphery to core transfer 
   set num_chan 4 

   for {set ichan 0} {$ichan < $num_chan} {incr ichan} { 
      if {[catch {get_node_info -name [altera_iosubsystem_get_src_pll_in_pin ${lvds_core_instance_name}|channels[$ichan].soft_cdr.serdes_dpa_inst~dpa_reg]} pll_in_pin]} {
         if {$use_external_pll} {
            post_message -type $msg_error_type "SDC cannot find the PLL that drives DPA.  Clock settings of channel $ichan are not created.  Please check your external PLL connectivity is in accordance with the Altera LVDS user guide."
         } else {
            post_message -type $msg_error_type "SDC cannot find the PLL that drives DPA.  Clock settings of channel $ichan are not created.  Please check the PLL to LVDS IP connectivity."
         }
         continue;
      }
      altera_iosubsystem_create_generated_clock -source ${pll_in_pin} -name ${lvds_instance_name}_dpa_ck_name_$ichan -divide_by $fclk_divide_by -multiply_by $fclk_multiply_by  -target ${lvds_core_instance_name}|channels[$ichan].soft_cdr.serdes_dpa_inst~dpa_reg 
      lappend periphery_clocks ${lvds_instance_name}_dpa_ck_name_$ichan
      if {[is_fitter_in_qhd_mode]} {
         altera_iosubsystem_create_generated_clock -invert 1 -source ${lvds_core_instance_name}|channels[$ichan].soft_cdr.serdes_dpa_inst~dpa_reg -name ${lvds_instance_name}_core_ck_name_$ichan -divide_by $j_factor -target ${lvds_core_instance_name}|channels[$ichan].soft_cdr.serdes_dpa_inst~O_PCLK 
      } else {
         altera_iosubsystem_create_generated_clock -invert 1 -source ${lvds_core_instance_name}|channels[$ichan].soft_cdr.serdes_dpa_inst~dpa_reg -name ${lvds_instance_name}_core_ck_name_$ichan -divide_by $j_factor -target ${lvds_core_instance_name}|channels[$ichan].soft_cdr.divfwdclk 
      }
      lappend core_clocks ${lvds_instance_name}_core_ck_name_$ichan
      for {set index 0} {$index < $j_factor} {incr index} { 
         altera_iosubsystem_create_generated_clock -source ${lvds_core_instance_name}|channels[${ichan}].soft_cdr.serdes_dpa_inst~dpa_reg -name ${lvds_instance_name}_dpa_data_out_${ichan}_$index -divide_by $j_factor -target ${lvds_core_instance_name}|channels[$ichan].soft_cdr.serdes_dpa_inst|rxdata[$index]	
         altera_iosubsystem_create_generated_clock -remove_clock 0 -add 1 -invert 1 -source ${lvds_core_instance_name}|channels[${ichan}].soft_cdr.serdes_dpa_inst~dpa_reg -name ${lvds_instance_name}_dpa_data_out_${ichan}_${index}_neg -divide_by $j_factor -target ${lvds_core_instance_name}|channels[$ichan].soft_cdr.serdes_dpa_inst|rxdata[$index]
         lappend periphery_clocks ${lvds_instance_name}_dpa_data_out_${ichan}_$index
         lappend periphery_clocks ${lvds_instance_name}_dpa_data_out_${ichan}_${index}_neg
         set_false_path -fall_from ${lvds_instance_name}_dpa_data_out_${ichan}_$index 
         set_false_path -rise_from ${lvds_instance_name}_dpa_data_out_${ichan}_${index}_neg 
      } 
   } 

         lappend periphery_clocks  "$ref_ck_pin" 

   # Set max delay constraint in FIT to avoid rediculous long dpa_locked path but cut the timing path in STA since we have synchronizer 
   if {$fit_flow == 1} { 
      set_max_delay -from ${lvds_core_instance_name}|channels[*].soft_cdr.serdes_dpa_inst~dpa_reg -to [get_fanouts ${lvds_core_instance_name}|channels[*].soft_cdr.serdes_dpa_inst|dpalock] [expr 2*$slow_clock_period_ns] 
   } else { 
      set_false_path -from ${lvds_core_instance_name}|channels[*].soft_cdr.serdes_dpa_inst~dpa_reg -to [get_fanouts ${lvds_core_instance_name}|channels[*].soft_cdr.serdes_dpa_inst|dpalock] 
   } 


   # Set max delay constraint in FIT to avoid rediculous long fiforeset path but cut the timing path in STA since we have synchronizer 
   set through_pin_collection [get_pins -nowarn ${lvds_core_instance_name}|channels[*].soft_cdr.serdes_dpa_inst|fiforeset] 
   if {[get_collection_size $through_pin_collection] > 0} { 
      if {$fit_flow == 1} { 
         set_max_delay -through [get_pins -nowarn ${lvds_core_instance_name}|channels[*].soft_cdr.serdes_dpa_inst|fiforeset] [expr 2*$slow_clock_period_ns] 
      } else { 
         set_false_path -through [get_pins -nowarn ${lvds_core_instance_name}|channels[*].soft_cdr.serdes_dpa_inst|fiforeset] 
      } 
   } 


   # Set max delay constraint in FIT to avoid rediculous long dpareset path but cut the timing path in STA since we have synchronizer 
   set through_pin_collection [get_pins -nowarn ${lvds_core_instance_name}|channels[*].soft_cdr.serdes_dpa_inst|dpareset] 
   if {[get_collection_size $through_pin_collection] > 0} { 
      if {$fit_flow == 1} { 
         set_max_delay -through [get_pins -nowarn ${lvds_core_instance_name}|channels[*].soft_cdr.serdes_dpa_inst|dpareset] [expr 2*$slow_clock_period_ns] 
      } else { 
         set_false_path -through [get_pins -nowarn ${lvds_core_instance_name}|channels[*].soft_cdr.serdes_dpa_inst|dpareset] 
      } 
   } 


   # Set max delay constraint in FIT to avoid rediculous long reset path but cut the timing path in STA since we have synchronizer 
   set to_pin_collection [get_keepers -nowarn ${lvds_core_instance_name}|channels[*].soft_cdr.rx_bitslip|bitslip_reset_synchronizer|sync_reg[0]] 
   if {[get_collection_size $to_pin_collection] > 0} { 
      if {$fit_flow == 1} { 
         set_max_delay -to [get_keepers -nowarn ${lvds_core_instance_name}|channels[*].soft_cdr.rx_bitslip|bitslip_reset_synchronizer|sync_reg[0]] [expr 2*$slow_clock_period_ns] 
      } else { 
         set_false_path -to [get_keepers -nowarn ${lvds_core_instance_name}|channels[*].soft_cdr.rx_bitslip|bitslip_reset_synchronizer|sync_reg[0]] 
      } 
   } 


   # Set max delay constraint in FIT to avoid rediculous long ctrl path but cut the timing path in STA since we have synchronizer 
   set to_pin_collection [get_keepers -nowarn ${lvds_core_instance_name}|channels[*].soft_cdr.rx_bitslip|bitslip_ctrl_synchronizer|sync_reg[0]] 
   if {[get_collection_size $to_pin_collection] > 0} { 
      if {$fit_flow == 1} { 
         set_max_delay -to [get_keepers -nowarn ${lvds_core_instance_name}|channels[*].soft_cdr.rx_bitslip|bitslip_ctrl_synchronizer|sync_reg[0]] [expr 2*$slow_clock_period_ns] 
      } else { 
         set_false_path -to [get_keepers -nowarn ${lvds_core_instance_name}|channels[*].soft_cdr.rx_bitslip|bitslip_ctrl_synchronizer|sync_reg[0]] 
      } 
   } 


   # Set max delay constraint in FIT to avoid rediculous long reset path but cut the timing path in STA since we have synchronizer 
   if {$fit_flow == 1} { 
      set_max_delay -through [get_pins -compatibility_mode -nowarn ${lvds_core_instance_name}|*pll_areset_sync*sync_reg[*]|clrn] [expr 2*$slow_clock_period_ns] 
   } else { 
      set_false_path -through [get_pins -compatibility_mode -nowarn ${lvds_core_instance_name}|*pll_areset_sync*sync_reg[*]|clrn] 
   } 



   # ------------------------- #
   # -                       - #
   # --- CLOCK UNCERTAINTY --- #
   # -                       - #
   # ------------------------- #
   

   if {($fit_flow == 1 || $sta_flow == 1)} {

      # Build target to clock names cache
      #Needed for external PLL mode because the clock name is not the same as the pin name
      array unset target_to_clock_name_map *
      foreach_in_collection iclk_name [get_clocks] {
         if { [catch { [get_node_info -name [get_clock_info -target $iclk_name]] } itarget ] } {
            continue
         }
         lappend target_to_clock_name_map($itarget) [get_clock_info -name $iclk_name]
      }

      # Get extra periphery clock uncertainty
      set periphery_clock_uncertainty [list]
      altera_iosubsystem_get_periphery_clock_uncertainty periphery_clock_uncertainty 

      if {$fit_flow == 1} {
         set overconstraints [list $OC_C2P_SU $OC_C2P_H $OC_P2C_SU $OC_P2C_H]
      } else {
         set overconstraints [list 0.0 0.0 0.0 0.0]
      }

      # Now loop over core/periphery clocks and set clock uncertainty
      set i_core_clock 0
      foreach core_clock $core_clocks {
         if {$core_clock != ""} {

            if {[info exists target_to_clock_name_map($core_clock)]} {
               set core_clock_target $target_to_clock_name_map($core_clock)               
            } else {
               set core_clock_target $core_clock
            }
				if {[get_collection_size [get_clocks -nowarn $core_clock_target]]==0} {
					continue
				}
            set i_periphery_clock 0
            foreach { periphery_clock } $periphery_clocks {

               if {[info exists target_to_clock_name_map($periphery_clock)]} {
                  set periphery_clock_target $target_to_clock_name_map($periphery_clock)
               } else {
                  set periphery_clock_target $periphery_clock
               }
					if {[get_collection_size [get_clocks -nowarn $periphery_clock_target]]==0} {
						continue
					}		
               # For these transfers it is safe to use the -add option since we rely on 
               # derive_clock_uncertainty for the base value.
               set add_to_derived "-add"
               set c2p_su         [expr [lindex $overconstraints 0] + [lindex $periphery_clock_uncertainty 0]]
               set c2p_h          [expr [lindex $overconstraints 1] + [lindex $periphery_clock_uncertainty 1]]
               set p2c_su         [expr [lindex $overconstraints 2] + [lindex $periphery_clock_uncertainty 2]]
               set p2c_h          [expr [lindex $overconstraints 3] + [lindex $periphery_clock_uncertainty 3]]


               set_clock_uncertainty -from [get_clocks $core_clock_target] -to   [get_clocks $periphery_clock_target] -setup $add_to_derived $c2p_su
               set_clock_uncertainty -from [get_clocks $core_clock_target] -to   [get_clocks $periphery_clock_target] -hold  $add_to_derived $c2p_h
               set_clock_uncertainty -to   [get_clocks $core_clock_target] -from [get_clocks $periphery_clock_target] -setup $add_to_derived $p2c_su
               set_clock_uncertainty -to   [get_clocks $core_clock_target] -from [get_clocks $periphery_clock_target] -hold  $add_to_derived $p2c_h

               incr i_periphery_clock
            }
         }
         incr i_core_clock
      }
   }

      
} 

add_rskm_report_command altera_iosubsystem_report_rskm
add_tccs_report_command altera_iosubsystem_report_tccs

if {[altera_iosubsystem_get_a10_iopll_workaround_present]} { 
   derive_pll_clocks 
} 
