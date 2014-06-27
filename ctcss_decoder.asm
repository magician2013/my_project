.pmrom0;
.module/ram/abs;
#define SPECIFIC_FLAG 1
//#define TM_FLAG 1

$_init_CTCSS_Decoder: m0 = 1;
 i0 = ^F_L;
 dm(i0, m0) = 0x81b1; // for 250.3Hz
 dm(i0, m0) = 0x0005;

 i0 = ^ctcss_freq_esti;
 dm(i0, m0) = 0x0000;
 dm(i0, m0) = 0x0050; // 40 Hz

 i0 = ^ctcss_freq_buffer;
 cntr = 8;
 do clr_freq until ce;
 clr_freq: dm(i0, m0) = 0;

 i0 = ^ctcss_power_buffer;
 cntr = 6;
 do clr_power until ce;
 clr_power: dm(i0, m0) = 0;

 i0 = ^ctcss_temp_signal;
 cntr = 6;
 do clr_temp until ce;
 clr_temp: dm(i0, m0) = 0;

 i0 = ^ACC;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;

 i0 = ^F_H;
_init_CTCSS_Decoder.end: rts;
 dm(i0, m0) = 0x03b0;
 dm(i0, m0) = 0x000c;

$_CTCSS_Decoder:
 m1 = 0;
 m2 = 1;
 m3 = -1;
 dis m_mode;

 i0 = ^fft_buffer;
 dm(i0, m2) = 0;
 dm(i0, m2) = 20;
 dm(i0, m2) = 80;
 dm(i0, m2) = 180;
 dm(i0, m2) = 319;
 dm(i0, m2) = 498;
 dm(i0, m2) = 716;
 dm(i0, m2) = 972;
 dm(i0, m2) = 1266;
 dm(i0, m2) = 1597;
 dm(i0, m2) = 1964;
 dm(i0, m2) = 2366;
 dm(i0, m2) = 2803;
 dm(i0, m2) = 3273;
 dm(i0, m2) = 3775;
 dm(i0, m2) = 4308;
 dm(i0, m2) = 4870;
 dm(i0, m2) = 5461;
 dm(i0, m2) = 6078;
 dm(i0, m2) = 6720;
 dm(i0, m2) = 7386;
 dm(i0, m2) = 8075;
 dm(i0, m2) = 8783;
 dm(i0, m2) = 9510;
 dm(i0, m2) = 10254;
 dm(i0, m2) = 11013;
 dm(i0, m2) = 11785;
 dm(i0, m2) = 12568;
 dm(i0, m2) = 13361;
 dm(i0, m2) = 14161;
 dm(i0, m2) = 14966;
 dm(i0, m2) = 15775;
 dm(i0, m2) = 16586;
 dm(i0, m2) = 17396;
 dm(i0, m2) = 18203;
 dm(i0, m2) = 19006;
 dm(i0, m2) = 19803;
 dm(i0, m2) = 20591;
 dm(i0, m2) = 21369;
 dm(i0, m2) = 22134;
 dm(i0, m2) = 22886;
 dm(i0, m2) = 23622;
 dm(i0, m2) = 24340;
 dm(i0, m2) = 25038;
 dm(i0, m2) = 25716;
 dm(i0, m2) = 26370;
 dm(i0, m2) = 27000;
 dm(i0, m2) = 27604;
 dm(i0, m2) = 28181;
 dm(i0, m2) = 28729;
 dm(i0, m2) = 29246;
 dm(i0, m2) = 29732;
 dm(i0, m2) = 30186;
 dm(i0, m2) = 30605;
 dm(i0, m2) = 30990;
 dm(i0, m2) = 31339;
 dm(i0, m2) = 31652;
 dm(i0, m2) = 31927;
 dm(i0, m2) = 32164;
 dm(i0, m2) = 32362;
 dm(i0, m2) = 32521;
 dm(i0, m2) = 32641;
 dm(i0, m2) = 32721;
 dm(i0, m2) = 32761;
 dm(i0, m2) = 32761;
 dm(i0, m2) = 32721;
 dm(i0, m2) = 32641;
 dm(i0, m2) = 32521;
 dm(i0, m2) = 32362;
 dm(i0, m2) = 32164;
 dm(i0, m2) = 31927;
 dm(i0, m2) = 31652;
 dm(i0, m2) = 31339;
 dm(i0, m2) = 30990;
 dm(i0, m2) = 30605;
 dm(i0, m2) = 30186;
 dm(i0, m2) = 29732;
 dm(i0, m2) = 29246;
 dm(i0, m2) = 28729;
 dm(i0, m2) = 28181;
 dm(i0, m2) = 27604;
 dm(i0, m2) = 27000;
 dm(i0, m2) = 26370;
 dm(i0, m2) = 25716;
 dm(i0, m2) = 25038;
 dm(i0, m2) = 24340;
 dm(i0, m2) = 23622;
 dm(i0, m2) = 22886;
 dm(i0, m2) = 22134;
 dm(i0, m2) = 21369;
 dm(i0, m2) = 20591;
 dm(i0, m2) = 19803;
 dm(i0, m2) = 19006;
 dm(i0, m2) = 18203;
 dm(i0, m2) = 17396;
 dm(i0, m2) = 16586;
 dm(i0, m2) = 15775;
 dm(i0, m2) = 14966;
 dm(i0, m2) = 14161;
 dm(i0, m2) = 13361;
 dm(i0, m2) = 12568;
 dm(i0, m2) = 11785;
 dm(i0, m2) = 11013;
 dm(i0, m2) = 10254;
 dm(i0, m2) = 9510;
 dm(i0, m2) = 8783;
 dm(i0, m2) = 8075;
 dm(i0, m2) = 7386;
 dm(i0, m2) = 6720;
 dm(i0, m2) = 6078;
 dm(i0, m2) = 5461;
 dm(i0, m2) = 4870;
 dm(i0, m2) = 4308;
 dm(i0, m2) = 3775;
 dm(i0, m2) = 3273;
 dm(i0, m2) = 2803;
 dm(i0, m2) = 2366;
 dm(i0, m2) = 1964;
 dm(i0, m2) = 1597;
 dm(i0, m2) = 1266;
 dm(i0, m2) = 972;
 dm(i0, m2) = 716;
 dm(i0, m2) = 498;
 dm(i0, m2) = 319;
 dm(i0, m2) = 180;
 dm(i0, m2) = 80;
 dm(i0, m2) = 20;
 dm(i0, m2) = 0;

 i0 = ^In_buffer;
 i1 = ^fft_buffer;
 sr0 = dm(i0, m2);
 cntr = 128;
 do ctcss_hann until ce;
 my0 = dm(i1, m1);
 mr = sr0 * my0(ss), sr0 = dm(i0, m2);
 ctcss_hann: dm(i1, m2) = mr1;

 sb = -16;
 i0 = ^fft_buffer; // windowed data
 si = dm(i0, m2);
 cntr = 128;
 do ctc_alc until ce;
 ctc_alc: sb = expadj si, si = dm(i0, m2);

 se = sb;
 i0 = ^fft_buffer;
 cntr = 128;
 do ctc_agc until ce;
 si = dm(i0, m1);
 sr = norm si(lo);
 ctc_agc: dm(i0, m2) = sr0;

 ay0 = 0x0000;
 ay1 = 0x03e8; // 65536000
 i0 = ^ctcss_freq_esti;
 ax0 = dm(i0, m2);
 ar = ax0 - ay0, ax1 = dm(i0, m3);
 af = ax1 - ay1 + c - 1;
 if lt jump Label_CTC_A; // Quadradant II ??

 ay0 = 0x0000; // 131072000
 ay1 = 0x07d0;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1, ax0 = ar;
 //ar = pass af;
 //ax1 = ar;

 i1 = ^angle_table;
 call _cordic;
 ar = pass af;
 ax1 = ar;

 i1 = ^vector;
 ax0 = dm(i1, m2);
 ar = -ax0, ax1 = dm(i1, m3);
 dm(i1, m2) = ar;
 jump Label_CTC_B;
 ar = -ax1;
 dm(i1, m3) = ar;

