.pmrom0;
.module/ram/abs;

$_init_Sel_Call_Decoder: m0 = 1;
 i1 = ^analysis_buffer;
 cntr = 128;
 do clr_sel_buffer until ce;
 clr_sel_buffer: dm(i1, m0) = 0;

 i1 = ^freq_esti;
 dm(i1, m0) = 0x0000;
 dm(i1, m0) = 0x00c8;

_init_Sel_Call_Decoder.end: rts;
 i1 = ^sel_flag;
 dm(i1, m0) = 0;

$_Sel_Call_Decoder:
 i1 = ^analysis_buffer;
 i2 = ^analysis_buffer + 64;
 m1 = 0;
 m2 = 1;
 m3 = -1;
 dis m_mode;

 cntr = 64;
 do memcpy_loop until ce;
 ax0 = dm(i2, m2);
 memcpy_loop: dm(i1, m2) = ax0;

 cntr = 64;
 do new_mcpy until ce;
 ax0 = dm(i0, m2);
 new_mcpy: dm(i1, m2) = ax0;

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

 i0 = ^analysis_buffer;
 i1 = ^fft_buffer;
 sr0 = dm(i0, m2); // sr0 = x[0]
 cntr = 128;
 do hann_mul until ce;
 my0 = dm(i1, m1); // my0 = coeff[i]
 mr = sr0 * my0(ss), sr0 = dm(i0, m2);
 hann_mul: dm(i1, m2) = mr1;

 sb = -16;
 i0 = ^fft_buffer;
 cntr = 128;
 do sel_agc until ce;
 si = dm(i0, m2);
 sel_agc: sb = expadj si;

 se = sb;
 i0 = ^fft_buffer;
 cntr = 128;
 do sel_alc until ce;
 si = dm(i0, m1);
 sr = norm si(lo);
 sel_alc: dm(i0, m2) = sr0;

 i0 = ^freq_esti;
 ax0 = dm(i0, m2);
 ax1 = dm(i0, m3);

 ay0 = 0x0000;
 ay1 = 0x03e8;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 if lt jump Label_T;
 ay0 = 0x0000;
 ay1 = 0x0bb8;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 if ge jump Label_T;
 ay0 = 0x0000;
 ay1 = 0x07d0;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1, ax0 = ar;

 i1 = ^angle_table;
 call _cordic;
 ar = pass af;
 ax1 = ar;

 i0 = ^vector;
 ax0 = dm(i0, m2);
 ar = -ax0, ax1 = dm(i0, m3);
 af = -ax1, dm(i0, m2) = ar;
 jump Label_U;
 ar = pass af;
 dm(i0, m3) = ar;

Label_T: call _cordic;
 i1 = ^angle_table;
 nop;

