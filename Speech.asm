.module/ram/abs=0 main_prog;
.macro alter(%0, %1);
m5 = %1;
modify(%0, m5);
.endmacro;

.const heap_length = 64; // malloc(), memory_ctrl_block
#define WRD16_FLAG

//struct mcb {
// _Bool invalid;
// short size;
//}

//.section SPICIN Buffer
.var/dm/ram/abs=0x0000 spicin_buffer[16];
.var/dm/ram/abs=0x0010 spicout_buffer[4];
.var/dm/ram/abs=0x0014 spicin_read_ptr[1];
.var/dm/ram/abs=0x0015 spicin_write_ptr[1];

//.section Audio Signal Path
.var/dm/ram/abs=0x0016 VOUT_I[1]; // dummy
.var/dm/ram/abs=0x0017 VOUT_II[1]; // dummy
.var/dm/ram/abs=0x0018 VOUT_III[1]; // dummy
.var/dm/ram/abs=0x0019 VOUT_IV[1]; // dummy
.var/dm/ram/abs=0x001a audio_buffer_ptr[1];
.var/dm/ram/abs=0x001b audio_cntr[1];
.var/dm/ram/abs=0x001c audio_event_trigger[1];
.var/dm/ram/abs=0x001d audio_start_address[1];
.var/dm/ram/abs=0x001e output_write_ptr[1];
.var/dm/ram/abs=0x001f output_read_ptr[1];

//.section Slave SPIRQ Cntrl
.var/dm/ram/abs=0x0020 SPIRQ_RS_FLAG[1]; {slave SPIRQ}
.var/dm/ram/abs=0x0021 SPIRQ_Buffer[6]; {IRQ Message Buffer}
.var/dm/ram/abs=0x0027 SPIRQ_READ_PTR[1];
.var/dm/ram/abs=0x0028 SPIRQ_WRITE_PTR[1];

//.section SRC Polyphase Path
.var/dm/ram/abs=0x0029 poly_coeff[16];
.var/dm/ram/abs=0x0039 _poly_buffer_wptr[1];
.var/dm/ram/abs=0x003a _poly_buffer_wptr_i[1];
.var/dm/ram/abs=0x003b INTP16K_IN[1];
.var/dm/ram/abs=0x003c INTP32K_IN[1];
.var/dm/ram/abs=0x003d INTP32K_IN_I[1];

//.section DTMF Static
.var/dm/ram/abs=0x005a $TWD_FACT_128[128]; // 2*pi/128, 2*pi*2/128 = 2*pi*1/64
.var/dm/ram/abs=0x00da $bit_rev_table[64];
.var/dm/ram/abs=0x011a $data_power[130];
.var/dm/ram/abs=0x019c $vector[2];
.var/dm/ram/abs=0x019e $angle_table[40];
.var/dm/ram/abs=0x01c6 $R_Data[2];
.var/dm/ram/abs=0x01c8 $I_Data[2];
.var/dm/ram/abs=0x01ca $sum_A[2];
.var/dm/ram/abs=0x01cc $sum_B[2];
.var/dm/ram/abs=0x01ce $dtmf_freq_buffer[8];
.var/dm/ram/abs=0x01d6 $dtmf_freqh_buffer[8];
.var/dm/ram/abs=0x01de $dtmf_freq_esti_l[2];
.var/dm/ram/abs=0x01e0 $dtmf_freq_esti_h[2];
.var/dm/ram/abs=0x01e2 $cntr_Nmr[1];
.var/dm/ram/abs=0x01e3 $cntr_group[1];
.var/dm/ram/abs=0x01e4 $cntr_bfly[1];
.var/dm/ram/abs=0x01e5 $sum_C[2];
.var/dm/ram/abs=0x01e7 $sum_D[2];
.var/dm/ram/abs=0x01e9 $sum_P[2];
.var/dm/ram/abs=0x01eb $sum_Q[2];
.var/dm/ram/abs=0x01ed $dtmf_sort_buffer[8];
.var/dm/ram/abs=0x01f5 $dtmf_power_buffer[3];
.var/dm/ram/abs=0x01f8 $ZCR_Buffer[4];
.var/dm/ram/abs=0x01fc $temp_buffer[4];

//.section Selective Call Static
.var/dm/ram/abs=0x0200 $sel_flag[1];
.var/dm/ram/abs=0x0201 $freq_esti[2];
.var/dm/ram/abs=0x0203 $Freq_max[2];
.var/dm/ram/abs=0x0205 $Freq_min[2];
.var/dm/ram/abs=0x0207 $temp_signal[4];
.var/dm/ram/abs=0x020b $Power_buffer[4];
.var/dm/ram/abs=0x020f $Freq_buffer[6];
.var/dm/ram/abs=0x0215 $median_buffer[6];

//.section SubAudio Filt Static
.var/dm/ram/abs=0x021b $sub_filt_coeff[25];
.var/dm/ram/abs=0x0234 $sub_filt_taps[22];

//.section HPF Filt Static
.var/dm/ram/abs=0x024a $hpf_filt_coeff[25];
.var/dm/ram/abs=0x0263 $hpf_filt_taps[22];

//.section Demphasis Static
.var/dm/ram/abs=0x0279 $hrd[65];
.var/dm/ram/abs=0x02ba $hr[33];

//.section Scrambler Static
.var/dm/ram/abs=0x02db $FSTD[2];
.var/dm/ram/abs=0x02dd $angle_table_32[40];
.var/dm/ram/abs=0x0305 $finv_buffer[31];

//.section Compander Static
.var/dm/ram/abs=0x0324 $COMPD[1];

//.section Squelch Static
.var/dm/ram/abs=0x0325 $Squelch_Buffer[16];
.var/dm/ram/abs=0x0335 $squelch_cntr[1];
.var/dm/ram/abs=0x0336 $squelch_event_trigger[1];

//.section Emphasis Static
.var/dm/ram/abs=0x0337 $empd[6];
.var/dm/ram/abs=0x033d $hd[6];
//.section Radix 2^2 CFFT Static
.var/dm/ram/abs=0x0343 $Node_Cntr;
.var/dm/ram/abs=0x0344 $cntr_Nmr_inv;
.var/dm/ram/abs=0x0345 $table_index;
//.section DC Reject Static
.var/dm/ram/abs=0x0346 _dc_reject_taps[3];
.var/dm/ram/abs=0x0349 _dc_reject_coeff[3];
//.section Software UART Static
.var/dm/ram/abs=0x034c uart_tx_buffer[1];
//.section SRC(8, 16) Static
.var/dm/ram/abs=0x0360 $_poly_buffer_i[32];

//.section Audio Codec Ping-Pong Buffer
.var/dm/ram/abs=0x0380 $audio_buffer[128]; // may reduce to 64 wrds
.var/dm/ram/abs=0x0400 $output_buffer[128];
.var/dm/ram/abs=0x0480 $fft_buffer[128];
.var/dm/ram/abs=0x0500 $In_buffer[128];
.var/dm/ram/abs=0x0580 $rfft_out[128];
.var/dm/ram/abs=0x0600 $analysis_buffer[128];

//.section CTCSS Static
.var/dm/ram/abs=0x0680 $CTCSS_STAT[1];
.var/dm/ram/abs=0x0681 $ANTI_STAT[1];
.var/dm/ram/abs=0x0682 $CMPR_Buffer[16];
.var/dm/ram/abs=0x0692 $ctcss_data_power[130]; // private
.var/dm/ram/abs=0x0714 $dft_buffer[16];
.var/dm/ram/abs=0x0724 $ctcss_freq_buffer[8]; // private
.var/dm/ram/abs=0x072c $ctcss_power_buffer[6]; // private
.var/dm/ram/abs=0x0732 $ctcss_temp_signal[6]; // private
.var/dm/ram/abs=0x0738 $ctcss_freq_esti[2]; // private
.var/dm/ram/abs=0x073a $PW[2];
.var/dm/ram/abs=0x073c $CTCSS_Timer[1];
.var/dm/ram/abs=0x073d $ACC[2];
.var/dm/ram/abs=0x073f $ctcss_r_data[2]; // private
.var/dm/ram/abs=0x0741 $ctcss_i_data[2]; // private
.var/dm/ram/abs=0x0743 $ctcss_sum_a[2]; // private
.var/dm/ram/abs=0x0745 $ctcss_sum_b[2]; // private
.var/dm/ram/abs=0x0747 $ctcss_sum_c[2]; // private
.var/dm/ram/abs=0x0749 $ctcss_sum_d[2]; // private
.var/dm/ram/abs=0x074b $F_L[2];
.var/dm/ram/abs=0x074d $F_H[2];

//.section DCS Static
.var/dm/ram/abs=0x074f $dcs_buffer[23];
.var/dm/ram/abs=0x0766 $Wctrl[1];
.var/dm/ram/abs=0x0767 $Wcntrl[1];
.var/dm/ram/abs=0x0768 $NCO_Prev[1];
.var/dm/ram/abs=0x0769 $NCO_I_Prev[1];
.var/dm/ram/abs=0x076a $NCO_II_Prev[1];
.var/dm/ram/abs=0x076b $NRZ_Buffer[32];
.var/dm/ram/abs=0x078b $match_filt_buffer[59];
.var/dm/ram/abs=0x07c6 $match_filt_data[1];
.var/dm/ram/abs=0x07c7 $dcs_event[1];
.var/dm/ram/abs=0x07c8 $dcs_code_lwr[1];
.var/dm/ram/abs=0x07c9 $dcs_code_upr[1];
.var/dm/ram/abs=0x07ca $cntr_dcs[1];
.var/dm/ram/abs=0x07cb $dcs_power_buffer[6];
.var/dm/ram/abs=0x07d1 $dcs_temp_buffer[6];
.var/dm/ram/abs=0x07d7 $dcs_stat[1];
.var/dm/ram/abs=0x07d8 $dcs_ACC[2];

//.section pc stacks
.var/dm/ram/abs=0x07f0 pc_stacks[16];
.var/dm/ram/abs=0x0800 $fract_filt[288];
//.section CFFT Radix 2^2 Twiddle Factor
.var/dm/ram/abs=0x0920 $TWD_FACT[128];
//.section SRC(16, 32) Static
.var/dm/ram/abs=0x09a0 $_poly_buffer_ii[32];

//.section heap
//.var/dm/ram/abs=0x0a78 heap_block[64]; // for void *malloc(size_t) implementations
//.section sinusoidal table
.var/dm/ram/abs=0x0a78 cos_table[32];
.var/dm/ram/abs=0x0a98 sin_table[32];

//.section main_arg1
.var/dm/ram/abs=0x0ab8 main_arg1[4]; // device ID

//.section main char *argv[]
.var/dm/ram/abs=0x0abc main_argv[2];

//.section Local Variables Stacks
.var/dm/ram/abs=0x0abe stack_base[32];