Label_CTC_A:
 call _cordic;
 i1 = ^angle_table;
 i1 = ^angle_table;

Label_CTC_B: ena m_mode;
 i1 = ^vector;
 mx0 = dm(i1, m2); // vector[0]
 mx1 = dm(i1, m3); // vector[1]
 dm(GPR13) = mx0;
 dm(GPR14) = mx1;
 si = mx0;
 sr = ashift si by -1(lo);

 i0 = ^ctcss_r_data;
 dm(i0, m2) = 16384;
 dm(i0, m3) = mx0;

 i0 = ^ctcss_i_data;
 dm(i0, m2) = 4096;
 dm(i0, m3) = sr0;

 i0 = ^fft_buffer;
 i1 = ^ctcss_sum_a;
 ar = 16384;
 my0 = dm(i0, m2); // my0 = buffer[0]
 mr = ar * my0(ss), my1 = dm(i0, m2); // my1 = buffer[1]
 mr = mr + mx0 * my1(ss);
 se = sb;
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -7(lo);
 sr = sr or ashift mr1 by -7(hi);
 dm(i1, m2) = sr0;
 dm(i1, m3) = sr1;
 //sr0 = 0x5a5a;
 //sr1 = 0x5a5a;
 //dm(GPR13) = sr0;
 //dm(GPR14) = sr1;

 i1 = ^ctcss_sum_b;
 mr = mx1 * my1(ss);
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -9(lo);
 sr = sr or ashift mr1 by -9(hi);
 dm(i1, m2) = sr0;
 dm(i1, m3) = sr1;

 i1 = ^ctcss_sum_a;
 i2 = ^ctcss_r_data;
 i3 = ^ctcss_i_data;
 cntr = 126;
 do CTC_DTFT until ce;
 se = -13;
 my0 = dm(i2, m2); // my0 = ctcss_r_data[0]
 my1 = dm(i2, m3); // my1 = ctcss_r_data[1]
 mr = mx0 * my1(ss); // my1 = ctcss_r_data[1]
 sr = lshift mr0(lo), dm(i2, m2) = my1;
 sr = sr or ashift mr1(hi), ay0 = my0; // ay0 = RD[0]
 ar = sr0 - ay0, my0 = dm(i0, m2); // R, my0 = Data_In[j]
 mr = ar * my0(ss); 
 se = sb;
 sr = lshift mr0(lo), dm(i2, m3) = ar; // >> (-sb)
 sr = sr or ashift mr1(hi); // >> (-sb)
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -7(lo);
 sr = sr or ashift mr1 by -7(hi);
 ay0 = dm(i1, m2); // ctcss_sum_a.L
 ar = sr0 + ay0, ay1 = dm(i1, m3); // ay1 = ctcss_sum_a.H
 af = sr1 + ay1 + c, dm(i1, m2) = ar;
 ar = pass af;
 dm(i1, m3) = ar;

 se = -13;
 ay0 = dm(i3, m2); // ay0 = ctcss_i_data[0]
 my1 = dm(i3, m3); // my1 = ctcss_i_data[1]
 mr = mx0 * my1(ss), dm(i3, m2) = my1;
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi);
 ar = sr0 - ay0; // ar = I
 mr = mx1 * my1(ss), dm(i3, m3) = ar; // ctcss_i_data[1] = I
 sr = lshift mr0 by -14(lo);
 sr = sr or ashift mr1 by -14(hi);
 mr = sr0 * my0(ss);
 se = sb;
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -7(lo);
 sr = sr or ashift mr1 by -7(hi);
 i1 = ^ctcss_sum_b;
 ay0 = dm(i1, m2);
 ar = sr0 + ay0, ay1 = dm(i1, m3);
 af = sr1 + ay1 + c, dm(i1, m2) = ar;
 ar = pass af;
 dm(i1, m3) = ar;
 CTC_DTFT: i1 = ^ctcss_sum_a;

 //ax0 = dm(i1, m2);
 //ax1 = dm(i1, m3);
 //dm(GPR13) = ax0;
 //dm(GPR14) = ax1;

 i1 = ^ctcss_temp_signal;
 i2 = ^ctcss_temp_signal + 2;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m2);
 dm(i1, m2) = ax0;
 dm(i1, m2) = ax1;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m3);
 dm(i1, m2) = ax0;
 dm(i1, m2) = ax1;

 dm(i2, m2) = 0;
 dm(i2, m3) = 0;
 i0 = ^fft_buffer;
 se = sb;
 cntr = 128;
 do ctc_frame_power until ce; // ctcss_temp_signal++
 ar = dm(i0, m2);
 sr = ashift ar(lo);
 my0 = sr0;
 mr = sr0 * my0(ss);
 sr = lshift mr0 by -7(lo);
 sr = sr or ashift mr1 by -7(hi);
 ay0 = dm(i2, m2);
 ar = sr0 + ay0, ay1 = dm(i2, m3);
 af = sr1 + ay1 + c, dm(i2, m2) = ar;
 ar = pass af;
 ctc_frame_power: dm(i2, m3) = ar;

 i0 = ^In_buffer + 64;
 i1 = ^ACC;
 i2 = ^ctcss_sum_c;
 dm(i2, m2) = 0;
 dm(i2, m3) = 0;
 i3 = ^ctcss_sum_d;
 dm(i3, m2) = 0;
 dm(i3, m3) = 0;
 i5 = i4;
 m5 = 0;
 cntr = 64;
 do CTCSS_DFT until ce;
 ax0 = dm(i1, m2); // unsigned ACC
 ax1 = dm(i1, m3);
 ay0 = 0x0000;
 ay1 = 0x4000;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 if lt jump CTC_DFT_L1;
 ay0 = 0xffff;
 ay1 = 0x7fff;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1, ax0 = ar;
 ar = pass af;
 ax1 = ar;
 //ar = i0;
 //dm(i4, m4) = ar;
 i1 = ^angle_table_32;
 call _cordic;
 ar = i0;
 dm(i4, m4) = ar;

 ar = dm(i5, m5);
 i0 = ar;
 i4 = i5;

 i1 = ^vector;
 ax0 = dm(i1, m2);
 ar = -ax0, ax1 = dm(i1, m3);
 af = -ax1, dm(i1, m2) = ar;
 jump CTC_DFT_END;
 ar = pass af;
 dm(i1, m3) = ar;