Label_U: ena m_mode;
 i0 = ^R_Data;
 i1 = ^vector;
 mx0 = dm(i1, m2);
 mx1 = dm(i1, m3);

 dm(i0, m2) = 16384;
 dm(i0, m3) = mx0;
 i0 = ^I_Data;
 dm(i0, m2) = 4096;
 si = mx0;
 sr = ashift si by -1(lo); // vector[0] >> 1
 dm(i0, m3) = sr0;

 i0 = ^fft_buffer;
 i1 = ^sum_A;
 ar = 16384; // R_Data[0]
 my0 = dm(i0, m2); // my0 = data_input[0];
 mr = ar * my0(ss), my1 = dm(i0, m2); // my1 = data_input[1]
 mr = mr + mx0 * my1(ss);
 se = sb;
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi); // >> (-sb)
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -7(lo);
 sr = sr or ashift mr1 by -7(hi);
 dm(i1, m2) = sr0;
 dm(i1, m3) = sr1;
 
 i1 = ^sum_B;
 mr = mx1 * my1(ss);
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -9(lo);
 sr = sr or ashift mr1 by -9(hi);
 dm(i1, m2) = sr0;
 dm(i1, m3) = sr1;
 
 i1 = ^sum_A;
 i2 = ^R_Data;
 i3 = ^I_Data;
 cntr = 126;
 do CTFT_Loop until ce;
 se = -13;
 my0 = dm(i2, m2); // my0 = R_Data[0]
 my1 = dm(i2, m3); // my1 = R_Data[1]
 mr = mx0 * my1(ss); // my1 = R_Data[1]
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
 ay0 = dm(i1, m2); // sum_A.L
 ar = sr0 + ay0, ay1 = dm(i1, m3); // ay1 = sum_A.H
 af = sr1 + ay1 + c, dm(i1, m2) = ar;
 ar = pass af;
 dm(i1, m3) = ar;
 
 se = -13;
 ay0 = dm(i3, m2); // ay0 = I_Data[0]
 my1 = dm(i3, m3); // my1 = I_Data[1]
 mr = mx0 * my1(ss), dm(i3, m2) = my1;
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi);
 ar = sr0 - ay0; // ar = I
 mr = mx1 * my1(ss), dm(i3, m3) = ar; // I_Data[1] = I
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
 i1 = ^sum_B;
 ay0 = dm(i1, m2);
 ar = sr0 + ay0, ay1 = dm(i1, m3);
 af = sr1 + ay1 + c, dm(i1, m2) = ar;
 ar = pass af;
 dm(i1, m3) = ar;
 CTFT_Loop: i1 = ^sum_A;

 i1 = ^temp_signal;
 i2 = ^temp_signal + 2;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m3);
 dm(i1, m2) = ax0;
 dm(i1, m2) = ax1;

 se = sb;
 i0 = ^fft_buffer;
 si = dm(i0, m2);
 ay0 = 0; // temp_signal[1] = 0
 ay1 = 0;
 af = pass 0;
 cntr = 128;
 do cal_power until ce;
 sr = ashift si(lo);
 ar = pass af, my0 = sr0;
 mr = sr0 * my0(ss), ay1 = ar;
 sr = lshift mr0 by -7(lo);
 sr = sr or ashift mr1 by -7(hi);
 ar = sr0 + ay0, si = dm(i0, m2);
 cal_power: af = sr1 + ay1 + c, ay0 = ar;

 dm(i1, m2) = ay0;

 call _rfft_128;
 i0 = ^fft_buffer;
 dm(i1, m2) = ay1;

 i1 = ^data_power + 2; // i1 = (Word32 *)&data_power[1]
 i2 = ^rfft_out + 2; // i2 = (Word16 *)&rfft_out[2]
 mx0 = dm(i2, m2); // real
 my0 = mx0;
 cntr = 63;
 do sel_power until ce;
 mr = mx0 * my0(ss), mx1 = dm(i2, m2); // imag
 my1 = mx1;
 mr = mr + mx1 * my1(ss), mx0 = dm(i2, m2);
 my0 = mx0;
 dm(GPR13) = mr0;
 dm(GPR14) = mr1;
 dm(i1, m2) = mr0;
 sel_power: dm(i1, m2) = mr1;
 
 i1 = ^data_power;
 i2 = ^rfft_out; // DC
 mx0 = dm(i2, m2);
 my0 = mx0;
 mr = mx0 * my0(ss);
 dm(i1, m2) = mr0;
 dm(i1, m3) = mr1;

 i1 = ^data_power + 128; // Nyquist
 mx0 = dm(i2, m3);
 my0 = mx0;
 mr = mx0 * my0(ss);
 dm(i1, m2) = mr0;
 dm(i1, m3) = mr1;

 i1 = ^data_power + 2;
 i2 = i1;
 ay0 = dm(i1, m2);
 ay1 = dm(i1, m2); // Max_value
 ax0 = dm(i1, m2); // ax0 = data_power[2].L
 cntr = 54;
 do sel_search_peak until ce;
 ar = ax0 - ay0, ax1 = dm(i1, m2);
 af = ax1 - ay1 + c - 1;
 if lt jump sel_search_peak; // gt may be judged eq
 nop;
 nop;
 ay0 = ax0;
 ay1 = ax1;
 i2 = i1;
 sel_search_peak: ax0 = dm(i1, m2);

 ar = ^data_power + 2;
 ay0 = i2;
 af = ar - ay0;
 if eq jump Label_P;
 nop;
 nop;
 modify(i2, m3);
 modify(i2, m3);

