.pmrom0;
.module/ram/abs;

$_init_DCS_Decoder: m0 = 1;
 i0 = ^Wctrl;
 dm(i0, m0) = 16240;
 i0 = ^Wcntrl;
 dm(i0, m0) = 278;
 i0 = ^NCO_Prev;
 dm(i0, m0) = 1;
 i0 = ^NCO_I_Prev;
 dm(i0, m0) = 1;
 ax0 = 0x0e37;
 dm(dcs_code_lwr) = ax0;
 ax0 = 0x0064;
 dm(dcs_code_upr) = ax0;

 i0 = ^fract_filt; // fractional interpolation
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
 dm(i0, m0) = 0;
 dm(i0, m0) = 32767;
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
 dm(i0, m0) = 248;
 dm(i0, m0) = -263;
 dm(i0, m0) = 283;
 dm(i0, m0) = -303;
 dm(i0, m0) = 329;
 dm(i0, m0) = -358;
 dm(i0, m0) = 394;
 dm(i0, m0) = -436;
 dm(i0, m0) = 491;
 dm(i0, m0) = -559;
 dm(i0, m0) = 652;
 dm(i0, m0) = -778;
 dm(i0, m0) = 968;
 dm(i0, m0) = -1276;
 dm(i0, m0) = 1878;
 dm(i0, m0) = -3547;
 dm(i0, m0) = 31932;
 dm(i0, m0) = 4562;
 dm(i0, m0) = -2128;
 dm(i0, m0) = 1388;
 dm(i0, m0) = -1029;
 dm(i0, m0) = 819;
 dm(i0, m0) = -678;
 dm(i0, m0) = 581;
 dm(i0, m0) = -506;
 dm(i0, m0) = 450;
 dm(i0, m0) = -403;
 dm(i0, m0) = 367;
 dm(i0, m0) = -335;
 dm(i0, m0) = 310;
 dm(i0, m0) = -287;
 dm(i0, m0) = 268;
 dm(i0, m0) = 454;
 dm(i0, m0) = -483;
 dm(i0, m0) = 518;
 dm(i0, m0) = -556;
 dm(i0, m0) = 602;
 dm(i0, m0) = -655;
 dm(i0, m0) = 720;
 dm(i0, m0) = -796;
 dm(i0, m0) = 894;
 dm(i0, m0) = -1016;
 dm(i0, m0) = 1180;
 dm(i0, m0) = -1404;
 dm(i0, m0) = 1735;
 dm(i0, m0) = -2268;
 dm(i0, m0) = 3278;
 dm(i0, m0) = -5899;
 dm(i0, m0) = 29502;
 dm(i0, m0) = 9834;
 dm(i0, m0) = -4214;
 dm(i0, m0) = 2682;
 dm(i0, m0) = -1966;
 dm(i0, m0) = 1553;
 dm(i0, m0) = -1282;
 dm(i0, m0) = 1093;
 dm(i0, m0) = -951;
 dm(i0, m0) = 843;
 dm(i0, m0) = -755;
 dm(i0, m0) = 686;
 dm(i0, m0) = -627;
 dm(i0, m0) = 578;
 dm(i0, m0) = -535;
 dm(i0, m0) = 500;
 dm(i0, m0) = 588;
 dm(i0, m0) = -626;
 dm(i0, m0) = 670;
 dm(i0, m0) = -719;
 dm(i0, m0) = 779;
 dm(i0, m0) = -846;
 dm(i0, m0) = 929;
 dm(i0, m0) = -1027;
 dm(i0, m0) = 1151;
 dm(i0, m0) = -1306;
 dm(i0, m0) = 1512;
 dm(i0, m0) = -1792;
 dm(i0, m0) = 2203;
 dm(i0, m0) = -2854;
 dm(i0, m0) = 4057;
 dm(i0, m0) = -7007;
 dm(i0, m0) = 25697;
 dm(i0, m0) = 15418;
 dm(i0, m0) = -5929;
 dm(i0, m0) = 3671;
 dm(i0, m0) = -2657;
 dm(i0, m0) = 2084;
 dm(i0, m0) = -1712;
 dm(i0, m0) = 1455;
 dm(i0, m0) = -1263;
 dm(i0, m0) = 1117;
 dm(i0, m0) = -1000;
 dm(i0, m0) = 907;
 dm(i0, m0) = -828;
 dm(i0, m0) = 763;
 dm(i0, m0) = -706;
 dm(i0, m0) = 659;
 dm(i0, m0) = 632;
 dm(i0, m0) = -672;
 dm(i0, m0) = 719;
 dm(i0, m0) = -772;
 dm(i0, m0) = 834;
 dm(i0, m0) = -906;
 dm(i0, m0) = 993;
 dm(i0, m0) = -1097;
 dm(i0, m0) = 1227;
 dm(i0, m0) = -1390;
 dm(i0, m0) = 1605;
 dm(i0, m0) = -1895;
 dm(i0, m0) = 2318;
 dm(i0, m0) = -2979;
 dm(i0, m0) = 4172;
 dm(i0, m0) = -6953;
 dm(i0, m0) = 20861;
 dm(i0, m0) = 20861;
 dm(i0, m0) = -6953;
 dm(i0, m0) = 4172;
 dm(i0, m0) = -2979;
 dm(i0, m0) = 2318;
 dm(i0, m0) = -1895;
 dm(i0, m0) = 1605;
 dm(i0, m0) = -1390;
 dm(i0, m0) = 1227;
 dm(i0, m0) = -1097;
 dm(i0, m0) = 993;
 dm(i0, m0) = -906;
 dm(i0, m0) = 834;
 dm(i0, m0) = -772;
 dm(i0, m0) = 719;
 dm(i0, m0) = 580;
 dm(i0, m0) = -616;
 dm(i0, m0) = 659;
 dm(i0, m0) = -706;
 dm(i0, m0) = 763;
 dm(i0, m0) = -828;
 dm(i0, m0) = 907;
 dm(i0, m0) = -1000;
 dm(i0, m0) = 1117;
 dm(i0, m0) = -1263;
 dm(i0, m0) = 1455;
 dm(i0, m0) = -1712;
 dm(i0, m0) = 2084;
 dm(i0, m0) = -2657;
 dm(i0, m0) = 3671;
 dm(i0, m0) = -5929;
 dm(i0, m0) = 15418;
 dm(i0, m0) = 25697;
 dm(i0, m0) = -7007;
 dm(i0, m0) = 4057;
 dm(i0, m0) = -2854;
 dm(i0, m0) = 2203;
 dm(i0, m0) = -1792;
 dm(i0, m0) = 1512;
 dm(i0, m0) = -1306;
 dm(i0, m0) = 1151;
 dm(i0, m0) = -1027;
 dm(i0, m0) = 929;
 dm(i0, m0) = -846;
 dm(i0, m0) = 779;
 dm(i0, m0) = -719;
 dm(i0, m0) = 670;
 dm(i0, m0) = 440;
 dm(i0, m0) = -467;
 dm(i0, m0) = 500;
 dm(i0, m0) = -535;
 dm(i0, m0) = 578;
 dm(i0, m0) = -627;
 dm(i0, m0) = 686;
 dm(i0, m0) = -755;
 dm(i0, m0) = 843;
 dm(i0, m0) = -951;
 dm(i0, m0) = 1093;
 dm(i0, m0) = -1282;
 dm(i0, m0) = 1553;
 dm(i0, m0) = -1966;
 dm(i0, m0) = 2682;
 dm(i0, m0) = -4214;
 dm(i0, m0) = 9834;
 dm(i0, m0) = 29502;
 dm(i0, m0) = -5899;
 dm(i0, m0) = 3278;
 dm(i0, m0) = -2268;
 dm(i0, m0) = 1735;
 dm(i0, m0) = -1404;
 dm(i0, m0) = 1180;
 dm(i0, m0) = -1016;
 dm(i0, m0) = 894;
 dm(i0, m0) = -796;
 dm(i0, m0) = 720;
 dm(i0, m0) = -655;
 dm(i0, m0) = 602;
 dm(i0, m0) = -556;
 dm(i0, m0) = 518;
 dm(i0, m0) = 237;
 dm(i0, m0) = -250;
 dm(i0, m0) = 268;
 dm(i0, m0) = -287;
 dm(i0, m0) = 310;
 dm(i0, m0) = -335;
 dm(i0, m0) = 367;
 dm(i0, m0) = -403;
 dm(i0, m0) = 450;
 dm(i0, m0) = -506;
 dm(i0, m0) = 581;
 dm(i0, m0) = -678;
 dm(i0, m0) = 819;
 dm(i0, m0) = -1029;
 dm(i0, m0) = 1388;
 dm(i0, m0) = -2128;
 dm(i0, m0) = 4562;
 dm(i0, m0) = 31932;
 dm(i0, m0) = -3547;
 dm(i0, m0) = 1878;
 dm(i0, m0) = -1276;
 dm(i0, m0) = 968;
 dm(i0, m0) = -778;
 dm(i0, m0) = 652;
 dm(i0, m0) = -559;
 dm(i0, m0) = 491;
 dm(i0, m0) = -436;
 dm(i0, m0) = 394;
 dm(i0, m0) = -358;
 dm(i0, m0) = 329;
 dm(i0, m0) = -303;
 dm(i0, m0) = 283;
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
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 32767;
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
 
 i0 = ^dcs_stat;
 dm(i0, m0) = 0;
 i0 = ^dcs_temp_buffer;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 
 i0 = ^dcs_power_buffer;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;
 dm(i0, m0) = 0;