CTC_DFT_L1: ay0 = 0x0000;
 ay1 = 0xc000; // 3221225472
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 if ge jump CTC_DFT_L0;

 ay0 = 0xffff;
 ay1 = 0x7fff;
 ar = ax0 + ay0;
 af = ax1 + ay1 + c, ax0 = ar;
 ar = pass af;
 ax1 = ar;
 i1 = ^angle_table_32;
 //ar = i0;
 //dm(i4, m4) = ar;
 call _cordic;
 ar = i0;
 dm(i4, m4) = ar;
 ar = dm(i5, m5);
 i0 = ar;
 i4 = i5;

 i1 = ^vector;
 ax0 = dm(i1, m2);
 ar = -ax0, ax1 = dm(i1, m3);
 af = -ax1, dm(i1, m2) = ar;
 jump CTC_DFT_END;
 ar = pass af;
 dm(i1, m3) = ar;

CTC_DFT_L0: //ar = i0;
 //dm(i4, m4) = ar;
 i1 = ^angle_table_32;
 call _cordic;
 ar = i0;
 dm(i4, m4) = ar;
 ar = dm(i5, m5);
 i0 = ar;
 i4 = i5;

CTC_DFT_END: i1 = ^vector;
 mx0 = dm(i1, m2);
 my0 = dm(i0, m2); // data_input[j]
 mr = mx0 * my0(ss), mx1 = dm(i1, m3);
 sr = lshift mr0 by -7(lo);
 sr = sr or ashift mr1 by -7(hi);
 ay0 = dm(i2, m2); // ctcss_sum_c.L
 ar = sr0 + ay0, ay1 = dm(i2, m3); // ctcss_sum_c.H
 af = sr1 + ay1 + c, dm(i2, m2) = ar;
 ar = pass af;
 mr = mx1 * my0(ss), dm(i2, m3) = ar;
 sr = lshift mr0 by -7(lo); // fraction mode
 sr = sr or ashift mr1 by -7(hi);
 ay0 = dm(i3, m2);
 ar = sr0 + ay0, ay1 = dm(i3, m3);
 af = sr1 + ay1 + c, dm(i3, m2) = ar;
 ar = pass af;
 dm(i3, m3) = ar;
 i1 = ^ACC;
 ax0 = dm(i1, m2);
 ay0 = 0xd495;
 ay1 = 0x2009;
 ar = ax0 + ay0, ax1 = dm(i1, m3);
 af = ax1 + ay1 + c, dm(i1, m2) = ar;
 ar = pass af;
 CTCSS_DFT: dm(i1, m3) = ar;

 ena m_mode;
 i0 = ^dft_buffer;
 i1 = ^dft_buffer + 4; // dft_buffer[2]
 cntr = 3;
 do dft_buffer_cpy until ce;
 ax0 = dm(i1, m2);
 ax1 = dm(i1, m2); // real part
 dm(i0, m2) = ax0;
 dm(i0, m2) = ax1;
 ax0 = dm(i1, m2);
 ax1 = dm(i1, m2);
 dm(i0, m2) = ax0;
 dft_buffer_cpy: dm(i0, m2) = ax1;

 ax0 = dm(i2, m2); // ctcss_sum_c
 ax1 = dm(i2, m3);

 //i1 = _debug_buffer;
 //dm(i1, m2) = ax0;
 //dm(i1, m3) = ax1;

 dm(i0, m2) = ax0;
 dm(i0, m2) = ax1;
 ay0 = dm(i3, m2); // ctcss_sum_d
 ax0 = 0;
 ax1 = 0;
 ar = ax0 - ay0, ay1 = dm(i3, m3);
 af = ax1 - ay1 + c - 1, dm(i0, m2) = ar;
 ar = pass af;
 dm(i0, m2) = ar;

 i0 = ^dft_buffer;
 i1 = ^ctcss_sum_c;
 dm(i1, m2) = 0;
 dm(i1, m3) = 0;
 i2 = ^ctcss_sum_d;
 dm(i2, m2) = 0;
 dm(i2, m3) = 0;

 mr0 = dm(i0, m2);
 mr1 = dm(i0, m2); // dft_buffer[0]
 se = -2;
 cntr = 4;
 do dft_sum until ce;
 sr = lshift mr0(lo), ay0 = dm(i1, m2); // ctcss_sum_c.L
 sr = sr or ashift mr1(hi);
 ar = sr0 + ay0, ay1 = dm(i1, m3); // ctcss_sum_c.H
 af = sr1 + ay1 + c, dm(i1, m2) = ar;
 ar = pass af, mr0 = dm(i0, m2);
 dm(i1, m3) = ar;
 sr = lshift mr0(lo), mr1 = dm(i0, m2);
 sr = sr or ashift mr1(hi), ay0 = dm(i2, m2);
 ar = sr0 + ay0, ay1 = dm(i2, m3);
 af = sr1 + ay1 + c, dm(i2, m2) = ar;
 ar = pass af, mr0 = dm(i0, m2);
 dm(i2, m3) = ar;
 dft_sum: mr1 = dm(i0, m2);

 se = -10;
 si = dm(i1, m2);
 sr = lshift si(lo), ar = dm(i1, m3);
 sr = sr or ashift ar(hi);
 my0 = sr0;
 mr = sr0 * my0(ss), si = dm(i2, m2);
 sr = lshift si(lo), ar = dm(i2, m3);
 sr = sr or ashift ar(hi);
 my1 = sr0;
 mr = mr + sr0 * my1(ss);
 dm(i1, m2) = mr0;
 dm(i1, m3) = mr1;

 //i0 = _debug_buffer;
 //dm(i0, m2) = mr0;
 //dm(i0, m3) = mr1;

 i0 = ^In_buffer + 64;
 ar = pass 0; // temp = 0
 af = pass 0;
 mx0 = dm(i0, m2);
 my0 = mx0;
 se = -6;
 cntr = 64;
 do sub_audio_power until ce;
 mr = mx0 * my0(ss);
 sr = lshift mr0(lo), mx0 = dm(i0, m2);
 sr = sr or ashift mr1(hi);
 ay0 = sr0;
 ar = ar + ay0, ax1 = sr1;
 sub_audio_power: af = ax1 + af, my0 = mx0;

 ax0 = ar;
 ar = pass af;
 ax1 = ar; // ax[1:0] = temp
 
 i1 = ^PW;
 mr0 = dm(i1, m2);
 mr1 = dm(i1, m3);
 sr = lshift mr0 by -1(lo);
 sr = sr or ashift mr1 by -1(hi); // sr[1:0] = PW/2
 ay0 = sr0;
 ar = mr0 - ay0, ay1 = sr1;
 af = mr1 - ay1 + c - 1;
 mr0 = ax0;
 mr1 = ax1;
 sr = lshift mr0 by -1(lo);
 sr = sr or ashift mr1 by -1(hi);
 ay0 = sr0;
 ar = ar + ay0, ax0 = sr1;
 af = ax0 + af, dm(i1, m2) = ar;
 ay0 = ar;
 ar = pass af;
 dm(i1, m3) = ar;
 ay1 = ar;
 //i3 = _debug_buffer;
 //dm(i3, m2) = ay0;
 //dm(i3, m3) = ay1;
 i2 = ^ctcss_sum_c;
 //mr0 = dm(i2, m2);
 //mr1 = dm(i2, m3);
 call div_32_32;
 mr0 = dm(i2, m2);
 mr1 = dm(i2, m3);
 i0 = ^CMPR_Buffer;
 i1 = ^CMPR_Buffer + 1;
 cntr = 15;
 do cmpr_buffer_mcpy until ce;
 ax0 = dm(i1, m2);
 cmpr_buffer_mcpy: dm(i0, m2) = ax0;

 si = mx0; // q
 sr = ashift si by 16(lo);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -14(lo);
 sr = sr or ashift mr1 by -14(hi); // sum << 2

 mr0 = sr0; // sat_32_16
 mr1 = sr1;
 ay0 = 0x7fff;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ay1 = sr0; // sr1 = sign bits
 af = sr1 - ay1, ar = mr0;
 if ne ar = sr1 xor ay0;
 sr = ashift ar by 16(lo);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -16(lo);
 sr = sr or ashift mr1 by -16(hi);
 dm(i0, m2) = sr0;
 
 //i1 = _debug_buffer;
 //dm(i1, m2) = sr0;
 //dm(i1, m3) = sr1;