Label_P: ay0 = ^data_power;
 ar = i2;
 ar = ar - ay0;
 sr = ashift ar by -1(lo); // sr0 = Max_idx
 ar = pass sr0;
 i5 = i4;
 dm(i4, m4) = ar;

 i1 = ^data_power;
 i2 = ^data_power;
 sr = lshift ar by 1(lo);
 ar = sr0 - 2;
 m0 = ar;
 modify(i1, m0);
 ax0 = dm(i1, m2);
 ax1 = dm(i1, m3);
 ar = sr0 + 2;
 m0 = ar;
 modify(i2, m0);
 ay0 = dm(i2, m2);
 ar = ax0 - ay0, ay1 = dm(i2, m3);
 ar = ax1 - ay1 + c - 1, mr1 = sr0;
 my1 = ar; // sign bits, if(my1 > 0), delta < 0
 ar = i2;
 ay0 = i1;
 if ge ar = pass ay0;

 i3 = ar;
 call _Sqrt_32;
 ax0 = dm(i3, m2);
 ax1 = dm(i3, m3);
 
 sr = lshift ar by 1(lo); // 2*q
 mx0 = sr0; // 2*q
 mx1 = ar; // q
 m0 = mr1;
 i3 = ^data_power;
 modify(i3, m0);
 
 call _Sqrt_32;
 ax0 = dm(i3, m2);
 ax1 = dm(i3, m3);
 
 ax0 = mx0;
 ay0 = ar;
 ar = ax0 - ay0, ax1 = mx1;
 sr = ashift ar by 14(lo);
 ar = ax1 + ay0;
 af = pass sr1, ay0 = sr0; // ay0 = denom
 if ge jump Label_S;
 nop;
 nop;
 //ax0 = 0;
 //ax1 = 0;
 //mx0 = ar;
 //ar = ax0 - ay0;
 //af = ax1 - af + c - 1;
 //ar = mx0;

Label_S: divs af, ar;
 divq ar; divq ar; divq ar; divq ar;
 divq ar; divq ar; divq ar; divq ar;
 divq ar; divq ar; divq ar; divq ar;
 divq ar; divq ar; divq ar; divq ar;
 //af = pass sr1, ar = ay0;
 //if lt ar = -ar;
 //ay0 = ar;

 ar = my1;
 af = pass ar;
 ar = ay0;
 if ge ar = -ar; // delta
 m5 = -1;
 modify(i4, m5);
 mx0 = dm(i5, m4);
 my0 = 125;
 mr = mx0 * my0(ss);
 sr = ashift mr0 by 14(lo);
 sr = sr or ashift mr1 by 14(hi);
 mr0 = sr0;
 mr1 = sr1;
 mr = mr + ar * my0(ss);

 //i0 = _debug_buffer;
 i1 = ^Freq_buffer;
 i2 = ^Freq_buffer + 2;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m2);
 dm(i1, m2) = ax0;
 dm(i1, m2) = ax1;
 dm(GPR13) = ax0;
 dm(GPR14) = ax1;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m3);
 dm(i1, m2) = ax0;
 dm(i1, m2) = ax1;
 dm(GPR13) = ax0;
 dm(GPR14) = ax1;

 dm(i1, m2) = mr0;
 dm(i1, m3) = mr1;
 //dm(i0, m2) = mr0;
 //dm(i0, m3) = mr1;
 dm(GPR13) = mr0;
 dm(GPR14) = mr1;

 i1 = ^Freq_buffer;
 ay0 = dm(i1, m2);
 ay1 = dm(i1, m2); // Freq_buffer[0]
 ax0 = dm(i1, m2);
 cntr = 2;
 do search_sel_max until ce;
 ar = ax0 - ay0, ax1 = dm(i1, m2); // Freq_buffer[1]
 af = ax1 - ay1 + c - 1;
 if lt jump search_sel_max;
 nop;
 nop;
 ay0 = ax0;
 ay1 = ax1;
 search_sel_max: ax0 = dm(i1, m2);
 
 i1 = ^Freq_max;
 dm(i1, m2) = ay0;
 dm(i1, m3) = ay1;

 i1 = ^Freq_buffer;
 ay0 = dm(i1, m2);
 ay1 = dm(i1, m2);
 ax0 = dm(i1, m2);
 cntr = 2;
 do search_sel_min until ce;
 ar = ax0 - ay0, ax1 = dm(i1, m2);
 af = ax1 - ay1 + c - 1;
 if ge jump search_sel_min;
 nop;
 nop;
 ay0 = ax0;
 ay1 = ax1;
 search_sel_min: ax0 = dm(i1, m2);

 i1 = ^Freq_min;
 dm(i1, m2) = ay0;
 dm(i1, m3) = ay1;

 ax0 = mr0;
 ax1 = mr1;
 ay0 = 0x0000;
 ay1 = 0x00c8;

 ar = mr0 - ay0;
 af = mr1 - ay1 + c - 1;
 if ge jump Label_Z;
 nop;
 nop;
 ax0 = 0x0000;
 ax1 = 0x00c8;