_init_DCS_Decoder.end: rts;
 i0 = ^NCO_II_Prev;
 dm(i0, m0) = 8192;

$_DCS_Decoder:
 m1 = 0;
 m2 = 1;
 m3 = -1;
 m5 = -1;

 cntr = 64;
 do dcs_loop until ce;
 //ax0 = dm(Wctrl);
 //dm(i6, m4) = ax0;

 i1 = ^NRZ_Buffer;
 i2 = ^NRZ_Buffer + 1;
 cntr = 31;
 do dcs_cpy until ce;
 ax0 = dm(i2, m2);
 dcs_cpy: dm(i1, m2) = ax0;

 ax0 = dm(i0, m2); // NRZ_Buffer[31] = data_buffer[i]
 ar = dm(NCO_Prev);
 ay0 = dm(Wctrl);
 si = ar, ar = ar - ay0; // si = NCO_Prev
 if ge jump NCO_ADJ;
 dm(i1, m2) = ax0;
 dm(i4, m4) = ar; // [sp++] = NCO, sp[0] = NCO

 sr = lshift si by 15(lo); // sr[1:0] = NCO_Prev << 15
 mr0 = sr0;
 mr1 = sr1;
 ar = ay0;
 call div_32_32;
 sr = ashift ar by -16(lo); // sr1 = 16{Wctrl[15]}
 ay1 = sr1;

 si = mx0; // quotients
 ay0 = 8;
 sr = lshift si by -12(lo);
 si = sr0, af = sr0 - ay0; // si = uk[15:12], 0:1:15
 if ge jump method_d; // default
 ay0 = ^fract_filt;
 sr = lshift si by 5(lo); // * 32wrds
 jump intpr;
 ar = sr0 + ay0;
 i1 = ar;