_CTCSS_Decoder.end: rts;
 ax0 = 0x0001;
 dm(squelch_event_trigger) = ax0;

$_CTCSS_Decoder_I:
 m1 = 0;
 m2 = 1;
 m3 = -1;
 m5 = 0;
 ena m_mode;

 i1 = ^CMPR_Buffer + 13;
 i2 = i1;

 ax0 = dm(i1, m2);
 af = pass ax0, ay0 = dm(i1, m2);
 ar = ax0 - ay0, ax1 = dm(i1, m2);
 if lt af = pass ay0;
 ar = ax1 - af, ax0 = dm(i2, m2);
 if ge af = pass ax1; // af = ctcss_sum_c

 ar = pass af, ay0 = dm(i2, m2);
 af = pass ax0, ay1 = ar; // ctcss_sum_c
 ar = ax0 - ay0, ax1 = dm(i2, m2);
 if ge af = pass ay0;
 ar = ax1 - af;
 if lt af = pass ax1;
 ar = pass af; // ctcss_sum_d

 //i2 = ^CMPR_Buffer;
 i3 = ^ANTI_STAT;
 ax0 = dm(i3, m1);
 af = pass ax0;
 if ne jump ANTI_TIME;
 i2 = ^CMPR_Buffer;
 i2 = ^CMPR_Buffer;

 af = ar - ay1; // ctcss_sum_d - ctcss_sum_c
 ay0 = 250;
 ar = -af; // ctcss_sum_c - ctcss_sum_d
 af = ar - ay0, ax0 = dm(i2, m1);
 if lt jump CTC_RFFT;
 nop;
 nop;
 ay0 = 400;
 af = ax0 - ay0;
 if lt jump CTC_RFFT;
 nop;
 nop;
 dm(i3, m1) = 1; // off-tone detect
 jump CTC_RFFT;
 i0 = ^CTCSS_Timer;
 dm(i0, m1) = 20;

ANTI_TIME: i0 = ^CTCSS_Timer;
 ax0 = dm(i0, m1);
 ar = pass ax0;
 if eq jump ANTI_TIME_L0;
 //if gt ar = ax0 - 1; // Timer-=1
 nop;
 nop;
 jump CTC_RFFT;
 if gt ar = ar - 1;
 dm(i0, m1) = ar;

ANTI_TIME_L0: dm(i3, m1) = 0;