//.section Intrps Stacks
.var/dm/ram/abs=0x0ade isr_ax0[1];
.var/dm/ram/abs=0x0adf isr_ax1[1];
.var/dm/ram/abs=0x0ae0 isr_ay0[1];
.var/dm/ram/abs=0x0ae1 isr_ay1[1];
.var/dm/ram/abs=0x0ae2 isr_mx0[1];
.var/dm/ram/abs=0x0ae3 isr_mx1[1];
.var/dm/ram/abs=0x0ae4 isr_my0[1];
.var/dm/ram/abs=0x0ae5 isr_my1[1];
.var/dm/ram/abs=0x0ae6 isr_sr0[1];
.var/dm/ram/abs=0x0ae7 isr_sr1[1];
.var/dm/ram/abs=0x0ae8 isr_si[1];
.var/dm/ram/abs=0x0ae9 isr_se[1];
.var/dm/ram/abs=0x0aea isr_ar[1];
.var/dm/ram/abs=0x0aeb isr_af[1];
.var/dm/ram/abs=0x0aec isr_mr0[1];
.var/dm/ram/abs=0x0aed isr_mr1[1];
.var/dm/ram/abs=0x0aee isr_i0[1];
.var/dm/ram/abs=0x0aef isr_i1[1];
.var/dm/ram/abs=0x0af0 isr_i2[1];
.var/dm/ram/abs=0x0af1 isr_i3[1];
.var/dm/ram/abs=0x0af2 isr_m0[1];
.var/dm/ram/abs=0x0af3 isr_m1[1];
.var/dm/ram/abs=0x0af4 isr_m2[1];
.var/dm/ram/abs=0x0af5 isr_m3[1];
.var/dm/ram/abs=0x0af6 isr_l0[1];
.var/dm/ram/abs=0x0af7 isr_l1[1];
.var/dm/ram/abs=0x0af8 isr_l2[1];
.var/dm/ram/abs=0x0af9 isr_l3[1];
.var/dm/ram/abs=0x0afa spi_ay0[1];
.var/dm/ram/abs=0x0afb spi_ar[1];
.var/dm/ram/abs=0x0afc spi_af[1];
.var/dm/ram/abs=0x0afd spi_m2[1];
.var/dm/ram/abs=0x0afe spi_i3[1];
.var/dm/ram/abs=0x0aff spi_l3[1];

//.section Cntrl Registers
.VAR/DM/RAM/ABS=0X3FE0  $spicin;
.VAR/DM/RAM/ABS=0X3FE1  $spicout; // CR01
.VAR/DM/RAM/ABS=0X3FE2  $PCM_IN;
.VAR/DM/RAM/ABS=0X3FE3  $GPR1;
.VAR/DM/RAM/ABS=0X3FE4  $GPR2;
.VAR/DM/RAM/ABS=0X3FE5  $GPR3; {idle, clk_slow}
.VAR/DM/RAM/ABS=0X3FE6  $VOUT1;
.VAR/DM/RAM/ABS=0X3FE7  $VOUT2;
.VAR/DM/RAM/ABS=0X3FE8  $GPR4;
.VAR/DM/RAM/ABS=0X3FE9  $GPR5;
.VAR/DM/RAM/ABS=0X3FEA  $CR0A;
.VAR/DM/RAM/ABS=0X3FEB  $CR0B;
.VAR/DM/RAM/ABS=0X3FEC  $GPR7;
.VAR/DM/RAM/ABS=0X3FED  $VOUT5;
.VAR/DM/RAM/ABS=0X3FEE  $VOUT6;
.VAR/DM/RAM/ABS=0X3FEF  $VOUT7;
.VAR/DM/RAM/ABS=0X3FF0  $VOUT8;
.VAR/DM/RAM/ABS=0X3FF1  $CR11; 
.VAR/DM/RAM/ABS=0X3FF2  $GPR8;
.VAR/DM/RAM/ABS=0X3FF3  $CR13;
.VAR/DM/RAM/ABS=0X3FF4  $TIMER; // 0.25ms resolutions
.VAR/DM/RAM/ABS=0X3FF5  $CR15;
.VAR/DM/RAM/ABS=0X3FF6  $VOUT3;
.VAR/DM/RAM/ABS=0X3FF7  $VOUT4;
.VAR/DM/RAM/ABS=0X3FF8  $GPR10;
.VAR/DM/RAM/ABS=0X3FF9  $CH_NUM;
.VAR/DM/RAM/ABS=0X3FFA  $SPIDIN;
.VAR/DM/RAM/ABS=0X3FFB  $SPIDOUT;
.VAR/DM/RAM/ABS=0X3FFC  $GPR12;
.VAR/DM/RAM/ABS=0X3FFD  $GPR13;
.VAR/DM/RAM/ABS=0X3FFE  $GPR14;
.VAR/DM/RAM/ABS=0X3FFF  $GPR15;

.pma = 0;
imask = 0; jump _Reset; m0 = 1; m1 = 0; {PCSP = empty sp}
dm(spi_ay0) = ay0; jump _SPI_ISR; dm(spi_ar) = ar; ar = pass af;
dm(isr_ax0) = ax0; jump _TIMER_ISR; dm(isr_ax1) = ax1; dm(isr_ar) = ar;

_Reset: m2 = -1;
 m3 = 2;
 l0 = 0; l1 = 0; l2 = 0; l3 = 0; // clear L-regs
 m4 = 1; // dedicate register, (i4=sp, m4=1, l4 = 0)
 l4 = 0; l5 = 0; {others are scratched procedure call registers}
 i4 = ^stack_base; // no frame pointer, ADSP 2181 exploits m4 as function stack\ 
 // frame ptr

flushPC: pcsp = 0x07f0; // PCTOS = xxxx, don't care
 i0 = ^pc_stacks; // 16 wrd spaces
 dm(i0, m0) = 0; // clear pc stacks, default pcsp = 2^n-16
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;

flushCntr: ay0 = sstat;
 af = 0x0004 and ay0; // cntr empty ?
 if ne jump flushLoop;
 ay0 = sstat;
 af = 0x0040 and ay0; // loop empty ?
 jump flushCntr;
 pop cntr; // multi-cycle path
 nop; // dummy

flushLoop: ay0 = sstat; // must insert for do while loop
 af = 0x0040 and ay0;
 if ne jump flushSTS; // check for loop stack status, but loop stack placed on \
 // pc stacks???
 ay0 = sstat;
 af = 0x0010 and ay0; // sts empty ? (astat && mtat && imask)
 jump flushLoop;
 pop loop;
 nop; // dummy

flushSTS: ay0 = sstat;
 af = 0x0010 and ay0;
 if ne jump emptySTS;
 ena m_mode; // inter-procedure mstat(0x0002) default value
 icntl = 1; // {3'b{bit_rev, mr, ar}}
 jump flushSTS;
 pop sts;
 nop;

emptySTS: //call _user_codes; // reset Audio Codec
 ay0 = 0x0004; // 4 * 0.25ms = 1ms
 dm(TIMER) = ay0;
 ay0 = dm(CR0B);
 ar = 0x0004 xor ay0; // toggle GPR6.2
 //dm(CR0B) = ar;
 ay0 = dm(CR0B);
 ar = 0x0002 xor ay0; // toggle GPR6.1, 2'b01: out[22:8], 2'b10: out[23:9], 2'b11: out[24:10]
 //dm(CR0B) = ar;

 i0 = 0;
 cntr = 2032; // zero init memory
 do zero_memset until ce;
 zero_memset: dm(i0, m0) = 0;

 i0 = 0x0800; // 2048
 cntr = 768;
 do zero_memmove until ce;
 zero_memmove: dm(i0, m0) = 0;

 ax0 = ^main_arg1;
 dm(main_argv) = ax0;
 ax0 = 0; // null
 dm(0x0abd) = ax0; // &main_argv[1]
 i0 = ^main_arg1;
 dm(i0, m0) = 97;
 dm(i0, m0) = 100;
 dm(i0, m0) = 105;
 dm(i0, m0) = 0;

 ax1 = ^main_argv;
 call _main;
 dm(i4, m4) = ax1, ar = pass 1; // ar = argc
 dm(i4, m4) = ar, af = pass 0;
 m5 = -2; // pop sp
 modify(i4, m5);
 //alter(i4, -2);

_exit: dis m_mode;
 imask = 0;
_exit.end: idle;

_TIMER_ISR: ar = pass af; dm(isr_af) = ar; // alu feedback regs
 dm(isr_ay0) = ay0; dm(isr_ay1) = ay1;
 dm(isr_mr0) = mr0; dm(isr_mr1) = mr1;
 dm(isr_mx0) = mx0; dm(isr_mx1) = mx1; dm(isr_my0) = my0; dm(isr_my1) = my1;
 dm(isr_sr0) = sr0; dm(isr_sr1) = sr1; dm(isr_si) = si; dm(isr_se) = se;
 dm(isr_m0) = m0; dm(isr_m1) = m1; dm(isr_m2) = m2; dm(isr_m3) = m3;
 dm(isr_i0) = i0; dm(isr_i1) = i1; dm(isr_i2) = i2; dm(isr_i3) = i3;
 dm(isr_l0) = l0; dm(isr_l1) = l1; dm(isr_l2) = l2; dm(isr_l3) = l3;

 m0 = 1; m1 = 0; m2 = -1; m3 = 2;
 l0 = 0; l1 = 0; l2 = 0; l3 = 0;
 ena m_mode;
 dis bit_rev; // clear bit reverse
 dis ar_sat;

 i0 = ^VOUT_I; // DAC Data Fetches at Falling Edge of 8kHz
 ar = dm(i0, m0);
 dm(VOUT1) = ar;
 ar = dm(i0, m0);
 dm(VOUT2) = ar;
 ar = dm(i0, m0);
 dm(VOUT3) = ar;
 ar = dm(i0, m0);
 dm(VOUT4) = ar;

 call _mu_law_compress; // Debug Purpose
 i0 = ^PCM_IN;
 i0 = ^PCM_IN;

 ar = dm(PCM_IN); // ADC Data
 i2 = dm(audio_buffer_ptr);
 l2 = 128;
 dm(i2, m0) = ar; // i2+=1
 ar = dm(audio_cntr);
 ar = ar + 1;
 af = 0x003f and ar;
 ay0 = ar, ar = pass af;
 dm(audio_cntr) = ar;
 af = 64 - ay0;
 if gt jump DAC_OUTPUT_DATA;
 dm(audio_buffer_ptr) = i2;
 ar = 0;
 if le ar = pass 1;
 dm(audio_event_trigger) = ar; // Trigger Audio Processing
 m0 = -64;
 modify(i2, m0); // i2-=64
 dm(audio_start_address) = i2;
 m0 = 1;

DAC_OUTPUT_DATA: l2 = 0;
 i0 = dm(output_read_ptr);
 l0 = %output_buffer;
 ax0 = dm(i0, m0); // i0+=1
 dm(output_read_ptr) = i0;
 l0 = 0;
 dm(INTP16K_IN) = ax0;

SRC_8_16: call _SRC_1_2;
 sr0 = dm(INTP16K_IN);
 i3 = dm(_poly_buffer_wptr);
 dm(INTP32K_IN) = ar;
 dm(INTP32K_IN_I) = ax1;

// Insert Only If Tx && Generating DCS

SRC_16_32: call _SRC_2_4;
 sr0 = dm(INTP32K_IN);
 i3 = dm(_poly_buffer_wptr_i);

 dm(VOUT_I) = ar;
 dm(VOUT_II) = ax1;

 call _SRC_2_4;
 sr0 = dm(INTP32K_IN_I);
 i3 = dm(_poly_buffer_wptr_i);

 dm(VOUT_III) = ar;
 dm(VOUT_IV) = ax1;