method_d: i1 = ^fract_filt + 256;

intpr: i2 = ^NRZ_Buffer; // sinc filter
 mr = 0;
 mx0 = dm(i2, m2); // nrz_buffer[0]
 my0 = dm(i1, m2); // h_intp[0]
 dis m_mode;
 cntr = 32;
 do intp_filt until ce;
 mr = mr + mx0 * my0(ss), my0 = dm(i1, m2);
 intp_filt: mx0 = dm(i2, m2);

 i2 = ^match_filt_buffer;
 i3 = ^match_filt_buffer + 1; // not exploiting circular buffers
 cntr = 58;
 do mf_mem_move until ce;
 ax0 = dm(i3, m2);
 mf_mem_move: dm(i2, m2) = ax0;

 af = pass mr1;
 ar = -1;
 if ge ar = pass 1;
 dm(i2, m2) = ar; // match_filter_buffer[58] = (mr>=0)?1: -1;

 i3 = ^match_filt_buffer;
 ar = 0; // mr
 ay0 = dm(i3, m2);
 cntr = 59;
 do mf_filt until ce;
 mf_filt: ar = ar + ay0, ay0 = dm(i3, m2);

 ay0 = dm(match_filt_data); // mfd[n-1]
 my0 = ar, ar = ar - ay0; // my0 = mr, ar = jwMF(jw);
 ax1 = dm(NCO_I_Prev);
 ay1 = dm(Wcntrl);
 mx0 = ar, ar = ax1 - ay1; // mx0 = mfd
 if ge jump Step_II;
 dm(match_filt_data) = my0;
 dm(i4, m4) = ar; // [sp++] = NCO_I, sp[1] = NCO_I

 ena m_mode;
 my1 = 0x022b;
 mr = mx0 * my0(ss); // sign(mfd * mf)
 af = pass mr0;
 if eq ar = pass 0;
 if lt ar = pass -1;
 if gt ar = pass 1; // ar = sign(mfd * mf)

 mr = ar * my1(ss);
 ax0 = 0x8123;
 ax1 = 0x0000;
 ay0 = mr0;
 ar = ax0 - ay0, ay1 = mr1;
 ay0 = ar, ar = ax1 - ay1 + c - 1;
 ay1 = ar;
 call div_32_32;
 mr0 = 0x0000;
 mr1 = 0x2000;
 dm(Wctrl) = mx0;