CTC_RFFT: i0 = ^ANTI_STAT;
 si = dm(i0, m1);
 sr = lshift si by 8(lo);
 ar = dm(GPR14);
 ay0 = 0xfeff;
 af = ar and ay0;
 ar = sr0 or af;
 dm(GPR14) = ar;
 
 //ax0 = dm(i0, m1);
 //i3 = _debug_buffer;
 //dm(i3, m2) = ax0;
 //dm(i3, m3) = 0;

 call _rfft_128;
 i0 = ^fft_buffer;
 i0 = ^fft_buffer;

 i1 = ^ctcss_data_power + 2;
 i2 = ^rfft_out + 2;
 se = sb;
 cntr = 63;
 do ctc_power_func until ce;
 mr0 = dm(i1, m2);
 mr1 = dm(i1, m3);
 sr = lshift mr0 by -1(lo);
 sr = sr or ashift mr1 by -1(hi);
 ay0 = sr0;
 ar = mr0 - ay0, ay1 = sr1;
 af = mr1 - ay1 + c - 1, mr0 = ar;
 ar = pass af, si = dm(i2, m2); // ar, mr0
 sr = ashift si(lo), si = dm(i2, m2);
 my0 = sr0;
 //ay0 = mr0;
 ay0 = mr0, mr = sr0 * my0(ss);
 sr = ashift si(lo), ay1 = ar;
 my1 = sr0;
 mr = mr + sr0 * my1(ss);
 sr = lshift mr0 by -1(lo);
 sr = sr or ashift mr1 by -1(hi);
 ar = sr0 + ay0;
 //af = sr1 + ay1 + c, dm(i1, m2) = ar;
 dm(i1, m2) = ar, ar = sr1 + ay1 + c;
 //ar = pass af;
 ctc_power_func: dm(i1, m2) = ar;

 i2 = ^rfft_out; // 0:127, 2:126
 i3 = ^ctcss_data_power; // DC
 si = dm(i3, m2);
 ar = dm(i3, m3);
 sr = lshift si by -1(lo);
 sr = sr or ashift ar by -1(hi); // * 0.5
 ax0 = si; // ctcss_data_power[n-1].L
 ay0 = sr0; // ctcss_data_power[n-1]/2.L
 ax1 = ar; // ctcss_data_power[n-1].H
 ar = ax0 - ay0, ay1 = sr1;
 af = ax1 - ay1 + c - 1, ay0 = ar; // ay0 = ctcss_data_power[n-1]/2.L, af = ctcss_data_power[n-1]/2.H
 si = dm(i2, m2);
 sr = ashift si(lo); // >> (-sb)
 my0 = sr0;
 mr = sr0 * my0(ss);
 sr = lshift mr0 by -1(lo);
 sr = sr or ashift mr1 by -1(hi);
 ar = sr0 + ay0;
 af = sr1 + af + c, dm(i3, m2) = ar;
 ar = pass af;
 dm(i3, m3) = ar;

 i2 = ^rfft_out + 1;
 i3 = ^ctcss_data_power + 128; // Nyquist
 si = dm(i3, m2);
 ar = dm(i3, m3);
 sr = lshift si by -1(lo);
 sr = sr or ashift ar by -1(hi);
 ax0 = si; // L
 ay0 = sr0;
 ax1 = ar; // H
 ar = ax0 - ay0, ay1 = sr1;
 af = ax1 - ay1 + c - 1, ay0 = ar;
 si = dm(i2, m2);
 sr = ashift si(lo); // >> (-sb)
 my0 = sr0;
 mr = sr0 * my0(ss);
 sr = lshift mr0 by -1(lo);
 sr = sr or ashift mr1 by -1(hi);
 ar = sr0 + ay0;
 af = sr1 + af + c, dm(i3, m2) = ar;
 ar = pass af;
 dm(i3, m3) = ar;

_CTCSS_Decoder_I.end: rts;

$_CTCSS_Decoder_II:
 m1 = 0;
 m2 = 1;
 m3 = -1;
 m5 = 0;
 ena m_mode;

 i2 = ^ctcss_data_power + 2;
 ay0 = dm(i2, m2);
 ay1 = dm(i2, m2); // max_idx
 i3 = i2; // i3 = 2
 ax0 = dm(i2, m2); // ctcss_data_power[2].L
 cntr = 15;
 do ctc_sort until ce;
 ar = ax0 - ay0, ax1 = dm(i2, m2);
 af = ax1 - ay1 + c - 1;
 if lt jump ctc_sort;
 nop;
 nop;
 i3 = i2;
 ay0 = ax0;
 ay1 = ax1;
 ctc_sort: ax0 = dm(i2, m2);

 modify(i3, m3);
 modify(i3, m3);
 ar = i3;
 ay0 = ^ctcss_data_power;
 ar = ar - ay0;
 sr = ashift ar by -1(lo);
 ar = pass sr0;
 i5 = i4;
 dm(i4, m4) = ar; // channel number

 //i1 = _debug_buffer;
 //dm(i1, m2) = ar;
 //dm(i1, m3) = 0;

 i1 = ^ctcss_data_power;
 i2 = ^ctcss_data_power;
 sr = lshift ar by 1(lo);
 ar = sr0 - 2; // idx-1
 m0 = ar;
 modify(i1, m0);
 ax0 = dm(i1, m2);
 ax1 = dm(i1, m3);
 ar = sr0 + 2; // idx+1
 m0 = ar;
 modify(i2, m0);
 ay0 = dm(i2, m2);
 ar = ax0 - ay0, ay1 = dm(i2, m3);
 ar = ax1 - ay1 + c - 1, mr1 = sr0; // mr1 = channel * 2
 my1 = ar; // my1 = cmp results
 ar = i2;
 ay0 = i1;
 if ge ar = pass ay0;
 i3 = ar;
 //ax0 = dm(i3, m2);
 //ax1 = dm(i3, m3); // ax[1:0] = Sec_Peak

 call _Sqrt_32;
 ax0 = dm(i3, m2);
 ax1 = dm(i3, m3);

 sr = lshift ar by 1(lo); // 2q
 mx0 = sr0;
 mx1 = ar; // q
 m0 = mr1;
 i3 = ^ctcss_data_power;
 modify(i3, m0);
 
 //ax0 = dm(i3, m2);
 //ax1 = dm(i3, m3);

 call _Sqrt_32;
 ax0 = dm(i3, m2);
 ax1 = dm(i3, m3);

 ax0 = mx0;
 ay0 = ar;
 ar = ax0 - ay0, ax1 = mx1;
 sr = ashift ar by 14(lo);
 ar = ax1 + ay0;
 af = pass sr1, ay0 = sr0;
 divs af, ar;
 divq ar; divq ar; divq ar; divq ar;
 divq ar; divq ar; divq ar; divq ar;
 divq ar; divq ar; divq ar; divq ar;
 divq ar; divq ar; divq ar; divq ar;
 ar = my1;
 af = pass ar;
 ar = ay0;
 if ge ar = -ar;
 m5 = 0;
 i4 = i5;
 mx1 = dm(i5, m5);
 my1 = 125;
 mr = mx1 * my1(ss);
 sr = lshift mr1 by 14(hi);
 sr = sr or lshift mr0 by 14(lo);
 mr1 = sr1;
 mr0 = sr0;
 mr = mr + ar * my1(ss);
 i0 = ^ctcss_freq_buffer;
 i1 = ^ctcss_freq_buffer + 2;

 cntr = 3;
 do cfreq_cpy until ce;
 ax0 = dm(i1, m2);
 ax1 = dm(i1, m2);
 dm(i0, m2) = ax0;
 cfreq_cpy: dm(i0, m2) = ax1;

 dm(i0, m2) = mr0;
 dm(i0, m3) = mr1;

 //i1 = _debug_buffer;
 //dm(i1, m2) = mr0;
 //dm(i1, m3) = mr1;

 ay0 = mr0;
 ay1 = mr1;

 i0 = ^ctcss_power_buffer;
 i1 = ^ctcss_power_buffer + 2;
 cntr = 2;
 do cfreq_power until ce;
 ax0 = dm(i1, m2);
 ax1 = dm(i1, m2);
 dm(i0, m2) = ax0;
 cfreq_power: dm(i0, m2) = ax1;

 i2 = ^ctcss_sum_a;
 i3 = ^ctcss_sum_b;
 si = dm(i2, m2);
 ar = dm(i2, m3);
 sr = lshift si by -14(lo);
 sr = sr or ashift ar by -14(hi);
 my0 = sr0;
 mr = sr0 * my0(ss), si = dm(i3, m2);
 ar = dm(i3, m3);
 sr = lshift si by -12(lo);
 sr = sr or ashift ar by -12(hi);
 my0 = sr0;
 mr = mr + sr0 * my0(ss);
 dm(i0, m2) = mr0;
 dm(i0, m3) = mr1;
 dm(GPR13) = mr0;
 dm(GPR14) = mr1;

 //i1 = _debug_buffer;
 //dm(i1, m2) = mr0;
 //dm(i1, m3) = mr1;

 ax0 = 0x0000;
 ax1 = 0x0050;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 i0 = ^ctcss_freq_esti;
 dm(i0, m2) = ay0;
 dm(i0, m3) = ay1;
 if lt jump cfreq_verify;
 dm(GPR13) = ay0;
 dm(GPR14) = ay1;

 dm(i0, m2) = 0x0000;
 dm(i0, m3) = 0x0050;