_TIMER_ISR.end: ax0 = dm(isr_ax0); ax1 = dm(isr_ax1);
 ar = dm(isr_af); af = pass ar; ar = dm(isr_ar);
 ay0 = dm(isr_ay0); ay1 = dm(isr_ay1);
 mx0 = dm(isr_mx0); mx1 = dm(isr_mx1); my0 = dm(isr_my0); my1 = dm(isr_my1);
 mr0 = dm(isr_mr0); mr1 = dm(isr_mr1);
 sr0 = dm(isr_sr0); sr1 = dm(isr_sr1); si = dm(isr_si); se = dm(isr_se);
 m0 = dm(isr_m0); m1 = dm(isr_m1); m2 = dm(isr_m2); m3 = dm(isr_m3);
 l0 = dm(isr_l0); l1 = dm(isr_l1); l2 = dm(isr_l2); l3 = dm(isr_l3);
 i0 = dm(isr_i0); i1 = dm(isr_i1);
 rti;
 i2 = dm(isr_i2);
 i3 = dm(isr_i3);

_SPI_ISR: dm(spi_af) = ar;
 dm(spi_i3) = i3;
 dm(spi_m2) = m2;
 dm(spi_l3) = l3;

 dis bit_rev;
 dis ar_sat;
 m2 = 1;
 l3 = 16;
 ar = dm(CR0A); // SPICRF
 ay0 = 0x8000;
 af = ar and ay0;
 if eq jump _SPI_ISR.end;
 ar = dm(spicin);
 i3 = dm(spicin_write_ptr);
 dm(i3, m2) = ar;
 dm(spicin_write_ptr) = i3;

_SPI_ISR.end: l3 = dm(spi_l3);
 ar = dm(spi_af);
 af = pass ar;
 ar = dm(spi_ar);
 m2 = dm(spi_m2);
 rti;
 ay0 = dm(spi_ay0);
 i3 = dm(spi_i3);

_main: // main function
 ax0 = ^audio_buffer + 127; {global speech signal buffer pointer}
 dm(audio_buffer_ptr) = ax0;
 ax0 = 0xffff;
 dm(audio_cntr) = ax0;
 ax0 = ^output_buffer;
 dm(output_read_ptr) = ax0;
 ax0 = ^output_buffer;
 dm(output_write_ptr) = ax0;

 ax0 = ^SPIRQ_Buffer;
 dm(SPIRQ_READ_PTR) = ax0;
 dm(SPIRQ_WRITE_PTR) = ax0;

 i1 = ^poly_coeff;
 dm(i1, m0) = -36;
 dm(i1, m0) = 41;
 dm(i1, m0) = -64;
 dm(i1, m0) = 94;
 dm(i1, m0) = -132;
 dm(i1, m0) = 184;
 dm(i1, m0) = -246;
 dm(i1, m0) = 327;
 dm(i1, m0) = -429;
 dm(i1, m0) = 562;
 dm(i1, m0) = -734;
 dm(i1, m0) = 977;
 dm(i1, m0) = -1344;
 dm(i1, m0) = 1982;
 dm(i1, m0) = -3413;
 dm(i1, m0) = 10410;

 ax0 = ^_poly_buffer_i; // Circular Buffer Initiate
 dm(_poly_buffer_wptr) = ax0;
 ax0 = ^_poly_buffer_ii;
 dm(_poly_buffer_wptr_i) = ax0;

#ifdef WRD32_FLAG
 i1 = ^hpf_filt_coeff; // HPF-300, Cheby2(10, 33dB, 260Hz/4000Hz, 'high')
 dm(i1, m0) = 12100;
 dm(i1, m0) = -24188;
 dm(i1, m0) = 12100;
 dm(i1, m0) = 29808;
 dm(i1, m0) = -13575;
 dm(i1, m0) = 16384;
 dm(i1, m0) = 16384;
 dm(i1, m0) = -32626; 
 dm(i1, m0) = 29950;
 dm(i1, m0) = -13833;
 dm(i1, m0) = 16384;
 dm(i1, m0) = 16384;
 dm(i1, m0) = -32426;
 dm(i1, m0) = 30258;
 dm(i1, m0) = -14332;
 dm(i1, m0) = 16384;
 dm(i1, m0) = 16384;
 dm(i1, m0) = -32226; 
 dm(i1, m0) = 30765;
 dm(i1, m0) = -15040;
 dm(i1, m0) = 16384;
 dm(i1, m0) = 16384;
 dm(i1, m0) = -32104;
 dm(i1, m0) = 31495;
 dm(i1, m0) = -15909;
#endif

#ifdef WRD32_FLAG
 i1 = ^sub_filt_coeff;
 dm(i1, m0) = 278;
 dm(i1, m0) = -151;
 dm(i1, m0) = 278;
 dm(i1, m0) = 20430;
 dm(i1, m0) = -6576;
 dm(i1, m0) = 16384;
 dm(i1, m0) = 16384;
 dm(i1, m0) = -28597;
 dm(i1, m0) = 25035;
 dm(i1, m0) = -10371;
 dm(i1, m0) = 16384;
 dm(i1, m0) = 16384;
 dm(i1, m0) = -30982;
 dm(i1, m0) = 28476;
 dm(i1, m0) = -13229;
 dm(i1, m0) = 16384;
 dm(i1, m0) = 16384;
 dm(i1, m0) = -31632;
 dm(i1, m0) = 30389;
 dm(i1, m0) = -14860;
 dm(i1, m0) = 16384;
 dm(i1, m0) = 16384;
 dm(i1, m0) = -31840;
 dm(i1, m0) = 31556;
 dm(i1, m0) = -15923;
#endif

#ifdef WRD16_FLAG
 i1 = ^hpf_filt_coeff; // HPF-300, Cheby2(10, 33dB, 260Hz/4000Hz, 'high')
 dm(i1, m0) = 12100;
 dm(i1, m0) = -24188;
 dm(i1, m0) = 12100;
 dm(i1, m0) = 29808;
 dm(i1, m0) = -13575;
 dm(i1, m0) = 16384;
 dm(i1, m0) = -32626;
 dm(i1, m0) = 16384;
 dm(i1, m0) = 29950;
 dm(i1, m0) = -13833;
 dm(i1, m0) = 16384;
 dm(i1, m0) = -32426;
 dm(i1, m0) = 16384;
 dm(i1, m0) = 30258;
 dm(i1, m0) = -14332;
 dm(i1, m0) = 16384;
 dm(i1, m0) = -32226;
 dm(i1, m0) = 16384;
 dm(i1, m0) = 30765;
 dm(i1, m0) = -15040;
 dm(i1, m0) = 16384;
 dm(i1, m0) = -32104;
 dm(i1, m0) = 16384;
 dm(i1, m0) = 31495;
 dm(i1, m0) = -15909;
#endif

#ifdef WRD16_FLAG
 i1 = ^sub_filt_coeff;
 dm(i1, m0) = 278;
 dm(i1, m0) = -151;
 dm(i1, m0) = 278;
 dm(i1, m0) = 20430;
 dm(i1, m0) = -6576;
 dm(i1, m0) = 16384;
 dm(i1, m0) = -28597;
 dm(i1, m0) = 16384;
 dm(i1, m0) = 25035;
 dm(i1, m0) = -10371;
 dm(i1, m0) = 16384;
 dm(i1, m0) = -30982;
 dm(i1, m0) = 16384;
 dm(i1, m0) = 28476;
 dm(i1, m0) = -13229;
 dm(i1, m0) = 16384;
 dm(i1, m0) = -31632;
 dm(i1, m0) = 16384;
 dm(i1, m0) = 30389;
 dm(i1, m0) = -14860;
 dm(i1, m0) = 16384;
 dm(i1, m0) = -31840;
 dm(i1, m0) = 16384;
 dm(i1, m0) = 31556;
 dm(i1, m0) = -15923;
#endif

 i1 = ^_dc_reject_coeff; // dc_exclude, 0dB at 4kHz
 dm(i1, m0) = 31000;
 dm(i1, m0) = -31000;
 dm(i1, m0) = 32743;

 i1 = ^hr; // demphasis
 dm(i1, m0) = 0xfff8;
 dm(i1, m0) = 0xfffd;
 dm(i1, m0) = 0x0003;
 dm(i1, m0) = 0x000a;
 dm(i1, m0) = 0x0010;
 dm(i1, m0) = 0x0019;
 dm(i1, m0) = 0x001e;
 dm(i1, m0) = 0x001e;
 dm(i1, m0) = 0x0019;
 dm(i1, m0) = 0x0014;
 dm(i1, m0) = 0x0001;
 dm(i1, m0) = 0xffdb;
 dm(i1, m0) = 0xff92;
 dm(i1, m0) = 0xff32;
 dm(i1, m0) = 0xfea2;
 dm(i1, m0) = 0xfdee;
 dm(i1, m0) = 0xfd23;
 dm(i1, m0) = 0xfc87;
 dm(i1, m0) = 0xfbfc;
 dm(i1, m0) = 0xfb88;
 dm(i1, m0) = 0xfb07;
 dm(i1, m0) = 0xfad2;
 dm(i1, m0) = 0xfa76;
 dm(i1, m0) = 0xfa1b;
 dm(i1, m0) = 0xf9d8;
 dm(i1, m0) = 0xfb53;
 dm(i1, m0) = 0xfddb;
 dm(i1, m0) = 0x01a9;
 dm(i1, m0) = 0x055f;
 dm(i1, m0) = 0x0e3a;
 dm(i1, m0) = 0x1913;
 dm(i1, m0) = 0x321e;
 dm(i1, m0) = 0x681f;

 i1 = ^hd;
 dm(i1, m0) = -1041;
 dm(i1, m0) = 2892;
 dm(i1, m0) = -26025;
 dm(i1, m0) = 26025;
 dm(i1, m0) = -2892;
 dm(i1, m0) = 1041;

 call _init_DTMF_Decoder; // Reset DTMF Coder
 i0 = ^TWD_FACT_128;
 i0 = ^TWD_FACT_128;

 call _init_finv_scrambler; // Reset Scrambler
 i1 = ^angle_table_32;
 i1 = ^angle_table_32;

 call _init_Sel_Call_Decoder; // Reset Selective Calls
 i1 = ^freq_esti;
 i1 = ^freq_esti;

 call _init_CTCSS_Decoder; // Reset CTCSS Coder
 i0 = ^F_L; // lower bound
 i0 = ^F_L; // lower bound

 call _init_DCS_Decoder; // Reset DCS Coder
 i0 = ^Wctrl;
 i0 = ^Wctrl;

 imask = 3; // ena cidec intrps

IDLE_LOOP: idle; {round-robin, process resources was not released until expires}
 ar = dm(audio_event_trigger);
 af = pass ar;
 if ne call FarEnd_Speech_Process; {FarEnd Process}
 //if ne call NearEnd_Speech_Process;
 ar = dm(audio_event_trigger);
 af = pass ar;

 //call _spi_cmd_check; // check SPI CLI CMDS
 //m0 = 1;
 //m0 = 1;

_Check_IRQ_Request: ar = dm(SPIRQ_RS_FLAG); // Issue External IRQs
 af = pass ar;
 if eq jump IDLE_LOOP; // 8ms polling
 dm(SPIRQ_RS_FLAG) = ar; // dummy
 ar = ar - 1;
 dm(SPIRQ_RS_FLAG) = ar; // one per time
 i1 = dm(SPIRQ_READ_PTR);
 m0 = 1;
 ax0 = dm(i1, m0);
 dm(spicout) = ax0; {SPI Tx Register}
 ar = i1;
 ay0 = ^SPIRQ_Buffer;
 af = ar - 0x0027;
 jump IDLE_LOOP;
 if ge ar = pass ay0;
 dm(SPIRQ_READ_PTR) = ar;