Step_II: ax0 = dm(NCO_II_Prev);
 ay0 = dm(Wcntrl);
 ar = ax0 - ay0;
 if ge jump Step_III;
 dm(i4, m4) = ar; // [sp++] = NCO_II, sp[2] = NCO_II
 nop;

 i2 = ^dcs_buffer;
 i3 = ^dcs_buffer + 1;
 cntr = 22;
 do dcs_fifo until ce;
 ax0 = dm(i3, m2);
 dcs_fifo: dm(i2, m2) = ax0;

 ar = dm(match_filt_data);
 //ay0 = 10;
 //af = ar - ay0;
 //if lt jump proc_i;
 af = 0x000a - ar;
 if gt jump proc_i;
 nop;
 nop;
 dm(i2, m2) = 1;
 ax0 = 0x1234;
 dm(GPR14) = ax0;
 ax0 = 1;
 dm(GPR14) = ax0;

 ax0 = 23;
 dm(cntr_dcs) = ax0;
 call dcs_code_check;
 ax0 = dm(dcs_code_lwr);
 ax1 = dm(dcs_code_upr);

 jump Step_III;
 nop;
 nop;

proc_i: //ay0 = -10;
 //af = ar - ay0;
 af = 0x000a + ar;
 if ge jump proc_ii;
 nop;
 nop;
 dm(i2, m2) = -1;
 ax0 = 0x1234;
 dm(GPR14) = ax0;
 ax0 = -1;
 dm(GPR14) = ax0;

 ax0 = 23;
 dm(cntr_dcs) = ax0;
 call dcs_code_check;
 ax0 = dm(dcs_code_lwr);
 ax1 = dm(dcs_code_upr);

 jump Step_III;
 nop;
 nop;

proc_ii: dm(i2, m2) = 10; // unknown
 ax0 = 0x1234;
 dm(GPR14) = ax0;
 ax0 = 10;
 dm(GPR14) = ax0;

 ax0 = 23;
 dm(cntr_dcs) = ax0;
 call dcs_code_check;
 ax0 = dm(dcs_code_lwr);
 ax1 = dm(dcs_code_upr);

Step_III:
 modify(i4, m5); // sp-=1
 //ar = dm(i4, m6); // NCO_II
 m5 = 0;
 ar = dm(i4, m5);
 m5 = -1;
 af = pass ar;
 if ge jump Step_IV;
 nop;
 nop;
 //ar = ar + 16384;
 ay1 = 16384;
 ar = ar + ay1;

Step_IV: dm(NCO_II_Prev) = ar;
 modify(i4, m5); // sp-=1
 //ar = dm(i4, m6); // NCO_I
 m5 = 0;
 ar = dm(i4, m5);
 m5 = -1;
 af = pass ar;
 dm(NCO_I_Prev) = ar;
 if ge jump NCO_ADJ;
 nop;
 nop;
 //ar = ar + 16384;
 ay1 = 16384;
 ar = ar + ay1;
 dm(NCO_I_Prev) = ar;