#ifdef TM_FLAG
cfreq_verify: i0 = ^ctcss_freq_buffer; // Tone Clone Mode
 ax0 = dm(i0, m2);
 ax1 = dm(i0, m2);
 ay0 = dm(i0, m2);
 cntr = 3;
 do cfreq_cmp until ce;
 ar = ax0 - ay0, ay1 = dm(i0, m2);
 af = ax1 - ay1 + c - 1;
 if ge jump cfreq_cmp;
 nop;
 nop;
 ax0 = ay0;
 ax1 = ay1;
 cfreq_cmp: ay0 = dm(i0, m2);

 i0 = ^ctcss_freq_buffer;
 sr0 = dm(i0, m2);
 sr1 = dm(i0, m2);
 ay0 = dm(i0, m2);
 cntr = 3;
 do cfreq_cmp_min until ce;
 ar = sr0 - ay0, ay1 = dm(i0, m2);
 af = sr1 - ay1 + c - 1;
 if lt jump cfreq_cmp_min;
 nop;
 nop;
 sr0 = ay0;
 sr1 = ay1;
 cfreq_cmp_min: ay0 = dm(i0, m2);

 i0 = ^CTCSS_STAT;
 //i1 = ctcss_power_buffer;
 //i2 = ctcss_temp_signal;
 ar = dm(i0, m1);
 af = pass ar, ay0 = sr0;
 if ne jump ctcss_verify_release;
 nop;
 nop;
 i1 = ^ctcss_power_buffer;
 i2 = ^ctcss_temp_signal;
 ar = ax0 - ay0, ay1 = sr1;
 af = ax1 - ay1 + c - 1, ay0 = ar;
 ax0 = 0x0000;
 ax1 = 0x0008;
 ar = ax0 - ay0;
 af = ax1 - af + c - 1;
 if lt jump ctcss_term;
 nop;
 nop;
 si = dm(i1, m2);
 ar = dm(i1, m2);
 sr = lshift si by 2(lo);
 sr = sr or lshift ar by 2(hi);
 ay0 = dm(i2, m2); // temp[0]
 ar = sr0 - ay0, ay1 = dm(i2, m2);
 af = sr1 - ay1 + c - 1, si = dm(i1, m2);
 if lt jump ctcss_term;
 ar = abs sr0;
 ay0 = ar, ar = abs sr1;
 af = ar + ay0;
 if eq jump ctcss_term;
 nop;
 nop;
 ar = dm(i1, m2);
 sr = lshift si by 2(lo);
 sr = sr or lshift ar by 2(hi);
 ay0 = dm(i2, m2); // temp[1]
 ar = sr0 - ay0, ay1 = dm(i2, m2);
 af = sr1 - ay1 + c - 1, si = dm(i1, m2);
 if lt jump ctcss_term;
 ar = abs sr0;
 ay0 = ar, ar = abs sr1;
 af = ar + ay0;
 if eq jump ctcss_term;
 nop;
 nop;
 ar = dm(i1, m2);
 sr = lshift si by 2(lo);
 sr = sr or lshift ar by 2(hi);
 ay0 = dm(i2, m2); // temp[2]
 ar = sr0 - ay0;
 af = sr1 - ay1 + c - 1;
 if lt jump ctcss_term;
 ar = abs sr0;
 ay0 = ar, ar = abs sr1;
 af = ar + ay0;
 if eq jump ctcss_term;
 nop;
 nop;
 jump ctcss_term;
 nop;
 dm(i0, m1) = 0x0001;

ctcss_verify_release: ar = ax0 - ay0, ay1 = sr1;
 af = ax1 - ay1 + c - 1, ay0 = ar;
 ax0 = 0x0000;
 ax1 = 0x0010;
 ar = ax0 - ay0;
 af = ax1 - af + c - 1, si = dm(i1, m2);
 if ge jump ctcss_verify_proc;
 nop;
 nop;
 jump ctcss_term;
 nop;
 dm(i0, m1) = 0x0000;

ctcss_verify_proc: ar = dm(i1, m2);
 sr = lshift si by 3(lo);
 sr = sr or lshift ar by 3(hi);
 ay0 = dm(i2, m2); // temp[0]
 ar = sr0 - ay0, ay1 = dm(i2, m2);
 af = sr1 - ay1 + c - 1, si = dm(i1, m2);
 if ge jump ctcss_term;
 nop;
 nop;
 ar = dm(i1, m2);
 sr = lshift si by 3(lo);
 sr = sr or lshift ar by 3(hi);
 ay0 = dm(i2, m2); // temp[1]
 ar = sr0 - ay0, ay1 = dm(i2, m2);
 af = sr1 - ay1 + c - 1, si = dm(i1, m2);
 if ge jump ctcss_term;
 nop;
 nop;
 ar = dm(i1, m2);
 sr = lshift si by 3(lo);
 sr = sr or lshift ar by 3(hi);
 ay0 = dm(i2, m2); // temp[2]
 ar = sr0 - ay0, ay1 = dm(i2, m2);
 af = sr1 - ay1 + c - 1;
 if ge jump ctcss_term;
 nop;
 nop;
 dm(i0, m1) = 0x0000;