_main.end: rts;

$_spi_cmd_check: m0 = 1;
 m1 = 0;
 ay0 = dm(spicin_read_ptr);
 ar = dm(spicin_write_ptr);
 af = ar - ay0;
 if eq jump _spi_cmd_check.end;
 af = ar - ay0;
 i2 = dm(spicin_read_ptr);
 l2 = 16;
 ay0 = dm(i2, m1); // input cmmand
 af = 0x0080 and ay0;
 if eq jump check_cmd_proc; // single cmmand
 ay1 = dm(spicin_read_ptr);
 af = ar - ay1; // ar = write
 if gt jump proc_cmd;
 af = ar - ay1; // af = write - read, dummy
 af = ar - ay1; // af = write - read, dummy
 af = 0x0010 + af; // wrap around, spicin_write_ptr

proc_cmd: ar = pass af;
 af = 0x007f and ay0; // desired length
 ar = ar - 1;
 af = ar - af;
 if lt jump _spi_cmd_check.end;
 ax0 = 0xff00;
 af = ax0 and ay0;

check_cmd_proc: // insert cmmand
 ax1 = 0x0000;
 ar = ax1 - af;
 if eq jump Proc_G0C0;
 ax1 = 0x1000;
 ar = ax1 - af;
 if eq jump Proc_G1C0; // reset CTCSS Decoder
 ax1 = 0x1100;
 ar = ax1 - af;
 if eq jump Proc_G1C1; // reset Sel Calls Decoder

Proc_Default:
 jump update_read_ptr;
 i2 = dm(spicin_read_ptr);
 i2 = dm(spicin_read_ptr);

Proc_G0C0:
 jump update_read_ptr;
 i2 = dm(spicin_read_ptr);
 i2 = dm(spicin_read_ptr);

Proc_G1C0: call _init_CTCSS_Decoder;
 m0 = 1;
 m0 = 1;
 jump update_read_ptr;
 i2 = dm(spicin_read_ptr);
 i2 = dm(spicin_read_ptr);

Proc_G1C1:
 call _init_Sel_Call_Decoder;
 m0 = 1;
 m0 = 1;
 jump update_read_ptr;
 i2 = dm(spicin_read_ptr);
 i2 = dm(spicin_read_ptr); 

update_read_ptr: i2 = dm(spicin_read_ptr);
 l2 = 16;
 ay0 = dm(i2, m0); // i2+=1
 af = 0x0080 and ay0;
 if eq jump update_next_ptr;
 ar = 0x007f and ay0; // check cmmand length
 ar = 0x007f and ay0; // check cmmand length
 m2 = ar;
 modify(i2, m2);

update_next_ptr: dm(spicin_read_ptr) = i2;

_spi_cmd_check.end: rts;
 l2 = 0;
 l2 = 0;

_user_codes: ax0 = 0x24c0;
 dm(CR13) = ax0;

_user_codes_loop: af = pass ay0;
 if ne jump _user_codes_loop;
 ax0 = 0x04c0;
 ay0 = dm(TIMER);
 dm(CR13) = ax0;
 ay0 = 0x0190; // 100ms
 dm(TIMER) = ay0;

_user_codes_lsp: af = pass ay0;
 if ne jump _user_codes_lsp;
 ax0 = 0x043f;
 ay0 = dm(TIMER);
 rts;
 ax0 = 0x043f;
 dm(CR13) = ax0;

// 10 poles Direct Form I
$IIR: mx0 = dm(i0, m0); {x[n-1], 0:1, order = 6}
 my0 = dm(i1, m0); {0:1}
 mr = sr0 * my0(ss), my1 = dm(i1, m0); {1:2}
 mr = mr + mx0 * my1(ss), my0 = dm(i1, m0); {2:3}
 mx1 = dm(i0, m2); {x[n-2], 1:0}
 mr = mr + mx1 * my0(ss), my1 = dm(i1, m0); {3:4}
 dm(i0, m0) = sr0;
 dm(i0, m0) = mx0;

 mx0 = dm(i0, m0); {2:3}
 mr = mr + mx0 * my1(ss), my0 = dm(i1, m0); {4:5}
 mx1 = dm(i0, m2); {3:2}
 mr = mr + mx1 * my0(ss), my1 = dm(i1, m0); {5:6}
 if mv sat mr;

 sr = lshift mr0(lo); // sat_32_16
 sr = sr or ashift mr1(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = mr0;
 af = sr1 - sr0, ay1 = sr1;
 if ne ar = ax1 xor ay1;

 dm(i0, m0) = ar;
 dm(i0, m0) = mx0;

 mr = ar * my1(ss), my0 = dm(i1, m0); {6:7}
 mr = mr + mx0 * my0(ss), my1 = dm(i1, m0);
 mr = mr + mx1 * my1(ss), my0 = dm(i1, m0);

 mx0 = dm(i0, m0);
 mr = mr + mx0 * my0(ss), my1 = dm(i1, m0);
 mx1 = dm(i0, m2); {m2 = -1}
 mr = mr + mx1 * my1(ss);
 if mv sat mr;
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi), my0 = dm(i1, m0);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = mr0; // modified
 af = sr1 - sr0, ay1 = sr1;
 if ne ar = ax1 xor ay1;

 mr = ar * my0(ss), dm(i0, m0) = ar;
 my1 = dm(i1, m0);
 mr = mr + mx0 * my1(ss), dm(i0, m0) = mx0;
 my0 = dm(i1, m0);
 mr = mr + mx1 * my0(ss), mx0 = dm(i0, m0);
 my1 = dm(i1, m0);
 mr = mr + mx0 * my1(ss), mx1 = dm(i0, m2);
 my0 = dm(i1, m0);
 mr = mr + mx1 * my0(ss);
 if mv sat mr;
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = mr0;
 af = sr1 - sr0, ay1 = sr1;
 if ne ar = ax1 xor ay1;
IIR.end: rts;
 dm(i0, m0) = ar;
 dm(i0, m0) = mx0;

NearEnd_Speech_Process:
 //call _DC_Reject;
 //i0 = dm(audio_start_address);
 //i0 = dm(audio_start_address);

 //call _Compressor;
 //i0 = dm(audio_start_address);
 //i0 = dm(audio_start_address);

 //call _Emphasis;
 //i0 = dm(audio_start_address);
 //i0 = dm(audio_start_address);

 call _finv_scrambler; // Prefer Preprocessing with Narrow Band Filtering
 i0 = dm(audio_start_address);
 i0 = dm(audio_start_address);

 //call _HPF_Audio_Filt;
 //i5 = dm(audio_start_address);
 //i5 = dm(audio_start_address);

 call _MEM_COPY; // Copy Data to DAC Output Buffers
 i0 = dm(audio_start_address);
 i0 = dm(audio_start_address);

NearEnd_Speech_Process.end: rts;
 ax0 = 0; // disable token
 dm(audio_event_trigger) = ax0;

FarEnd_Speech_Process:
 //call _DC_Reject;
 //i0 = dm(audio_start_address);
 //i0 = dm(audio_start_address);

 call _Sub_Audio_Filt;
 i5 = dm(audio_start_address);
 i5 = dm(audio_start_address);
 i1 = ^In_buffer; // For CTCSS Static Buffering
 i2 = ^In_buffer + 16;
 m2 = 1;
 cntr = 112;
 do squelch_memmove until ce;
 ax0 = dm(i2, m2);
 squelch_memmove: dm(i1, m2) = ax0;

 i3 = ^Squelch_Buffer;
 cntr = 16;
 do squelch_cpy until ce;
 ax0 = dm(i3, m2);
 squelch_cpy: dm(i1, m2) = ax0;

 //call _DCS_Decoder; // 134.4Hz +- 0.4Hz
 //i0 = ^rfft_out; // 64 samples of DCS Codes
 //i0 = ^rfft_out;

 ar = dm(squelch_cntr);
 ar = ar + 1;
 af = 0x0003 and ar;
 ay0 = ar, ar = pass af;

 ax0 = dm(squelch_event_trigger);
 dm(i4, m4) = ay0; // push squelch_cntr
 ax1 = ar, ar = pass 0;
 af = 0x0001 - ay0;
 if eq ar = pass 1;
 af = ax0 and ar;
 if ne call _CTCSS_Decoder_I; // Remainding Process
 af = ax0 and ar;
 dm(squelch_cntr) = ax1;

 m5 = -1;
 ax0 = dm(squelch_event_trigger);
 ar = pass 0, modify(i4, m5);
 ay0 = dm(i4, m4);
 af = 0x0002 - ay0;
 if eq ar = pass 1;
 af = ax0 and ar;
 if ne call _CTCSS_Decoder_II;
 af = ax0 and ar;
 af = ax0 and ar;

 call _HPF_Audio_Filt;
 i5 = dm(audio_start_address);
 i5 = dm(audio_start_address);
 call _DTMF_Decoder;
 i0 = dm(audio_start_address);
 i0 = dm(audio_start_address);
 //call _Sel_Call_Decoder;
 //i0 = dm(audio_start_address);
 //i0 = dm(audio_start_address);

 m5 = -1;
 modify(i4, m5);
 m5 = 0; // pop squelch_cntr, if no dedicate register, reg. contents must re-assigned
 ay0 = dm(i4, m5);
 af = 0x0004 - ay0;
 if eq call _CTCSS_Decoder; // Complete In_buffer Access
 nop; // dummy
 nop; // dummy
 //if eq call _DCS_Turn_Off_Detector;
 //i0 = ^In_buffer;
 //i0 = ^In_buffer;

 //call _finv_scrambler;
 //i0 = dm(audio_start_address);
 //i0 = dm(audio_start_address);
 call _Demphasis;
 i0 = dm(audio_start_address);
 i0 = dm(audio_start_address);
 //call _Expander;
 //i0 = dm(audio_start_address);
 //i0 = dm(audio_start_address);
 call _MEM_COPY; // Copy Data to DAC Output Buffers
 i0 = dm(audio_start_address);
 i0 = dm(audio_start_address);

FarEnd_Speech_Process.end: rts;
 ax0 = 0;
 dm(audio_event_trigger) = ax0; // clear triggered event

$_MEM_COPY: i2 = dm(output_write_ptr); // Copy Data to DAC Output Buffers
 l2 = %output_buffer;
 m0 = 1;

 cntr = 64;
 do cpy_to_mem until ce;
 ax0 = dm(i0, m0);
 cpy_to_mem: dm(i2, m0) = ax0;

 dm(output_write_ptr) = i2;
_MEM_COPY.end: rts;
 dm(output_write_ptr) = i2;
 l2 = 0;