NCO_ADJ: modify(i4, m5); // sp-=1
 //ar = dm(i4, m6); // m6 = 0;
 m5 = 0;
 ar = dm(i4, m5);
 m5 = -1;
 af = pass ar;
 if ge jump dcs_loop_0;
 nop;
 nop;
 //ar = ar + 16384;
 ay1 = 16384;
 jump NCO_ADJ;
 ar = ar + ay1;
 dm(i4, m4) = ar; // update NCO

dcs_loop_0:
 ax0 = dm(dcs_event);
 ax0 = dm(CR15);
 ay0 = 0xfffb;
 mx0 = ar, ar = ax0 and ay0;
 si = dm(dcs_event);
 sr = lshift si by 2(lo);
 ar = sr0 or ar;
 dm(CR15) = ar;
 //dm(i6, m4) = ax0;
 dcs_loop: dm(NCO_Prev) = mx0;

_DCS_Decoder.end: rts;

dcs_code_check:
 ar = 0; // mr = 0;
 si = 0x0001;
 i3 = ^dcs_buffer; // 23-bit
 cntr = 23; // ax[1:0] = dcs_wrd
 do dcs_dist until ce;
 sr0 = 23;
 ay0 = cntr; // ay0 = 23-j
 mr0 = ar, ar = sr0 - ay0; // ar = j
 se = ar; // se = j
 sr = lshift si(lo); // 1 << j, sr[1:0] = 1 << j
 //ay0 = sr0; // ay[1:0] = 1 << j
 //ar = ax0 and ay0, ay1 = sr1;
 ar = ax0 and sr0, ay1 = sr1;
 if ne jump mr_acc_i; // bit 1
 nop;
 //nop;
 af = ax1 and ay1;
 if ne jump mr_acc_i; // bit 1
 nop;
 nop;
 ay0 = dm(i3, m2); // dcs_buffer[j]
 ar = ay0 + 1; // dcs_buffer[j]+1
 //ar = abs ar;
 //ay0 = ar;
 //ar = mr0 + ay0; // mr+=abs(dcs_buffer[j]+1)
 jump dcs_dist;
 ar = abs ar;
 ar = mr0 + ar;

mr_acc_i: ay0 = dm(i3, m2);
 ar = ay0 - 1; // dcs_buffer[j]-1
 ar = abs ar;
 //ay0 = ar;
 //ar = mr0 + ay0; // mr+=abs(dcs_buffer[j]-1)
 ar = mr0 + ar;
 dcs_dist: mr0 = ar;

 //ay0 = 7; // mr < 7??
 //af = ar - ay0;
 af = 0x0007 - ar;
 //if lt jump dcs_term_func; // find dcs
 if gt jump dcs_term_func;
 //nop;
 //nop;

 si = ax0; // dcs_wrd
 ar = ax1;
 sr = lshift si by 1(lo);
 sr = sr or lshift ar by 1(hi);
 ay1 = 0x0040;
 af = ax1 and ay1, ar = sr0;
 //if ne ar = ar or 1; // {sr1, ar}
 ay1 = 0x0001;
 if ne ar = ar or ay1;

 ax0 = ar;
 ax1 = sr1;
 ay0 = 0xffff;
 ay1 = 0x007f;
 ar = ax0 and ay0;
 ax0 = ar, ar = ax1 and ay1;
 ax1 = ar;

 ar = dm(cntr_dcs);
 ar = ar - 1;
 //dm(cntr_dcs) = ar;
 if ge jump dcs_code_check;
 dm(cntr_dcs) = ar;
 dm(cntr_dcs) = ar;

 // dcs not found
 jump dcs_code_check.end;
 ax0 = 0;
 dm(dcs_event) = ax0;

dcs_term_func: ax0 = 1;
 dm(dcs_event) = ax0;

dcs_code_check.end: rts;