#endif

#ifdef SPECIFIC_FLAG
cfreq_verify: i0 = ^CTCSS_STAT;
 i1 = ^ctcss_freq_buffer;
 i2 = ^F_L; // 4Hz
 ar = dm(i0, m1); // CTCSS_STAT[0]
 af = pass ar;
 if ne jump ctcss_verify_release;
 nop;
 nop;
 ax0 = dm(i1, m2); // ctcss_freq_buffer[0].L
 ay0 = 0x999a;
 ay1 = 0x01f4; // fk
 ar = ax0 - ay0, ax1 = dm(i1, m2); // ctcss_freq_buffer[0].H
 dm(GPR13) = ax0;
 dm(GPR14) = ax1;
 af = ax1 - ay1 + c - 1, si = ar;
 ar = pass af, ax0 = si;
 sr = lshift si by -31(lo); // ABS
 sr = sr or lshift ar by -31(hi); // sr[1:0] = sign bit
 ax1 = ar;
 ay0 = sr0;
 ar = ax0 - ay0, ay1 = sr1;
 af = ax1 - ay1 + c - 1, si = ar;
 ar = pass af;
 sr = lshift si by -31(lo);
 sr = sr or ashift ar by -31(hi);
 ay0 = si;
 ay1 = ar;
 ar = sr0 xor ay0;
 af = sr1 xor ay1, ay0 = ar;
 ax0 = dm(i2, m2);
 ar = ax0 - ay0, ax1 = dm(i2, m3);
 af = ax1 - af + c - 1;
 if lt jump ctcss_term;
 nop;
 nop;

 ax0 = dm(i1, m2); // ctcss_freq_buffer[1]
 ay0 = 0x999a;
 ay1 = 0x01f4; // fk
 ar = ax0 - ay0, ax1 = dm(i1, m2);
 af = ax1 - ay1 + c - 1, si = ar;
 ar = pass af, ax0 = si;
 sr = lshift si by -31(lo); // ABS
 sr = sr or lshift ar by -31(hi); // sr[1:0] = sign bit
 ax1 = ar;
 ay0 = sr0;
 ar = ax0 - ay0, ay1 = sr1;
 af = ax1 - ay1 + c - 1, si = ar;
 ar = pass af;
 sr = lshift si by -31(lo);
 sr = sr or ashift ar by -31(hi);
 ay0 = si;
 ay1 = ar;
 ar = sr0 xor ay0;
 af = sr1 xor ay1, ay0 = ar;
 ax0 = dm(i2, m2);
 ar = ax0 - ay0, ax1 = dm(i2, m3);
 af = ax1 - af + c - 1;
 if lt jump ctcss_term;
 nop;
 nop;

 ax0 = dm(i1, m2); // ctcss_freq_buffer[1]
 ay0 = 0x999a;
 ay1 = 0x01f4; // fk
 ar = ax0 - ay0, ax1 = dm(i1, m2);
 af = ax1 - ay1 + c - 1, si = ar;
 ar = pass af, ax0 = si;
 sr = lshift si by -31(lo); // ABS
 sr = sr or lshift ar by -31(hi); // sr[1:0] = sign bit
 ax1 = ar;
 ay0 = sr0;
 ar = ax0 - ay0, ay1 = sr1;
 af = ax1 - ay1 + c - 1, si = ar;
 ar = pass af;
 sr = lshift si by -31(lo);
 sr = sr or ashift ar by -31(hi);
 ay0 = si;
 ay1 = ar;
 ar = sr0 xor ay0;
 af = sr1 xor ay1, ay0 = ar;
 ax0 = dm(i2, m2);
 ar = ax0 - ay0, ax1 = dm(i2, m3);
 af = ax1 - af + c - 1;
 if lt jump ctcss_term;
 nop;
 nop;

 ax0 = dm(i1, m2); // ctcss_freq_buffer[1]
 ay0 = 0x999a;
 ay1 = 0x01f4; // fk
 ar = ax0 - ay0, ax1 = dm(i1, m2);
 af = ax1 - ay1 + c - 1, si = ar;
 ar = pass af, ax0 = si;
 sr = lshift si by -31(lo); // ABS
 sr = sr or lshift ar by -31(hi); // sr[1:0] = sign bit
 ax1 = ar;
 ay0 = sr0;
 ar = ax0 - ay0, ay1 = sr1;
 af = ax1 - ay1 + c - 1, si = ar;
 ar = pass af;
 sr = lshift si by -31(lo);
 sr = sr or ashift ar by -31(hi);
 ay0 = si;
 ay1 = ar;
 ar = sr0 xor ay0;
 af = sr1 xor ay1, ay0 = ar;
 ax0 = dm(i2, m2);
 ar = ax0 - ay0, ax1 = dm(i2, m3);
 af = ax1 - af + c - 1;
 if lt jump ctcss_term;
 nop;
 nop;

 i2 = ^ctcss_power_buffer;
 i3 = ^ctcss_temp_signal;
 si = dm(i2, m2); // ctcss_power_buffer[0].L
 ar = dm(i2, m2); // ctcss_power_buffer[0].H
 dm(GPR13) = si;
 dm(GPR14) = ar;
 sr = lshift si by 2(lo);
 sr = sr or lshift ar by 2(hi);
 ay0 = dm(i3, m2);
 ar = sr0 - ay0, ay1 = dm(i3, m2);
 af = sr1 - ay1 + c - 1, si = dm(i2, m2);
 if lt jump ctcss_term;
 ar = abs sr0;
 ay0 = ar, ar = abs sr1;
 af = ar + ay0;
 if eq jump ctcss_term;
 nop;
 nop;
 ar = dm(i2, m2);
 sr = lshift si by 2(lo);
 sr = sr or lshift ar by 2(hi);
 ay0 = dm(i3, m2);
 ar = sr0 - ay0, ay1 = dm(i3, m2);
 af = sr1 - ay1 + c - 1, si = dm(i2, m2);
 if lt jump ctcss_term;
 ar = abs sr0;
 ay0 = ar, ar = abs sr1;
 af = ar + ay0;
 if eq jump ctcss_term;
 nop;
 nop;
 ar = dm(i2, m2);
 sr = lshift si by 2(lo);
 sr = sr or lshift ar by 2(hi);
 ay0 = dm(i3, m2);
 ar = sr0 - ay0, ay1 = dm(i3, m2);
 af = sr1 - ay1 + c - 1;
 if lt jump ctcss_term;
 ar = abs sr0;
 ay0 = ar, ar = abs sr1;
 af = ar + ay0;
 if eq jump ctcss_term;
 nop;
 nop;
 jump ctcss_term;
 nop;
 dm(i0, m1) = 1; // ctcss_stat = 1