$_Demphasis: m1 = 0;
 m2 = 1;
 m3 = -1;

 dis m_mode;
 ay1 = 32767;
 cntr = 64;
 do dempha_loop until ce;

 i2 = ^hrd; // memmove
 i3 = ^hrd + 1;
 cntr = 64;
 do dempha_memmove until ce;
 ax0 = dm(i3, m2);
 dempha_memmove: dm(i2, m2) = ax0;

 ax0 = dm(i0, m1);
 mr = 0, dm(i2, m1) = ax0;
 i1 = ^hr; // &coeffs[0]
 i2 = ^hrd; // &x[n-L+1]
 mx0 = dm(i2, m2); // i2 = 1
 my0 = dm(i1, m2); // i1 = 1

 cntr = 33;
 do demp_filt until ce;
 mr = mr + mx0 * my0(ss), mx0 = dm(i2, m2);
 demp_filt: my0 = dm(i1, m2);

 i1 = ^hr + 31;
 my0 = dm(i1, m3);
 cntr = 32;
 do demp_filt_loop until ce;
 mr = mr + mx0 * my0(ss), mx0 = dm(i2, m2);
 demp_filt_loop: my0 = dm(i1, m3);
 mr = mr(rnd);
 if mv sat mr;
 //dm(GPR13) = mr1;
 dempha_loop: dm(i0, m2) = mr1;

_Demphasis.end: rts;
 ena m_mode;
 ena m_mode;

#ifdef WRD32_FLAG
$_Sub_Audio_Filt:
 m0 = 1;
 m1 = 0;
 m2 = -1;
 m3 = 2;

 se = -14;
 ena m_mode;
 i3 = ^Squelch_Buffer;

 cntr = 64;
 do sub_filt until ce;
 i1 = ^sub_filt_coeff;
 i2 = ^sub_filt_taps;
 m5 = 0;
 sr0 = dm(i0, m0); // x[n]
 my0 = dm(i1, m0);
 mr = sr0 * my0(ss), my1 = dm(i1, m0);
 mx1 = dm(i2, m0);
 mr = mr + mx1 * my1(ss), my0 = dm(i1, m0);
 mx0 = dm(i2, m1);
 mr = mr + mx0 * my0(ss), dm(i2, m2) = mx1;
 dm(i2, m3) = sr0;
 ax0 = mr0;
 ax1 = mr1;

 cntr = 4;
 do inner_filt until ce;
 mx0 = dm(i2, m0);
 my1 = dm(i1, m0);
 mr = mx0 * my1(us), mx1 = dm(i2, m0);
 si = mr0; // lower 16 bits
 mr0 = mr1;
 mr1 = mr2;
 mr = mr + mx1 * my1(ss), mx0 = dm(i2, m0); // mr0 = middle 16 bits
 sr = lshift si(lo), mx1 = dm(i2, m2); // mr1 = high 16 bits
 sr = sr or lshift mr0(hi), my0 = dm(i1, m0);
 ay0 = sr0;
 sr0 = sr1;
 sr1 = 0;
 sr = sr or ashift mr1(hi); // [sr0, ay0]
 ar = ax0 + ay0, ay1 = sr0;
 af = ax1 + ay1 + c, ay0 = ar;
 ar = pass af;

 mr = mx0 * my0(us), ay1 = ar;
 si = mr0;
 mr0 = mr1;
 mr1 = mr2;
 mr = mr + mx1 * my0(ss), my1 = dm(i1, m0);
 sr = lshift si(lo);
 sr = sr or lshift mr0(hi);
 ax0 = sr0;
 sr0 = sr1;
 sr1 = 0;
 sr = sr or ashift mr1(hi);
 ar = ax0 + ay0;
 af = sr0 + ay1 + c, ay0 = ar;
 ar = pass af, mx0 = ay0;

 mr = mx0 * my1(us), ay1 = ar; // Temp
 dm(i4, m4) = ay0;
 dm(i4, m5) = ay1; // save Temp
 si = mr0;
 mr0 = mr1;
 mr1 = mr2;
 mr = mr + ar * my1(ss), my0 = dm(i1, m0);
 sr = lshift si(lo), mx0 = dm(i2, m0); // Tap[1].L
 sr = sr or lshift mr0(hi), mx1 = dm(i2, m2); // Tap[1].H
 ax0 = sr0;
 sr0 = sr1;
 sr1 = 0;
 sr = sr or ashift mr1(hi); // [sr0, ax0]

 mr = mx0 * my0(us), ax1 = sr0;
 si = mr0;
 mr0 = mr1;
 mr1 = mr2;
 mr = mr + mx1 * my0(ss), my1 = dm(i1, m0);
 modify(i2, m2);
 sr = lshift si(lo), mx1 = dm(i2, m2);
 i5 = i2; // &Tap[0]
 sr = sr or lshift mr0(hi), mx0 = dm(i2, m3);
 ay0 = sr0;
 sr0 = sr1;
 sr1 = 0;
 sr = sr or ashift mr1(hi); // [sr0, ay0]
 ar = ax0 + ay0, ay1 = sr0;
 af = ax1 + ay1 + c, ay0 = ar;
 ar = pass af, dm(i2, m0) = mx0;

 mr = mx0 * my1(us), ay1 = ar;
 si = mr0;
 mr0 = mr1;
 mr1 = mr2;
 mr = mr + mx1 * my1(ss);
 sr = lshift si(lo), dm(i2, m0) = mx1;
 sr = sr or lshift mr0(hi);
 ax0 = sr0;
 sr0 = sr1;
 sr1 = 0;
 sr = sr or ashift mr1(hi); // [sr0, ax0]

 ar = ax0 + ay0;
 af = sr0 + ay1 + c, ax0 = ar;
 ar = pass af;
 ax1 = ar;
 m5 = -1;
 ay1 = dm(i4, m5);
 m5 = 0;
 ay0 = dm(i4, m5);
 dm(i5, m4) = ay0;
 inner_filt: dm(i5, m4) = ay1;

 i5 = i2;
 mx0 = dm(i2, m0);
 my0 = dm(i1, m0);
 mr = mx0 * my0(us), mx1 = dm(i2, m0);
 dm(i4, m4) = mx0;
 dm(i4, m5) = mx1; // save 

 si = mr0; // lower 16 bits
 mr0 = mr1;
 mr1 = mr2;
 mr = mr + mx1 * my0(ss), mx0 = dm(i2, m0); // mr0 = middle 16 bits
 sr = lshift si(lo), mx1 = dm(i2, m2); // mr1 = high 16 bits
 sr = sr or lshift mr0(hi), my1 = dm(i1, m0);
 ay0 = sr0;
 sr0 = sr1;
 sr1 = 0;
 sr = sr or ashift mr1(hi); // [sr0, ay0]
 ar = ax0 + ay0, ay1 = sr0;
 af = ax1 + ay1 + c, ay0 = ar;
 ar = pass af;

 mr = mx0 * my1(us), ay1 = ar;
 si = mr0;
 mr0 = mr1;
 mr1 = mr2;
 mr = mr + mx1 * my1(ss), my1 = dm(i1, m0);
 sr = lshift si(lo);
 sr = sr or lshift mr0(hi);
 ax0 = sr0;
 sr0 = sr1;
 sr1 = 0;
 sr = sr or ashift mr1(hi);
 m5 = -1;
 ar = ax0 + ay0, ax1 = dm(i4, m5);
 af = sr0 + ay1 + c, ay0 = ar;
 ar = pass af, si = ay0;
 m5 = 0;
 ax0 = dm(i4, m5);
 sr = lshift si(lo), dm(i2, m0) = ax0;
 sr = sr or ashift ar(hi), dm(i2, m0) = ax1;
 //dm(GPR15) = sr0;
 ay1 = cntr;
 af = 0x0003 and ay1;
 if ne jump sub_filt;
 af = 0x0003 and ay1;
 dm(i5, m4) = ay0;
 dm(i3, m0) = sr0;
 sub_filt: dm(i5, m4) = ar;

_Sub_Audio_Filt.end: rts;
#endif

#ifdef WRD16_FLAG
_Sub_Audio_Filt:
 m0 = 1;
 m1 = 0;
 m2 = -1;
 m3 = 2;
 se = -14;
 ena m_mode;
 i2 = ^rfft_out; // temp buffering
 i3 = ^Squelch_Buffer;
 ax1 = 32767;

 cntr = 64;
 do sub_filt_loop until ce;
 i0 = ^sub_filt_taps;
 i1 = ^sub_filt_coeff;
 sr0 = dm(i5, m4);
 mx0 = dm(i0, m0); //{x[n-1], 0:1, order = 6}
 my0 = dm(i1, m0); //{0:1}
 mr = sr0 * my0(ss), my1 = dm(i1, m0); //{1:2}
 mr = mr + mx0 * my1(ss), my0 = dm(i1, m0); //{2:3}
 mx1 = dm(i0, m2); //{x[n-2], 1:0}
 mr = mr + mx1 * my0(ss), my1 = dm(i1, m0); //{3:4}
 dm(i0, m0) = sr0;
 dm(i0, m0) = mx0;

 mx0 = dm(i0, m0); //{2:3}
 mr = mr + mx0 * my1(ss), my0 = dm(i1, m0); //{4:5}
 mx1 = dm(i0, m2); //{3:2}
 mr = mr + mx1 * my0(ss), my1 = dm(i1, m0); //{5:6}
 if mv sat mr;

 sr = lshift mr0(lo); // sat_32_16
 sr = sr or ashift mr1(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = mr0;
 //ay0 = sr0;
 af = sr1 - sr0, ay1 = sr1;
 //af = sr1 - ay0, ay1 = sr1;
 if ne ar = ax1 xor ay1;

 dm(i0, m0) = ar;
 dm(i0, m0) = mx0;
/////
 mr = ar * my1(ss), my0 = dm(i1, m0); //{6:7}
 mr = mr + mx0 * my0(ss), my1 = dm(i1, m0);
 mr = mr + mx1 * my1(ss), my0 = dm(i1, m0);

 mx0 = dm(i0, m0);
 mr = mr + mx0 * my0(ss), my1 = dm(i1, m0);
 mx1 = dm(i0, m2); //{m2 = -1}
 mr = mr + mx1 * my1(ss);
 if mv sat mr;
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi), my0 = dm(i1, m0);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = mr0; // modified
 //ay0 = sr0;
 //af = sr1 - ay0, ay1 = sr1;
 af = sr1 - sr0, ay1 = sr1;
 if ne ar = ax1 xor ay1;
/////
 mr = ar * my0(ss), dm(i0, m0) = ar;
 my1 = dm(i1, m0);
 mr = mr + mx0 * my1(ss), dm(i0, m0) = mx0;
 my0 = dm(i1, m0);
 mr = mr + mx1 * my0(ss), mx0 = dm(i0, m0);
 my1 = dm(i1, m0);
 mr = mr + mx0 * my1(ss), mx1 = dm(i0, m2);
 my0 = dm(i1, m0);
 mr = mr + mx1 * my0(ss);
 if mv sat mr;
 sr = lshift mr0(lo), my0 = dm(i1, m0);
 sr = sr or ashift mr1(hi), my1 = dm(i1, m0);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = mr0;
 //ay0 = sr0;
 //af = sr1 - ay0, ay1 = sr1;
 af = sr1 - sr0, ay1 = sr1;
 if ne ar = ax1 xor ay1;