$_DCS_Turn_Off_Detector:
 m1 = 0;
 m2 = 1;
 m3 = -1;
 m5 = -1;
 dis m_mode;

 //i1 = ^In_buffer + 64;
 //i2 = ^In_buffer;
 //cntr = 64;
 //do dcs_turn_memmove until ce;
 //ax0 = dm(i1, m2);
 //dcs_turn_memmove: dm(i2, m2) = ax0;

 //cntr = 64;
 //do dcs_turn_memcpy until ce;
 //ax0 = dm(i0, m2);
 //dcs_turn_memcpy: dm(i2, m2) = ax0;

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
 mx0 = dm(i0, m2);
 my0 = dm(i1, m1);
 cntr = 128;
 do hann_windowing until ce;
 mr = mx0 * my0(ss), mx0 = dm(i0, m2);
 dm(i1, m2) = mr1;
 hann_windowing: my0 = dm(i1, m1);

 i1 = ^dcs_ACC;
 dm(i1, m2) = 0;
 dm(i1, m3) = 0;
 i2 = ^sum_A;
 dm(i2, m2) = 0;
 dm(i2, m3) = 0;
 i3 = ^sum_B;
 dm(i3, m2) = 0;
 dm(i3, m3) = 0;
 dm(i4, m4) = 0; // Q.L
 dm(i4, m5) = 0; // Q.H

 i5 = ^fft_buffer;
 ena m_mode;
 se = -14;
 cntr = 128;
 do dtft_loop until ce;
 i1 = ^dcs_ACC;
 call _oscillator_core;
 ax0 = dm(i1, m2); // ACC.L
 ax1 = dm(i1, m3); // ACC.H
 i0 = ^vector;
 mx0 = dm(i0, m2); // mx0 = cos(2*pi*134.4*n/2000)
 my0 = dm(i5, m4); // my0 = Signal_In[n]
 //dm(i6, m4) = mx0;
 mr = mx0 * my0(ss), ay0 = dm(i2, m2);
 sr = lshift mr0(lo), ay1 = dm(i2, m3);
 sr = sr or ashift mr1(hi), mx1 = dm(i0, m3); // mx1 = sin(2*pi*134.4*n/2000)
 ar = sr0 + ay0;
 dm(i2, m2) = ar, ar = sr1 + ay1 + c;
 mr = mx1 * my0(ss), dm(i2, m3) = ar;
 sr = lshift mr0(lo), ay0 = dm(i3, m2);
 sr = sr or ashift mr1(hi), ay1 = dm(i3, m3);
 ar = sr0 + ay0, mx0 = my0;
 dm(i3, m2) = ar, ar = sr1 + ay1 + c;
 mr = mx0 * my0(ss), dm(i3, m3) = ar;
 sr = lshift mr0 by -7(lo);
 sr = sr or ashift mr1 by -7(hi);
 ay0 = dm(i4, m4); // Q.L
 ar = sr0 + ay0, ay1 = dm(i4, m5);
 dm(i4, m4) = ar, ar = sr1 + ay1 + c;
 dm(i4, m5) = ar;
 i1 = ^dcs_ACC;
 ay0 = 0x04ea;
 ay1 = 0x1134;
 ax0 = dm(i1, m2); // ACC.L
 ar = ax0 + ay0, ax1 = dm(i1, m3); // ax1 = ACC.H
 dm(i1, m2) = ar, ar = ax1 + ay1 + c; // ACC.L
 dtft_loop: dm(i1, m3) = ar;

 si = dm(i2, m2);
 ar = dm(i2, m3);
 sr = lshift si by -7(lo);
 sr = sr or ashift ar by -7(hi);
 my0 = sr0;
 mr = sr0 * my0(ss), si = dm(i3, m2);
 ar = dm(i3, m3);
 sr = lshift si by -7(lo);
 sr = sr or ashift ar by -7(hi);
 my1 = sr0;
 i1 = ^dcs_power_buffer;
 i2 = ^dcs_power_buffer + 2;
 mr = mr + sr0 * my1(ss), ax0 = dm(i2, m2);
 //dm(i6, m4) = mr0;
 //dm(i6, m4) = mr1;
 ax1 = dm(i2, m2);
 dm(i1, m2) = ax0;
 dm(i1, m2) = ax1;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m2);
 dm(i1, m2) = ax0;
 dm(i1, m2) = ax1;
 dm(i1, m2) = mr0;
 dm(i1, m3) = mr1;
 i1 = ^dcs_temp_buffer;
 i2 = ^dcs_temp_buffer + 2;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m2);
 dm(i1, m2) = ax0;
 dm(i1, m2) = ax1;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m2);
 dm(i1, m2) = ax0;
 dm(i1, m2) = ax1;
 ax0 = dm(i4, m4);
 ax1 = dm(i4, m5);
 dm(i1, m2) = ax0;
 dm(i1, m3) = ax1;
 //dm(GPR13) = ax0;
 //dm(GPR14) = ax1;

 ar = dm(dcs_stat);
 af = pass ar;
 if ne jump dcs_case_i;
 i2 = ^dcs_power_buffer;
 i3 = ^dcs_temp_buffer;

 si = dm(i2, m2); // power_buffer[0].L
 ar = dm(i2, m2); // power_buffer[0].H
 ax0 = si;
 ax1 = ar;
 sr = lshift si by 3(lo);
 sr = sr or ashift ar by 3(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -3(lo);
 sr = sr or ashift mr1 by -3(hi);
 ay0 = sr0;
 ar = ax0 - ay0, ay1 = sr1;
 if ne jump sat_32_32;
 nop;
 af = ax1 - ay1 + c - 1;
 if ne jump sat_32_32;
 af = ax1 - ay1 + c - 1;
 af = ax1 - ay1 + c - 1;

 jump cproc_i;

sat_32_32: sr = lshift si by -31(lo);
 sr = sr or ashift ar by -31(hi); // get sign sr[1:0]
 ay0 = 0xffff;
 ay1 = 0x7fff;
 ar = sr0 xor ay0;
 mr0 = ar, ar = sr1 xor ay1;
 mr1 = ar;

cproc_i: ay0 = dm(i3, m2);
 ar = mr0 - ay0, ay1 = dm(i3, m2);
 af = mr1 - ay1 + c - 1, si = dm(i2, m2);
 if lt jump dcs_turn_term;
 ar = abs mr0;
 ay0 = ar, ar = abs mr1;
 af = ar + ay0;
 if eq jump dcs_turn_term;

 ar = dm(i2, m2);
 ax0 = si;
 ax1 = ar;
 sr = lshift si by 3(lo);
 sr = sr or ashift ar by 3(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -3(lo);
 sr = sr or ashift mr1 by -3(hi);
 ay0 = sr0;
 ar = ax0 - ay0, ay1 = sr1;
 if ne jump sat_32_32_i;
 nop;
 af = ax1 - ay1 + c - 1;
 if ne jump sat_32_32_i;
 af = ax1 - ay1 + c - 1;
 af = ax1 - ay1 + c - 1;

 jump cproc_ii;

sat_32_32_i: sr = lshift si by -31(lo);
 sr = sr or ashift ar by -31(hi);
 ay0 = 0xffff;
 ay1 = 0x7fff;
 ar = sr0 xor ay0;
 mr0 = ar, ar = sr1 xor ay1;
 mr1 = ar;

cproc_ii: ay0 = dm(i3, m2);
 ar = mr0 - ay0, ay1 = dm(i3, m2);
 af = mr1 - ay1 + c - 1, si = dm(i2, m2);
 if lt jump dcs_turn_term;
 ar = abs mr0;
 ay0 = ar, ar = abs mr1;
 af = ar + ay0;
 if eq jump dcs_turn_term;

 ar = dm(i2, m2);
 ax0 = si;
 ax1 = ar;
 sr = lshift si by 3(lo);
 sr = sr or ashift ar by 3(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -3(lo);
 sr = sr or ashift mr1 by -3(hi);
 ay0 = sr0;
 ar = ax0 - ay0, ay1 = sr1;
 if ne jump sat_32_32_ii;
 nop;
 af = ax1 - ay1 + c - 1;
 if ne jump sat_32_32_ii;
 af = ax1 - ay1 + c - 1;
 af = ax1 - ay1 + c - 1;

 jump cproc_iii;

sat_32_32_ii: sr = lshift si by -31(lo);
 sr = sr or ashift ar by -31(hi);
 ay0 = 0xffff;
 ay1 = 0x7fff;
 ar = sr0 xor ay0;
 mr0 = ar, ar = ax1 xor ay1;
 mr1 = ar;

cproc_iii: ay0 = dm(i3, m2);
 ar = mr0 - ay0, ay1 = dm(i3, m2);
 af = mr1 - ay1 + c - 1;
 if lt jump dcs_turn_term;
 ar = abs mr0;
 ay0 = ar, ar = abs mr1;
 af = ar + ay0;
 if eq jump dcs_turn_term;
 nop;

 ax0 = 0x0001;
 dm(dcs_stat) = ax0;
 jump dcs_turn_term;

dcs_case_i: si = dm(i2, m2);
 ar = dm(i2, m2);
 ax0 = si;
 ax1 = ar;
 sr = lshift si by 4(lo);
 sr = sr or ashift ar by 4(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -4(lo);
 sr = sr or ashift mr1 by -4(hi);
 ay0 = sr0;
 ar = ax0 - ay0, ay1 = sr1;
 if ne jump sat_32_32_iii;
 nop;
 af = ax1 - ay1 + c - 1;
 if ne jump sat_32_32_iii;
 af = ax1 - ay1 + c - 1;
 af = ax1 - ay1 + c - 1;

 jump proc_iv;

sat_32_32_iii: sr = lshift si by -31(lo);
 sr = sr or ashift ar by -31(hi);
 ay0 = 0xffff;
 ay1 = 0x7fff;
 ar = sr0 xor ay0;
 mr0 = ar, ar = ax1 xor ay1;
 mr1 = ar;

proc_iv: ay0 = dm(i3, m2);
 ar = mr0 - ay0, ay1 = dm(i3, m2);
 af = mr1 - ay1 + c - 1, si = dm(i2, m2);
 if lt jump dcs_case_i_end;
 
 ar = dm(i2, m2);
 ax0 = si;
 ax1 = ar;
 sr = lshift si by 4(lo);
 sr = sr or ashift ar by 4(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -4(lo);
 sr = sr or ashift mr1 by -4(hi);
 ay0 = sr0;
 ar = ax0 - ay0, ay1 = sr1;
 if ne jump sat_32_32_iv;
 nop;
 af = ax1 - ay1 + c - 1;
 if ne jump sat_32_32_iv;
 af = ax1 - ay1 + c - 1;
 af = ax1 - ay1 + c - 1;

 jump proc_v;

sat_32_32_iv: sr = lshift si by -31(lo);
 sr = sr or ashift ar by -31(hi);
 ay0 = 0xffff;
 ay1 = 0x7fff;
 ar = sr0 xor ay0;
 mr0 = ar, ar = ax1 xor ay1;
 mr1 = ar;

proc_v: ay0 = dm(i3, m2);
 ar = mr0 - ay0, ay1 = dm(i3, m2);
 af = mr1 - ay1 + c - 1, si = dm(i2, m2);
 if lt jump dcs_case_i_end;
 
 ar = dm(i2, m2);
 ax0 = si;
 ax1 = ar;
 sr = lshift si by 4(lo);
 sr = sr or ashift ar by 4(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -4(lo);
 sr = sr or ashift mr1 by -4(hi);
 ay0 = sr0;
 ar = ax0 - ay0, ay1 = sr1;
 if ne jump sat_32_32_vi;
 nop;
 af = ax1 - ay1 + c - 1;
 if ne jump sat_32_32_vi;
 af = ax1 - ay1 + c - 1;
 af = ax1 - ay1 + c - 1;
 
 jump proc_vi;

sat_32_32_vi: sr = lshift si by -31(lo);
 sr = sr or ashift ar by -31(hi);
 ay0 = 0xffff;
 ay1 = 0x7fff;
 ar = sr0 xor ay0;
 mr0 = ar, ar = ax1 xor ay1;
 mr1 = ar;

proc_vi: ay0 = dm(i3, m2);
 ar = mr0 - ay0, ay1 = dm(i3, m2);
 af = mr1 - ay1 + c - 1;
 if ge jump dcs_turn_term;
 nop;

dcs_case_i_end: ax0 = 0x0000;
 dm(dcs_stat) = ax0;

dcs_turn_term: ax0 = dm(dcs_stat);
 //dm(i6, m4) = ax0;

_DCS_Turn_Off_Detector.end: ar = dm(CR15);
 ay0 = 0xfffd;
 af = ar and ay0;
 si = dm(dcs_stat);
 sr = lshift si by 1(lo); // CR15[1]
 rts;
 ar = sr0 or af;
 dm(CR15) = ar;

.endmod;