Label_Z: i1 = ^freq_esti;
 dm(i1, m2) = ax0;
 dm(i1, m3) = ax1;
 dm(GPR13) = ax0;
 dm(GPR14) = ax1;

 i1 = ^sum_A;
 i2 = ^sum_B;
 mr0 = dm(i1, m2);
 mr1 = dm(i1, m3);
 sr = lshift mr0 by -14(lo);
 sr = sr or ashift mr1 by -14(hi);
 my0 = sr0;
 mr = sr0 * my0(ss), si = dm(i2, m2);
 ar = dm(i2, m3);
 sr = lshift si by -12(lo);
 sr = sr or ashift ar by -12(hi);
 my1 = sr0;
 mr = mr + sr0 * my1(ss);

 i1 = ^Power_buffer + 2;
 i2 = ^Power_buffer;
 ax0 = dm(i1, m2);
 ax1 = dm(i1, m3);
 dm(i2, m2) = ax0;
 dm(i2, m2) = ax1;
 dm(i2, m2) = mr0;
 dm(i2, m2) = mr1;
 dm(GPR13) = mr0;
 dm(GPR14) = mr1;

 i1 = ^median_buffer;
 i2 = ^Freq_buffer;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m2);
 dm(i1, m2) = ax0;
 dm(i1, m2) = ax1;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m2);
 dm(i1, m2) = ax0;
 dm(i1, m2) = ax1;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m2);
 dm(i1, m2) = ax0;
 dm(i1, m2) = ax1;

 m0 = 2;
 i1 = ^median_buffer;
 i2 = ^median_buffer + 2;
 ax0 = dm(i1, m2);
 ax1 = dm(i1, m3); // a[0]
 ay0 = dm(i2, m2); // a[1]
 ar = ax0 - ay0, ay1 = dm(i2, m3);
 af = ax1 - ay1 + c - 1;
 if ge jump step_I;
 nop;
 nop;
 dm(i2, m2) = ax0;
 dm(i2, m3) = ax1;
 dm(i1, m2) = ay0;
 dm(i1, m3) = ay1;

step_I: modify(i1, m0);
 modify(i2, m0);
 ax0 = dm(i1, m2); // a[1]
 ax1 = dm(i1, m3);
 ay0 = dm(i2, m2); // a[2]
 ar = ax0 - ay0, ay1 = dm(i2, m3);
 af = ax1 - ay1 + c - 1;
 if ge jump step_II;
 nop;
 nop;
 dm(i2, m2) = ax0;
 dm(i2, m3) = ax1;
 dm(i1, m2) = ay0;
 dm(i1, m3) = ay1;

step_II: i1 = ^median_buffer;
 i2 = ^median_buffer + 2;
 ax0 = dm(i1, m2); // a[0]
 ax1 = dm(i1, m3);
 ay0 = dm(i2, m2); // a[1]
 ar = ax0 - ay0, ay1 = dm(i2, m3);
 af = ax1 - ay1 + c - 1;
 if ge jump step_III;
 nop;
 nop;
 dm(i2, m2) = ax0;
 dm(i2, m3) = ax1;
 dm(i1, m2) = ay0;
 dm(i1, m3) = ay1;

step_III: //i1 = _debug_buffer;
 i2 = ^median_buffer + 2; // Freq_Out
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m3);
 //dm(i1, m2) = ax0;
 //dm(i1, m3) = ax1;
 dm(GPR13) = ax0;
 dm(GPR14) = ax1;

 i1 = ^Power_buffer;
 i2 = ^temp_signal;
 ax0 = dm(sel_flag);
 af = pass ax0;
 if ne jump case_II;
 nop;
 nop;