/////
 mr = ar * my0(ss), dm(i0, m0) = ar;
 //my1 = dm(i1, m0);
 mr = mr + mx0 * my1(ss), dm(i0, m0) = mx0;
 my0 = dm(i1, m0);
 mr = mr + mx1 * my0(ss), mx0 = dm(i0, m0);
 my1 = dm(i1, m0);
 mr = mr + mx0 * my1(ss), mx1 = dm(i0, m2);
 my0 = dm(i1, m0);
 mr = mr + mx1 * my0(ss);
 if mv sat mr;
 sr = lshift mr0(lo), my0 = dm(i1, m0);
 sr = sr or ashift mr1(hi), my1 = dm(i1, m0);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = mr0;
 //ay0 = sr0;
 //af = sr1 - ay0, ay1 = sr1;
 af = sr1 - sr0, ay1 = sr1;
 if ne ar = ax1 xor ay1;
/////
 mr = ar * my0(ss), dm(i0, m0) = ar;
 //my1 = dm(i1, m0);
 mr = mr + mx0 * my1(ss), dm(i0, m0) = mx0;
 my0 = dm(i1, m0);
 mr = mr + mx1 * my0(ss), mx0 = dm(i0, m0);
 my1 = dm(i1, m0);
 mr = mr + mx0 * my1(ss), mx1 = dm(i0, m2);
 my0 = dm(i1, m0);
 mr = mr + mx1 * my0(ss);
 if mv sat mr;
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = mr0;
 //ay0 = sr0;
 //af = sr1 - ay0, ay1 = sr1;
 af = sr1 - sr0, ay1 = sr1;
 if ne ar = ax1 xor ay1;
 ay1 = cntr;
 af = 0x0003 and ay1;
 dm(GPR13) = ar;
 if ne jump sub_filt_loop;
 dm(i0, m0) = ar;
 dm(i2, m0) = ar; // For DCS Decoder
 dm(i3, m0) = ar; // Squelch_Buffer
 //dm(GPR13) = ar;
 sub_filt_loop: dm(i0, m0) = mx0;

_Sub_Audio_Filt.end: rts;
#endif

#ifdef WRD32_FLAG
$_HPF_Audio_Filt:
 m0 = 1;
 m1 = 0;
 m2 = -1;
 m3 = 2;

 se = -14;
 ena m_mode;

 cntr = 64;
 do hpf_filt until ce;
 i1 = ^hpf_filt_coeff;
 i2 = ^hpf_filt_taps;
 m5 = 0;
 sr0 = dm(i0, m1); // x[n]
 my0 = dm(i1, m0);
 mr = sr0 * my0(ss), my1 = dm(i1, m0);
 mx1 = dm(i2, m0);
 mr = mr + mx1 * my1(ss), my0 = dm(i1, m0);
 mx0 = dm(i2, m1);
 mr = mr + mx0 * my0(ss), dm(i2, m2) = mx1;
 dm(i2, m3) = sr0;
 ax0 = mr0;
 ax1 = mr1;

 cntr = 4;
 do hpf_inner_filt until ce;
 mx0 = dm(i2, m0);
 my1 = dm(i1, m0);
 mr = mx0 * my1(us), mx1 = dm(i2, m0);
 si = mr0; // lower 16 bits
 mr0 = mr1;
 mr1 = mr2;
 mr = mr + mx1 * my1(ss), mx0 = dm(i2, m0); // mr0 = middle 16 bits
 sr = lshift si(lo), mx1 = dm(i2, m2); // mr1 = high 16 bits
 sr = sr or lshift mr0(hi), my0 = dm(i1, m0);
 ay0 = sr0;
 sr0 = sr1;
 sr1 = 0;
 sr = sr or ashift mr1(hi); // [sr0, ay0]
 ar = ax0 + ay0, ay1 = sr0;
 af = ax1 + ay1 + c, ay0 = ar;
 ar = pass af;

 mr = mx0 * my0(us), ay1 = ar;
 si = mr0;
 mr0 = mr1;
 mr1 = mr2;
 mr = mr + mx1 * my0(ss), my1 = dm(i1, m0);
 sr = lshift si(lo);
 sr = sr or lshift mr0(hi);
 ax0 = sr0;
 sr0 = sr1;
 sr1 = 0;
 sr = sr or ashift mr1(hi);
 ar = ax0 + ay0;
 af = sr0 + ay1 + c, ay0 = ar;
 ar = pass af, mx0 = ay0;

 mr = mx0 * my1(us), ay1 = ar; // Temp
 dm(i4, m4) = ay0;
 dm(i4, m5) = ay1; // save Temp
 si = mr0;
 mr0 = mr1;
 mr1 = mr2;
 mr = mr + ar * my1(ss), my0 = dm(i1, m0);
 sr = lshift si(lo), mx0 = dm(i2, m0); // Tap[1].L
 sr = sr or lshift mr0(hi), mx1 = dm(i2, m2); // Tap[1].H
 ax0 = sr0;
 sr0 = sr1;
 sr1 = 0;
 sr = sr or ashift mr1(hi); // [sr0, ax0]

 mr = mx0 * my0(us), ax1 = sr0;
 si = mr0;
 mr0 = mr1;
 mr1 = mr2;
 mr = mr + mx1 * my0(ss), my1 = dm(i1, m0);
 modify(i2, m2);
 sr = lshift si(lo), mx1 = dm(i2, m2);
 i5 = i2; // &Tap[0]
 sr = sr or lshift mr0(hi), mx0 = dm(i2, m3);
 ay0 = sr0;
 sr0 = sr1;
 sr1 = 0;
 sr = sr or ashift mr1(hi); // [sr0, ay0]

 ar = ax0 + ay0, ay1 = sr0;
 af = ax1 + ay1 + c, ay0 = ar;
 ar = pass af, dm(i2, m0) = mx0;

 mr = mx0 * my1(us), ay1 = ar;
 si = mr0;
 mr0 = mr1;
 mr1 = mr2;
 mr = mr + mx1 * my1(ss);
 sr = lshift si(lo), dm(i2, m0) = mx1;
 sr = sr or lshift mr0(hi);
 ax0 = sr0;
 sr0 = sr1;
 sr1 = 0;
 sr = sr or ashift mr1(hi); // [sr0, ax0]

 ar = ax0 + ay0;
 af = sr0 + ay1 + c, ax0 = ar;
 ar = pass af;
 ax1 = ar;
 m5 = -1;
 ay1 = dm(i4, m5);
 m5 = 0;
 ay0 = dm(i4, m5);
 dm(i5, m4) = ay0;
 hpf_inner_filt: dm(i5, m4) = ay1;

 i5 = i2;
 mx0 = dm(i2, m0);
 my0 = dm(i1, m0);
 mr = mx0 * my0(us), mx1 = dm(i2, m0);
 dm(i4, m4) = mx0;
 dm(i4, m5) = mx1; // save

 si = mr0; // lower 16 bits
 mr0 = mr1;
 mr1 = mr2;
 mr = mr + mx1 * my0(ss), mx0 = dm(i2, m0); // mr0 = middle 16 bits
 sr = lshift si(lo), mx1 = dm(i2, m2); // mr1 = high 16 bits
 sr = sr or lshift mr0(hi), my1 = dm(i1, m0);
 ay0 = sr0;
 sr0 = sr1;
 sr1 = 0;
 sr = sr or ashift mr1(hi); // [sr0, ay0]
 ar = ax0 + ay0, ay1 = sr0;
 af = ax1 + ay1 + c, ay0 = ar;
 ar = pass af;

 mr = mx0 * my1(us), ay1 = ar;
 si = mr0;
 mr0 = mr1;
 mr1 = mr2;
 mr = mr + mx1 * my1(ss), my1 = dm(i1, m0);
 sr = lshift si(lo);
 sr = sr or lshift mr0(hi);
 ax0 = sr0;
 sr0 = sr1;
 sr1 = 0;
 sr = sr or ashift mr1(hi);
 m5 = -1;
 ar = ax0 + ay0, ax1 = dm(i4, m5);
 af = sr0 + ay1 + c, ay0 = ar;
 ar = pass af, si = ay0;
 m5 = 0;
 ax0 = dm(i4, m5);
 sr = lshift si(lo), dm(i2, m0) = ax0;
 sr = sr or ashift ar(hi), dm(i2, m0) = ax1;
 dm(i0, m0) = sr0;
 //dm(GPR13) = sr0;
 dm(i5, m4) = ay0;
 hpf_filt: dm(i5, m4) = ar;

_HPF_Audio_Filt.end: rts;
#endif

#ifdef WRD16_FLAG
$_HPF_Audio_Filt:
 m0 = 1;
 m1 = 0;
 m2 = -1;
 m3 = 2;
 m5 = 0;
 se = -14;
 ena m_mode;
 ax1 = 32767;

 cntr = 64;
 do hpf_filt_loop until ce;
 i0 = ^hpf_filt_taps;
 i1 = ^hpf_filt_coeff;
 sr0 = dm(i5, m5);
 mx0 = dm(i0, m0); //{x[n-1], 0:1, order = 6}
 my0 = dm(i1, m0); //{0:1}
 mr = sr0 * my0(ss), my1 = dm(i1, m0); //{1:2}
 mr = mr + mx0 * my1(ss), my0 = dm(i1, m0); //{2:3}
 mx1 = dm(i0, m2); //{x[n-2], 1:0}
 mr = mr + mx1 * my0(ss), my1 = dm(i1, m0); //{3:4}
 dm(i0, m0) = sr0;
 dm(i0, m0) = mx0;

 mx0 = dm(i0, m0); //{2:3}
 mr = mr + mx0 * my1(ss), my0 = dm(i1, m0); //{4:5}
 mx1 = dm(i0, m2); //{3:2}
 mr = mr + mx1 * my0(ss), my1 = dm(i1, m0); //{5:6}
 if mv sat mr;

 sr = lshift mr0(lo); // sat_32_16
 sr = sr or ashift mr1(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = mr0;
 //ay0 = sr0;
 af = sr1 - sr0, ay1 = sr1;
 //af = sr1 - ay0, ay1 = sr1;
 if ne ar = ax1 xor ay1;

 dm(i0, m0) = ar;
 dm(i0, m0) = mx0;
/////
 mr = ar * my1(ss), my0 = dm(i1, m0); //{6:7}
 mr = mr + mx0 * my0(ss), my1 = dm(i1, m0);
 mr = mr + mx1 * my1(ss), my0 = dm(i1, m0);

 mx0 = dm(i0, m0);
 mr = mr + mx0 * my0(ss), my1 = dm(i1, m0);
 mx1 = dm(i0, m2); //{m2 = -1}
 mr = mr + mx1 * my1(ss);
 if mv sat mr;
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi), my0 = dm(i1, m0);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = mr0; // modified
 //ay0 = sr0;
 //af = sr1 - ay0, ay1 = sr1;
 af = sr1 - sr0, ay1 = sr1;
 if ne ar = ax1 xor ay1;
/////
 mr = ar * my0(ss), dm(i0, m0) = ar;
 my1 = dm(i1, m0);
 mr = mr + mx0 * my1(ss), dm(i0, m0) = mx0;
 my0 = dm(i1, m0);
 mr = mr + mx1 * my0(ss), mx0 = dm(i0, m0);
 my1 = dm(i1, m0);
 mr = mr + mx0 * my1(ss), mx1 = dm(i0, m2);
 my0 = dm(i1, m0);
 mr = mr + mx1 * my0(ss);
 if mv sat mr;
 sr = lshift mr0(lo), my0 = dm(i1, m0);
 sr = sr or ashift mr1(hi), my1 = dm(i1, m0);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = mr0;
 //ay0 = sr0;
 //af = sr1 - ay0, ay1 = sr1;
 af = sr1 - sr0, ay1 = sr1;
 if ne ar = ax1 xor ay1;