ctcss_verify_release: i1 = ^ctcss_freq_buffer;
 i2 = ^F_H;
 ax0 = dm(i1, m2);
 ay0 = 0x999a;
 ay1 = 0x01f4;
 ar = ax0 - ay0, ax1 = dm(i1, m2);
 af = ax1 - ay1 + c - 1, si = ar;
 ar = pass af, ax0 = si;
 sr = lshift si by -31(lo);
 sr = sr or lshift ar by -31(hi);
 ax1 = ar;
 ay0 = sr0;
 ar = ax0 - ay0, ay1 = sr1;
 af = ax1 - ay1 + c - 1, si = ar; // b - b >>> 31
 ar = pass af;
 sr = lshift si by -31(lo);
 sr = sr or ashift ar by -31(hi);
 ax0 = si;
 ax1 = ar;
 ay0 = sr0;
 ar = ax0 xor ay0, ay1 = sr1;
 af = ax1 xor ay1, ay0 = ar;
 ax0 = dm(i2, m2);
 ar = ax0 - ay0, ax1 = dm(i2, m3); // F_H - ay[1:0]
 af = ax1 - af + c - 1, ax0 = dm(i1, m2);
 if ge jump ctcss_power_verify;
 nop;
 nop;

 ay0 = 0x999a;
 ay1 = 0x01f4;
 ar = ax0 - ay0, ax1 = dm(i1, m2);
 af = ax1 - ay1 + c - 1, si = ar;
 ar = pass af, ax0 = si;
 sr = lshift si by -31(lo);
 sr = sr or lshift ar by -31(hi);
 ax1 = ar;
 ay0 = sr0;
 ar = ax0 - ay0, ay1 = sr1;
 af = ax1 - ay1 + c - 1, si = ar; // b - b >>> 31
 ar = pass af;
 sr = lshift si by -31(lo);
 sr = sr or ashift ar by -31(hi);
 ax0 = si;
 ax1 = ar;
 ay0 = sr0;
 ar = ax0 xor ay0, ay1 = sr1;
 af = ax1 xor ay1, ay0 = ar;
 ax0 = dm(i2, m2);
 ar = ax0 - ay0, ax1 = dm(i2, m3);
 af = ax1 - af + c - 1, ax0 = dm(i1, m2);
 if ge jump ctcss_power_verify;
 nop;
 nop;

 ay0 = 0x999a;
 ay1 = 0x01f4;
 ar = ax0 - ay0, ax1 = dm(i1, m2);
 af = ax1 - ay1 + c - 1, si = ar;
 ar = pass af, ax0 = si;
 sr = lshift si by -31(lo);
 sr = sr or lshift ar by -31(hi);
 ax1 = ar;
 ay0 = sr0;
 ar = ax0 - ay0, ay1 = sr1;
 af = ax1 - ay1 + c - 1, si = ar; // b - b >>> 31
 ar = pass af;
 sr = lshift si by -31(lo);
 sr = sr or ashift ar by -31(hi);
 ax0 = si;
 ax1 = ar;
 ay0 = sr0;
 ar = ax0 xor ay0, ay1 = sr1;
 af = ax1 xor ay1, ay0 = ar;
 ax0 = dm(i2, m2);
 ar = ax0 - ay0, ax1 = dm(i2, m3);
 af = ax1 - af + c - 1, ax0 = dm(i1, m2);
 if ge jump ctcss_power_verify;
 nop;
 nop;
 ay0 = 0x999a;
 ay1 = 0x01f4;
 ar = ax0 - ay0, ax1 = dm(i1, m2);
 af = ax1 - ay1 + c - 1, si = ar;
 ar = pass af, ax0 = si;
 sr = lshift si by -31(lo);
 sr = sr or lshift ar by -31(hi);
 ax1 = ar;
 ay0 = sr0;
 ar = ax0 - ay0, ay1 = sr1;
 af = ax1 - ay1 + c - 1, si = ar; // b - b >>> 31
 ar = pass af;
 sr = lshift si by -31(lo);
 sr = sr or ashift ar by -31(hi);
 ax0 = si;
 ax1 = ar;
 ay0 = sr0;
 ar = ax0 xor ay0, ay1 = sr1;
 af = ax1 xor ay1, ay0 = ar;
 ax0 = dm(i2, m2);
 ar = ax0 - ay0, ax1 = dm(i2, m3);
 af = ax1 - af + c - 1;
 if ge jump ctcss_power_verify;
 nop;
 nop;
 jump ctcss_term;
 nop;
 dm(i0, m1) = 0;

ctcss_power_verify: i2 = ^ctcss_power_buffer;
 i3 = ^ctcss_temp_signal;

 si = dm(i2, m2);
 ar = dm(i2, m2);
 sr = lshift si by 3(lo);
 sr = sr or lshift ar by 3(hi);
 ay0 = sr0;
 ay1 = sr1;
 ax0 = dm(i3, m2);
 ar = ax0 - ay0, ax1 = dm(i3, m2);
 af = ax1 - ay1 + c - 1, si = dm(i2, m2);
 if lt jump ctcss_term;
 nop;
 nop;

 ar = dm(i2, m2);
 sr = lshift si by 3(lo);
 sr = sr or lshift ar by 3(hi);
 ay0 = sr0;
 ay1 = sr1;
 ax0 = dm(i3, m2);
 ar = ax0 - ay0, ax1 = dm(i3, m2);
 af = ax1 - ay1 + c - 1, si = dm(i2, m2);
 if lt jump ctcss_term;
 nop;
 nop;
 
 ar = dm(i2, m2);
 sr = lshift si by 3(lo);
 sr = sr or lshift ar by 3(hi);
 ay0 = sr0;
 ay1 = sr1;
 ax0 = dm(i3, m2);
 ar = ax0 - ay0, ax1 = dm(i3, m2);
 af = ax1 - ay1 + c - 1;
 if lt jump ctcss_term;
 nop;
 nop;
 dm(i0, m1) = 0;

#endif

ctcss_term: i0 = ^CTCSS_STAT;
 si = dm(i0, m1);
 sr = lshift si by 3(lo);
 ar = dm(CR15);
 ay0 = 0xfff7;
 ar = ar and ay0;
 ar = ar or sr0;
 dm(CR15) = ar;

_CTCSS_Decoder_II.end: rts;
 ax0 = 0;
 dm(squelch_event_trigger) = ax0;

.endmod;