case_I: si = dm(i1, m2); // Power_buffer[0].L
 ar = dm(i1, m2); // Power_buffer[0].H
 sr = lshift si by 2(lo);
 sr = sr or ashift ar by 2(hi);
 ay0 = dm(i2, m2); // temp_signal[0].L
 ar = sr0 - ay0, ay1 = dm(i2, m2); // temp_signal[0].H
 af = sr1 - ay1 + c - 1;
 if lt jump func_exit;
 ar = abs sr0;
 ay0 = ar, ar = abs sr1;
 af = ar + ay0;
 if eq jump func_exit;
 nop;
 nop;

 si = dm(i1, m2); // P.L
 ar = dm(i1, m2); // P.H
 sr = lshift si by 2(lo);
 sr = sr or ashift ar by 2(hi);
 ay0 = dm(i2, m2);
 i3 = ^Freq_max;
 ar = sr0 - ay0, ay1 = dm(i2, m2);
 af = sr1 - ay1 + c - 1, ax0 = dm(i3, m2);
 if lt jump func_exit;
 ar = abs sr0;
 ay0 = ar, ar = abs sr1;
 af = ar + ay0;
 if eq jump func_exit;
 nop;
 nop;

 ax1 = dm(i3, m3);
 i3 = ^Freq_min;
 ay0 = dm(i3, m2);
 ar = ax0 - ay0, ay1 = dm(i3, m3);
 af = ax1 - ay1 + c - 1, ay0 = ar; // {af, ay0}
 ax0 = 0x0000;
 ax1 = 0x000a;
 ar = ax0 - ay0;
 af = ax1 - af + c - 1;
 if lt jump func_exit;
 nop;
 nop;
 i1 = ^sel_flag;
 dm(i1, m2) = 0x0001;

 //i0 = _debug_buffer;
 i1 = ^median_buffer + 2;
 ax0 = dm(i1, m2);
 ax1 = dm(i1, m3);
 //dm(i0, m2) = ax0;
 //dm(i0, m3) = ax1;
 
 jump func_exit;
 dm(GPR13) = ax0;
 dm(GPR14) = ax1;

case_II: i3 = ^Freq_max;
 ax0 = dm(i3, m2);
 ax1 = dm(i3, m3);
 i3 = ^Freq_min;
 ay0 = dm(i3, m2);
 ar = ax0 - ay0, ay1 = dm(i3, m2);
 af = ax1 - ay1 + c - 1, ay0 = ar;
 ax0 = 0x0000;
 ax1 = 0x000a;
 ar = ax0 - ay0;
 af = ax1 - af + c - 1;
 if ge jump step_IV;
 nop;
 nop;
 jump func_exit;
 i1 = ^sel_flag;
 dm(i1, m1) = 0;

step_IV: si = dm(i1, m2); // Power_buffer[0].L
 ar = dm(i1, m2); // Power_buffer[0].H
 sr = lshift si by 3(lo);
 sr = sr or ashift ar by 3(hi);
 ay0 = dm(i2, m2); // temp_signal[0].L
 ar = sr0 - ay0, ay1 = dm(i2, m2); // temp_signal[0].H
 af = sr1 - ay1 + c - 1;
 if ge jump func_exit;
 nop;
 nop;
 
 si = dm(i1, m2); // Power_buffer[1].L
 ar = dm(i1, m2); // Power_buffer[1].H
 sr = lshift si by 3(lo);
 sr = sr or ashift ar by 3(hi);
 ay0 = dm(i2, m2); // temp_signal[1].L
 ar = sr0 - ay0, ay1 = dm(i2, m2); // temp_signal[1].H
 af = sr1 - ay1 + c - 1;
 if ge jump func_exit;
 nop;
 nop;
 i1 = ^sel_flag;
 dm(i1, m1) = 0;

func_exit: i1 = ^sel_flag;
 ax0 = dm(i1, m1);
 //i2 = _debug_buffer;
 //dm(i2, m2) = ax0;
 //dm(i2, m3) = 0;
 ar = dm(CR15);
 ay0 = 0xffef;
 ar = ar and ay0;
 af = pass ax0;
 ay1 = 0x0010;

_Sel_Call_Decoder.end: rts;
 if ne ar = ar or ay1;
 dm(CR15) = ar;

.endmod;