/////
 mr = ar * my0(ss), dm(i0, m0) = ar;
 //my1 = dm(i1, m0);
 mr = mr + mx0 * my1(ss), dm(i0, m0) = mx0;
 my0 = dm(i1, m0);
 mr = mr + mx1 * my0(ss), mx0 = dm(i0, m0);
 my1 = dm(i1, m0);
 mr = mr + mx0 * my1(ss), mx1 = dm(i0, m2);
 my0 = dm(i1, m0);
 mr = mr + mx1 * my0(ss);
 if mv sat mr;
 sr = lshift mr0(lo), my0 = dm(i1, m0);
 sr = sr or ashift mr1(hi), my1 = dm(i1, m0);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = mr0;
 //ay0 = sr0;
 //af = sr1 - ay0, ay1 = sr1;
 af = sr1 - sr0, ay1 = sr1;
 if ne ar = ax1 xor ay1;
///// 
 mr = ar * my0(ss), dm(i0, m0) = ar;
 //my1 = dm(i1, m0);
 mr = mr + mx0 * my1(ss), dm(i0, m0) = mx0;
 my0 = dm(i1, m0);
 mr = mr + mx1 * my0(ss), mx0 = dm(i0, m0);
 my1 = dm(i1, m0);
 mr = mr + mx0 * my1(ss), mx1 = dm(i0, m2);
 my0 = dm(i1, m0);
 mr = mr + mx1 * my0(ss);
 if mv sat mr;
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = mr0;
 //ay0 = sr0;
 //af = sr1 - ay0, ay1 = sr1;
 af = sr1 - sr0, ay1 = sr1;
 if ne ar = ax1 xor ay1;
 dm(i0, m0) = ar;
 dm(i5, m4) = ar; // Squelch_Buffer
 hpf_filt_loop: dm(i0, m0) = mx0;

_HPF_Audio_Filt.end: rts;
#endif

$_init_finv_scrambler:
 m0 = 1;

 i1 = ^cos_table;
 dm(i1, m0) = 0x7fff;
 dm(i1, m0) = 0x7d89;
 dm(i1, m0) = 0x7640;
 dm(i1, m0) = 0x6a6c;
 dm(i1, m0) = 0x5a81;
 dm(i1, m0) = 0x471c;
 dm(i1, m0) = 0x30fb;
 dm(i1, m0) = 0x18f8;
 dm(i1, m0) = 0x0000;
 dm(i1, m0) = 0xe708;
 dm(i1, m0) = 0xcf05;
 dm(i1, m0) = 0xb8e4;
 dm(i1, m0) = 0xa57f;
 dm(i1, m0) = 0x9594;
 dm(i1, m0) = 0x89c0;
 dm(i1, m0) = 0x8277;
 dm(i1, m0) = 0x8001;
 dm(i1, m0) = 0x8277;
 dm(i1, m0) = 0x89c0;
 dm(i1, m0) = 0x9594;
 dm(i1, m0) = 0xa57f;
 dm(i1, m0) = 0xb8e4;
 dm(i1, m0) = 0xcf05;
 dm(i1, m0) = 0xe708;
 dm(i1, m0) = 0x0000;
 dm(i1, m0) = 0x18f8;
 dm(i1, m0) = 0x30fb;
 dm(i1, m0) = 0x471c;
 dm(i1, m0) = 0x5a81;
 dm(i1, m0) = 0x6a6c;
 dm(i1, m0) = 0x7640;
 dm(i1, m0) = 0x7d89;

 i1 = ^sin_table;
 dm(i1, m0) = 0x0000;
 dm(i1, m0) = 0x18f8;
 dm(i1, m0) = 0x30fb;
 dm(i1, m0) = 0x471c;
 dm(i1, m0) = 0x5a81;
 dm(i1, m0) = 0x6a6c;
 dm(i1, m0) = 0x7640;
 dm(i1, m0) = 0x7d89;
 dm(i1, m0) = 0x7fff;
 dm(i1, m0) = 0x7d89;
 dm(i1, m0) = 0x7640;
 dm(i1, m0) = 0x6a6c;
 dm(i1, m0) = 0x5a81;
 dm(i1, m0) = 0x471c;
 dm(i1, m0) = 0x30fb;
 dm(i1, m0) = 0x18f8;
 dm(i1, m0) = 0x0000;
 dm(i1, m0) = 0xe708;
 dm(i1, m0) = 0xcf05;
 dm(i1, m0) = 0xb8e4;
 dm(i1, m0) = 0xa57f;
 dm(i1, m0) = 0x9594;
 dm(i1, m0) = 0x89c0;
 dm(i1, m0) = 0x8277;
 dm(i1, m0) = 0x8001;
 dm(i1, m0) = 0x8277;
 dm(i1, m0) = 0x89c0;
 dm(i1, m0) = 0x9594;
 dm(i1, m0) = 0xa57f;
 dm(i1, m0) = 0xb8e4;
 dm(i1, m0) = 0xcf05;
 dm(i1, m0) = 0xe708;

 i1 = ^angle_table_32;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x2000;
 dm(i1, m0) = 0x51d;
 dm(i1, m0) = 0x12e4;
 dm(i1, m0) = 0x385b;
 dm(i1, m0) = 0x9fb;
 dm(i1, m0) = 0x11d4;
 dm(i1, m0) = 0x511;
 dm(i1, m0) = 0xd43;
 dm(i1, m0) = 0x28b;
 dm(i1, m0) = 0xd7e1;
 dm(i1, m0) = 0x145;
 dm(i1, m0) = 0xf61e;
 dm(i1, m0) = 0xa2;
 dm(i1, m0) = 0x7c55;
 dm(i1, m0) = 0x51;
 dm(i1, m0) = 0xbe53;
 dm(i1, m0) = 0x28;
 dm(i1, m0) = 0x5f2e;
 dm(i1, m0) = 0x14;
 dm(i1, m0) = 0x2f98;
 dm(i1, m0) = 0xa;
 dm(i1, m0) = 0x17cc;
 dm(i1, m0) = 0x5;
 dm(i1, m0) = 0x8be6;
 dm(i1, m0) = 0x2;
 dm(i1, m0) = 0x45f3;
 dm(i1, m0) = 0x1;
 dm(i1, m0) = 0xa2f9;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x517c;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x28be;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x145f;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0xa2f;
 dm(i1, m0) = 0x0;

_init_finv_scrambler.end: rts;
 dm(i1, m0) = 0x517;
 dm(i1, m0) = 0x0;

_finv_scrambler:
 se = -15;
 ena m_mode;
 m0 = 1;
 m1 = 0;
 m2 = -1;
 m3 = -2;

 i5 = i4;
 dm(i4, m4) = 0; // hann windowed hilbert transform
 dm(i4, m4) = -68;
 dm(i4, m4) = -313;
 dm(i4, m4) = -800;
 dm(i4, m4) = -1645;
 dm(i4, m4) = -3128;
 dm(i4, m4) = -6289;
 dm(i4, m4) = -20632;
 dm(i4, m4) = 20633;
 dm(i4, m4) = 6290;
 dm(i4, m4) = 3129;
 dm(i4, m4) = 1646;
 dm(i4, m4) = 801;
 dm(i4, m4) = 314;
 dm(i4, m4) = 69;
 dm(i4, m4) = 0;

 cntr = 64;
 do finv_loop until ce;
 ax1 = 32767;
 i1 = ^finv_buffer;
 i2 = ^finv_buffer + 1;
 cntr = 30;
 do finv_memcpy until ce;
 ax0 = dm(i2, m0); // ax0 = x[n+1], i2+=1
 finv_memcpy: dm(i1, m0) = ax0; // x[n] = x[n+1], i1+=1
 mx0 = dm(i0, m1); // mx0 = x[n]
 my0 = dm(i5, m4); // my0 = h[0], i5 = 1
 mr = mx0 * my0(ss), dm(i1, m3) = mx0; // i1 = 28
 mx1 = dm(i1, m3); // mx1 = x[n-2], i1 = 26
 my1 = dm(i5, m4); // my1 = h[1], i5 = 2

 cntr = 15;
 do finv_filt until ce;
 mr = mr + mx1 * my1(ss), mx1 = dm(i1, m3); // sum += h[k] * x[n-2*k], mx1 = x[n-2k-2]
 finv_filt: my1 = dm(i5, m4); // my1 = h[k+1]

 m5 = -17;
 modify(i5, m5);
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi); // sr[1:0] = sum >> 15
 mr0 = sr0;
 //mr1 = sr1;
 mr1 = sr1, sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi); // sr[1:0] = mr[1:0] >> 15
 ar = pass mr0, ay0 = sr0;
 af = sr1 - ay0, ay1 = sr1; // sign bits ???
 if ne ar = ax1 xor ay1; // ar = sum
 ax0 = i0;
 dm(i4, m4) = ax0;
 dm(i4, m4) = ar;

 m2 = 1;
 m3 = -1;
 i2 = ^FSTD;
 call _oscillator_core;
 ax0 = dm(i2, m0);
 ax1 = dm(i2, m3);

Label_N: //ena m_mode;
 m5 = -1;
 modify(i4, m5);
 m2 = -1;
 i3 = ^FSTD;
 ax0 = dm(i3, m0);
 ay0 = 0x999a;
 ay1 = 0x6999;
 ar = ax0 + ay0, ax1 = dm(i3, m2);
 dm(i3, m0) = ar, ar = ax1 + ay1 + c;
 dm(i3, m1) = ar;
 i3 = ^vector;
 sr0 = dm(i3, m0);
 my0 = dm(i3, m1);

 ar = dm(i4, m5); // sum
 i3 = ^finv_buffer;
 m3 = 15;
 //modify(i3, m3);
 mr = ar * my0(ss), modify(i3, m3);
 my1 = dm(i3, m1);
 mr = mr + sr0 * my1(ss), si = sr0;
 sr = lshift mr0 by -14(lo);
 sr = sr or ashift mr1 by -14(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = pass mr0, ay0 = sr0;
 //af = sr1 - ay0, ay1 = sr1;
 m5 = 0;
 af = sr1 - ay0, ax0 = dm(i4, m5);
 ax1 = 32767;
 //if ne ar = ax1 xor ay1;
 if ne ar = ax1 xor sr1;
 //m5 = 0;
 //ax0 = dm(i4, m5);
 i0 = ax0; // data address
 dm(i0, m0) = ar;
 //dm(GPR13) = ar;
 finv_loop: m3 = -2;

_finv_scrambler.end: rts;
 m5 = -16;
 modify(i4, m5);

$_oscillator_core: si = ax0;
 ar = ax1;
 sr = lshift si by -27(lo);
 sr = sr or lshift ar by -27(hi); // beta >> 27
 m0 = sr0;
 i0 = ^sin_table;
 i1 = ^cos_table;
 //modify(i0, m0);
 //modify(i1, m0);
 si = sr0;
 sr = lshift si by 27(lo);
 //ay0 = sr0;
 //ar = ax0 - ay0, ay1 = sr1;
 ar = ax0 - sr0, ay1 = sr1;
 si = ar, ar = ax1 - ay1 + c - 1;
 sr = lshift si by -12(lo);
 sr = sr or ashift ar by -12(hi);
 my0 = 25736;
 mr = sr0 * my0(ss), modify(i0, m0); // modified
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi); // delta = sr0
 my1 = sr0;
 mr = sr0 * my1(ss), si = sr0;
 sr = lshift mr0 by -4(lo);
 sr = sr or ashift mr1 by -4(hi);
 ax0 = 0xffff;
 ax1 = 0x7fff;
 //ay0 = sr0;
 //ar = ax0 - ay0, ay1 = sr1;
 ar = ax0 - sr0, ay1 = sr1;
 ar = ax1 - ay1 + c - 1, mx1 = si; // c_delta
 sr = lshift si by 14(lo);
 mr = mx1 * my1(ss), ax0 = sr0;
 ax1 = sr1; // delta << 14
 sr = lshift mr0 by -18(lo);
 sr = sr or ashift mr1 by -18(hi);
 my0 = 5461;
 mr = mx1 * my0(ss), my1 = sr0;
 sr = lshift mr0 by -17(lo);
 sr = sr or ashift mr1 by -17(hi);
 mr = sr0 * my1(ss), mx0 = ar; // c_delta = mx0
 //ay0 = mr0;
 //ar = ax0 - ay0, ay1 = mr1;
 ar = ax0 - mr0, ay1 = mr1;
 ar = ax1 - ay1 + c - 1, modify(i1, m0); // s_delta = ar
 my0 = dm(i0, m1); // s
 my1 = dm(i1, m1); // c
 i0 = ^vector;
 mr = mx0 * my1(ss);
 mr = mr - ar * my0(ss);
 dm(i0, m2) = mr1, mr = mx0 * my0(ss);
 mr = mr + ar * my1(ss);
_oscillator_core.end: rts;
 dm(i0, m2) = mr1;
 m0 = 1;

_Compressor:
 m0 = 1;
 m1 = 0;
 m2 = -1;
 m3 = 2;
 ena m_mode;

 i1 = ^COMPD;
 cntr = 64;
 do comp_loop until ce;
 se = -7;
 //ax0 = dm(i1, m1); // ar = x[n-1]
 //ar = ax0 + 64;
 ay0 = dm(i1, m1);
 ar = 64 + ay0;
 sr = ashift ar(lo);
 af = ay0 - sr0, mr0 = dm(i0, m1); // ABS(mr0)
 sr = lshift mr0 by -15(lo); // if(sign(a) < 0)???
 ar = mr0 - sr0; // a - sign(a)
 sr = ashift mr0 by -15(lo); // sign(a)
 ar = ar xor sr0;
 ar = 64 + ar;
 sr = lshift ar(lo), mr1 = mr0; // mr1 = a
 ar = sr0 + af;
 my1 = ar;
 dm(i1, m1) = ar; // envelope detector
 sr = ashift ar by 16(lo);
 call _Sqrt_32;
 ax0 = sr0;
 ax1 = sr1;

 my0 = mr1;
 mr = ar * my0(us); // 16-bit unsigned Sqrt
 sr = lshift mr0 by -2(lo);
 sr = sr or ashift mr1 by -2(hi);
 af = pass sr1, ay0 = sr0; // numerator MSBs could be {af, ay1}
 ar = my1; // denominator could be XOPs
 divs af, ar;
 divq ar; divq ar; divq ar; divq ar; // dividend exceptions 
 divq ar; divq ar; divq ar; divq ar;
 divq ar; divq ar; divq ar; divq ar;
 divq ar; divq ar; divq ar; divq ar;

 ay1 = ar, ar = abs sr1; // for avoidance of quotient overflows
 si = ar;
 ax1 = sr1;
 sr = lshift si by 1(lo); // overflows iif dividend / divisor > 2^15 = \ 
 // 2^16 * divisor < (2 * dividend)
 af = sr0 - ay1, ar = ay0;
 ay1 = 32767;
 sr1 = ax1;
 sr = ashift sr1 by -15(lo);
 if ge ar = sr0 xor ay1;
 //dm(i2, m0) = ay0;
 comp_loop: dm(i0, m0) = ar;

_Compressor.end: rts;
 ena m_mode;
 ena m_mode;

_Expander:
 m0 = 1;
 m1 = 0;
 m2 = -1;
 m3 = 2;
 dis m_mode;

 i1 = ^COMPD;
 se = -7;
 ax1 = 32767;
 cntr = 64;
 do expnd_loop until ce;
 ar = dm(i1, m1); // ar = expnd[n-1]
 sr = ashift ar(lo);
 //ay0 = sr0;
 af = ar - sr0, mr0 = dm(i0, m1);
 sr = lshift mr0 by -15(lo); // abs(a)
 //ay0 = sr0; // if(b < 0)?
 ar = mr0 - sr0;
 sr = ashift ar by -15(lo);
 //ay0 = sr0;
 //ar = ar xor ay0;
 ar = ar xor sr0;
 sr = ashift ar(lo), my0 = mr0; // my0 = a
 ar = sr0 + af;
 mr = ar * my0(ss), dm(i1, m1) = ar;
 sr = lshift mr0 by -10(lo);
 sr = sr or ashift mr1 by -10(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = pass mr0, ay0 = sr0;
 af = sr1 - ay0, ay1 = sr1;
 if ne ar = ax1 xor ay1;
 //dm(GPR13) = ar;
 expnd_loop: dm(i0, m0) = ar;

_Expander.end: rts;
 ena m_mode;

_Emphasis:
 m1 = 0;
 m2 = 1;
 m3 = -1;

 ena m_mode;
 ax1 = 32767;
 cntr = 64;
 do empha_loop until ce;

 i2 = ^empd; // &empd[0]
 i3 = ^empd + 1; // &empd[1]
 cntr = 5;
 do empha_mem_move until ce;
 ax0 = dm(i3, m2);
 empha_mem_move: dm(i2, m2) = ax0;

 ax0 = dm(i0, m1);
 dm(i2, m2) = ax0;
 i1 = ^empd;
 i2 = ^hd;
 mr = 0;
 mx0 = dm(i1, m2);
 my0 = dm(i2, m2);
 cntr = 6;
 do emp_filt until ce;
 mr = mr + mx0 * my0(ss), mx0 = dm(i1, m2);
 emp_filt: my0 = dm(i2, m2); // 2 * 2^15 * 2^14 = 2^30

 sr = lshift mr0 by -14(lo);
 sr = sr or ashift mr1 by -14(hi);

 mr0 = sr0;
 mr1 = sr1;

 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = pass mr0, ay0 = sr0;
 af = sr1 - ay0, ay1 = sr1;
 if ne ar = ax1 xor ay1;
 empha_loop: dm(i0, m2) = ar;

_Emphasis.end: rts;

$_DC_Reject:
 m1 = 0;
 m2 = 1;
 m3 = -1;
 dis m_mode;

 cntr = 64;
 do dc_reject_loop until ce;
 i1 = ^_dc_reject_coeff;
 i2 = ^_dc_reject_taps;
 mx0 = dm(i0, m1); // speech[i]
 my0 = dm(i1, m2); // coeff[0]
 mr = mx0 * my0(ss), mx1 = dm(i2, m1); // mx1 = TAP[0], MR = Q16
 my1 = dm(i1, m2); // coeff[1]
 dm(i2, m2) = mx0;
 mr = mr + mx1 * my1(ss), my0 = dm(i1, m2); // coeff[2]
 mx0 = dm(i2, m2); // TAP[1].L
 af = pass mr1, mx1 = dm(i2, m3); // TAP[1].H
 ay0 = mr0, mr = mx0 * my0(us); // {af, ay0} = MR
 mr0 = mr1;
 mr1 = mr2;
 mr = mr + mx1 * my0(ss); // *2^-16
 ar = mr0 + ay0;
 af = mr1 + af + c, dm(i2, m2) = ar;
 ay0 = ar, ar = pass af;
 dm(i2, m2) = ar;
 dc_reject_loop: dm(i0, m2) = ar;

_DC_Reject.end: rts;
 ena m_mode;
 ena m_mode;

$_mu_law_compress:
 ar = dm(i0, m0); // m0 = 1
 ar = abs ar;
 //ay0 = 132;
 //ar = ar + ay0;
 ar = 132 + ar;
 sr1 = 32636;
 if av ar = pass sr1;
 se = exp ar(hi);
 sr = norm ar(lo);
 ay0 = 0x4000;
 ar = sr0 xor ay0; // toggle bit[14]
 sr = lshift ar by -10(lo);
 ax0 = se, ar = pass ay0;
 if pos ar = pass 0;
 sr = sr or lshift ar by -7(lo);
 ay0 = 7;
 ar = ax0 + ay0;
 if lt ar = pass 0;
 sr = sr or lshift ar by 4(lo);

_mu_law_compress.end: rts;
 ar = not sr0;
 dm(uart_tx_buffer) = ar;

$_SRC_1_2:
 dis m_mode;
 se = -15;
 m1 = 0;
 m2 = 1;
 m3 = -1;
 l3 = 32;

 dm(i3, m2) = sr0; // Must Circular Buffer
 dm(_poly_buffer_wptr) = i3;

 ay0 = 32767;
 i2 = ^poly_coeff;
 mx0 = dm(i3, m2);
 my0 = dm(i2, m2);
 mr = 0;
 cntr = 16;
 do src_poly_fir until ce;
 mr = mr + mx0 * my0(ss), mx0 = dm(i3, m2);
 //if mv sat mr;
 src_poly_fir: my0 = dm(i2, m2);
 ax1 = mx0;

 i2 = ^poly_coeff + 15; // c[15]
 my0 = dm(i2, m3);
 cntr = 16;
 do src_poly_fir_i until ce;
 mr = mr + mx0 * my0(ss), mx0 = dm(i3, m2);
 //if mv sat mr;
 src_poly_fir_i: my0 = dm(i2, m3);

 if mv sat mr;
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = ashift mr1(hi), ar = mr0;
 ay1 = sr1, sr = sr or lshift mr0(lo);
 af = sr0 - ay1;
 if ne ar = sr1 xor ay0;

_SRC_1_2.end: rts;
 ena m_mode;
 l3 = 0;

$_SRC_2_4:
 dis m_mode;
 se = -15;
 m1 = 0;
 m2 = 1;
 m3 = -1;
 l3 = 32;

 dm(i3, m2) = sr0;
 dm(_poly_buffer_wptr_i) = i3;

 ay0 = 32767;
 i2 = ^poly_coeff;
 mx0 = dm(i3, m2);
 my0 = dm(i2, m2);
 mr = 0;
 cntr = 16;
 do src_poly_fir_ii until ce;
 mr = mr + mx0 * my0(ss), mx0 = dm(i3, m2);
 //if mv sat mr;
 src_poly_fir_ii: my0 = dm(i2, m2);
 ax1 = mx0;

 i2 = ^poly_coeff + 15; // c[15]
 my0 = dm(i2, m3);
 cntr = 16;
 do src_poly_fir_iii until ce;
 mr = mr + mx0 * my0(ss), mx0 = dm(i3, m2);
 //if mv sat mr;
 src_poly_fir_iii: my0 = dm(i2, m3);

 if mv sat mr;
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = ashift mr1(hi), ar = mr0;
 ay1 = sr1, sr = sr or lshift mr0(lo);
 af = sr0 - ay1;
 if ne ar = sr1 xor ay0;

_SRC_2_4.end: rts;
 ena m_mode;
 l3 = 0;
