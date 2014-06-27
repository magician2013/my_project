.pmrom0;
.module/ram/abs;
#define BITREV_FLAG
//#define SCRAM_FLAG
.entry DTMF_Decoder;
.entry init_DTMF_Decoder;

$_cfft_radix_2_2:
 m3 = -1;
 ar = m5;
 dm(i4, m4) = ar;
 ar = i5;
 dm(i4, m4) = ar;
 m5 = -1;
 se = -1;
 dis m_mode;

// i1: &a[j]
// i2: &a[j+Nmr]
// i3: &a[j+2*Nmr]
// i5: &a[j+3*Nmr]

 i1 = i0;
 m0 = 32;
 i2 = i1;
 modify(i2, m0);
 i3 = i2;
 modify(i3, m0);
 i5 = i3;
 m5 = m0;
 modify(i5, m5);
 m5 = -1;
 ax0 = 16;

 cntr = 16; // Stage I
 do Grouping_First until ce;

 ay0 = cntr;
 ar = ax0 - ay0; // j
 sr = lshift ar by 1(lo);
 dm(table_index) = sr0;

BFLYING_First:
 si = dm(i1, m2); // si = a[k].real
 sr = ashift si(lo), si = dm(i1, m3); // si = a[k].imag
 ay0 = sr0, sr = ashift si(lo); // ay0 = a[k].real / 2
 ay1 = sr0; // ay1 = a[k].imag / 2
 si = dm(i3, m2);
 sr = ashift si(lo); // sr0 = a[k+2*Nmr].real / 2
 ar = sr0 + ay0, si = dm(i3, m3);
 ax0 = sr0, sr = ashift si(lo); // ax0 = a[k+2*Nmr].real
 dm(i1, m2) = ar, ar = sr0 + ay1;
 dm(i1, m3) = ar, ar = ay0 - ax0;
 dm(i3, m2) = ar, ar = ay1 - sr0;
 si = dm(i2, m2);
 sr = ashift si(lo), dm(i3, m3) = ar;
 si = dm(i2, m3);

 ay0 = sr0, sr = ashift si(lo); // ay0 = a[k+Nmr].real
 si = dm(i5, m4);

 ay1 = sr0, sr = ashift si(lo); // ay1 = a[k+Nmr].imag
 ar = sr0 + ay0, si = dm(i5, m5);

 ax0 = sr0, sr = ashift si(lo); // sr0 = a[k+3*Nmr].imag
 dm(i2, m2) = ar, ar = sr0 + ay1;
 dm(i2, m3) = ar, ar = ay0 - ax0; // a[k+Nmr].real - a[k+3*Nmr].real
 si = ar;
 dm(i5, m4) = ar, ar = ay1 - sr0;
 dm(i5, m5) = ar, sr = ashift ar(lo);
 ay1 = sr0, sr = ashift si(lo); // d[0].real, ay1 = d[0].imag
 si = dm(i3, m2); // c[0].real
 ay0 = sr0, sr = ashift si(lo); // d[0].real, ay0 = d[0].real
 ar = sr0 + ay1, si = dm(i3, m3);
 ax0 = sr0, sr = ashift si(lo); // c[0].imag
 dm(i3, m2) = ar, ar = sr0 - ay0;
 dm(i3, m3) = ar, ar = ax0 - ay1; // c[0].real - d[0].imag
 dm(i5, m4) = ar, ar = sr0 + ay0;

 si = dm(i2, m2); // b[0].real
 sr = ashift si(lo), dm(i5, m5) = ar;
 si = dm(i1, m2);

 ay0 = sr0, sr = ashift si(lo); // ay0 = b[0].real
 ar = sr0 + ay0, si = dm(i2, m3); // b[0].imag
 ax0 = sr0, sr = ashift si(lo); // ax0 = a[0].real
 si = dm(i1, m3); 
 ay1 = sr0, sr = ashift si(lo); // ay1 = b[0].imag

 dm(i1, m2) = ar, ar = sr0 + ay1;
 dm(i1, m2) = ar, ar = ax0 - ay0;

 dm(i2, m2) = ar, ar = sr0 - ay1;
 dm(i2, m3) = ar;
 ay0 = i1;

 m0 = dm(table_index);
 i1 = ^TWD_FACT;
 modify(i1, m0); // TWD_FACT[N]
 mx0 = dm(i3, m2); // c[k].real
 mx1 = dm(i3, m3); // c[k].imag
 my0 = dm(i1, m2);
 mr = mx0 * my0(ss), my1 = dm(i1, m3);
 mr = mr - mx1 * my1(ss); // [sp++] = &d[0]
 dm(i3, m2) = mr1, mr = mx0 * my1(ss);
 mr = mr + mx1 * my0(ss), mx0 = dm(i2, m2); // mx0 = b[0].real
 modify(i1, m0);
 my0 = dm(i1, m2); // TWD[2*N].real
 dm(i3, m2) = mr1, mr = mx0 * my0(ss);
 mx1 = dm(i2, m3);
 my1 = dm(i1, m3); // TWD[2*N].imag

 mr = mr - mx1 * my1(ss);
 dm(i2, m2) = mr1, mr = mx0 * my1(ss);
 modify(i1, m0);
 mr = mr + mx1 * my0(ss), my0 = dm(i1, m2);
 my1 = dm(i1, m3);
 dm(i2, m2) = mr1;

 i1 = ay0;
 mx0 = dm(i5, m4);
 mr = mx0 * my0(ss), mx1 = dm(i5, m5);

 mr = mr - mx1 * my1(ss);
 dm(i5, m4) = mr1, mr = mx0 * my1(ss);
 mr = mr + mx1 * my0(ss); // ar = k
 dm(i5, m4) = mr1;

 Grouping_First: ax0 = 0x0010;

// Middle Stages
 ay0 = 0x0002;
 cntr = 1;
 do Stage_Pipe until ce;
 ar = cntr;
 ar = ar - ay0; // 0, -1, -2
 sr = ashift ar by 1(lo); // 1, 1/4, 1/16
 se = sr0;
 si = 16;
 sr = ashift si(lo), ar = se; // sr0 = Nmr
 dm(cntr_Nmr) = sr0;
 si = 0x0001;
 ar = -ar;
 se = ar;
 sr = lshift si(lo);
 dm(cntr_Nmr_inv) = sr0;
 se = -1;

 cntr = dm(cntr_Nmr); // Stage I
 do Grouping until ce;

 ar = cntr;
 ar = ar - 1;
 dm(Node_Cntr) = ar; // Nmr-1
 i1 = i0; // &a[0]
 sr = lshift ar by 1(lo); // 2*k
 m0 = sr0;
 modify(i1, m0); // &a[k]
 ar = cntr; // ar = j
 ar = ar - 1; // j
 my0 = dm(cntr_Nmr_inv);
 mr = ar * my0(ss);
 dm(table_index) = mr0;

// i1: &a[j]
// i2: &a[j+Nmr]
// i3: &a[j+2*Nmr]
// i5: &a[j+3*Nmr]
 i2 = i1;
 si = dm(cntr_Nmr);
 sr = lshift si by 1(lo); // 1*Nmr
 m0 = sr0;
 modify(i2, m0);
 i3 = i2;
 modify(i3, m0); // 2*Nmr
 i5 = i3;
 m5 = m0;
 modify(i5, m5); // 3*Nmr
 m5 = -1;

BFLYING: //i1 = i0; // &a[0]
 //ar = dm(Node_Cntr); // k
 //sr = lshift ar by 1(lo); // 2*k
 //m0 = sr0;
 //modify(i1, m0); // &a[k]
 si = dm(i1, m2); // si = a[k].real
 sr = ashift si(lo), si = dm(i1, m3); // si = a[k].imag
 ay0 = sr0, sr = ashift si(lo); // ay0 = a[k].real / 2
 ay1 = sr0; // ay1 = a[k].imag / 2
 si = dm(i3, m2);
 sr = ashift si(lo); // sr0 = a[k+2*Nmr].real / 2
 ar = sr0 + ay0, si = dm(i3, m3);
 ax0 = sr0, sr = ashift si(lo); // ax0 = a[k+2*Nmr].real
 dm(i1, m2) = ar, ar = sr0 + ay1;
 dm(i1, m3) = ar, ar = ay0 - ax0;
 dm(i3, m2) = ar, ar = ay1 - sr0;
 si = dm(i2, m2);
 sr = ashift si(lo), dm(i3, m3) = ar;
 si = dm(i2, m3);

 ay0 = sr0, sr = ashift si(lo); // ay0 = a[k+Nmr].real
 si = dm(i5, m4);

 ay1 = sr0, sr = ashift si(lo); // ay1 = a[k+Nmr].imag
 ar = sr0 + ay0, si = dm(i5, m5);

 ax0 = sr0, sr = ashift si(lo); // sr0 = a[k+3*Nmr].imag
 dm(i2, m2) = ar, ar = sr0 + ay1;
 dm(i2, m3) = ar, ar = ay0 - ax0; // a[k+Nmr].real - a[k+3*Nmr].real
 si = ar;
 dm(i5, m4) = ar, ar = ay1 - sr0;
 dm(i5, m5) = ar, sr = ashift ar(lo);

 ay1 = sr0, sr = ashift si(lo); // d[0].real, ay1 = d[0].imag
 si = dm(i3, m2); // c[0].real
 ay0 = sr0, sr = ashift si(lo); // d[0].real, ay0 = d[0].real
 ar = sr0 + ay1, si = dm(i3, m3);
 ax0 = sr0, sr = ashift si(lo); // c[0].imag
 dm(i3, m2) = ar, ar = sr0 - ay0;
 dm(i3, m3) = ar, ar = ax0 - ay1; // c[0].real - d[0].imag
 dm(i5, m4) = ar, ar = sr0 + ay0;

 si = dm(i2, m2); // b[0].real
 sr = ashift si(lo), dm(i5, m5) = ar;
 si = dm(i1, m2);

 ay0 = sr0, sr = ashift si(lo); // ay0 = b[0].real
 ar = sr0 + ay0, si = dm(i2, m3); // b[0].imag
 ax0 = sr0, sr = ashift si(lo); // ax0 = a[0].real
 si = dm(i1, m3); 
 ay1 = sr0, sr = ashift si(lo); // ay1 = b[0].imag
 dm(i1, m2) = ar, ar = sr0 + ay1;
 dm(i1, m3) = ar, ar = ax0 - ay0;

 dm(i2, m2) = ar, ar = sr0 - ay1;
 dm(i2, m3) = ar;
 ay0 = i1;

 m0 = dm(table_index);
 i1 = ^TWD_FACT;
 modify(i1, m0); // TWD_FACT[N]
 mx0 = dm(i3, m2); // c[k].real
 mx1 = dm(i3, m3); // c[k].imag
 my0 = dm(i1, m2);
 mr = mx0 * my0(ss), my1 = dm(i1, m3);
 mr = mr - mx1 * my1(ss); // [sp++] = &d[0]
 dm(i3, m2) = mr1, mr = mx0 * my1(ss);
 mr = mr + mx1 * my0(ss), mx0 = dm(i2, m2); // mx0 = b[0].real
 modify(i1, m0);
 my0 = dm(i1, m2); // TWD[2*N].real
 dm(i3, m3) = mr1, mr = mx0 * my0(ss);
 mx1 = dm(i2, m3);
 my1 = dm(i1, m3); // TWD[2*N].imag

 mr = mr - mx1 * my1(ss);
 dm(i2, m2) = mr1, mr = mx0 * my1(ss);
 modify(i1, m0);
 mr = mr + mx1 * my0(ss), my0 = dm(i1, m2);
 my1 = dm(i1, m3);
 dm(i2, m3) = mr1;
 i1 = ay0;
 mx0 = dm(i5, m4);
 mr = mx0 * my0(ss), mx1 = dm(i5, m5);

 si = dm(cntr_Nmr);
 sr = ashift si by 2(lo); // 4*Nmr
 mr = mr - mx1 * my1(ss), ay0 = sr0;
 dm(i5, m4) = mr1, mr = mx0 * my1(ss);

 mr = mr + mx1 * my0(ss); // ar = k
 ar = dm(Node_Cntr);
 ar = ar + ay0, dm(i5, m5) = mr1;
 dm(Node_Cntr) = ar;
 af = ar - 64;
 sr = lshift sr0 by 1(lo);
 m0 = sr0;
 m5 = sr0;
 modify(i1, m0);
 modify(i2, m0);
 modify(i3, m0);
 if lt jump BFLYING;
 modify(i5, m5);
 m5 = -1;

 Grouping: i1 = i0;
 nop;
 nop;

 Stage_Pipe: ay0 = 0x0002;

 m0 = 2;
 i1 = i0; // &a[0]
 i2 = i1;
 modify(i2, m0);
 i3 = i2;
 modify(i3, m0);
 i5 = i3;
 modify(i5, m4);
 modify(i5, m4);

 cntr = 16;
 do BFLYING_LAST until ce;
 si = dm(i1, m2); // si = a[k].real
 sr = ashift si(lo), si = dm(i1, m3); // si = a[k].imag
 ay0 = sr0, sr = ashift si(lo); // ay0 = a[k].real / 2
 ay1 = sr0; // ay1 = a[k].imag / 2
 si = dm(i3, m2);

 sr = ashift si(lo); // sr0 = a[k+2*Nmr].real / 2
 ar = sr0 + ay0, si = dm(i3, m3);
 ax0 = sr0, sr = ashift si(lo); // ax0 = a[k+2*Nmr].real
 dm(i1, m2) = ar, ar = sr0 + ay1;
 dm(i1, m3) = ar, ar = ay0 - ax0;
 dm(i3, m2) = ar, ar = ay1 - sr0;
 //m0 = 32;
 si = dm(i2, m2);
 sr = ashift si(lo), dm(i3, m3) = ar;
 si = dm(i2, m3);

 ay0 = sr0, sr = ashift si(lo); // ay0 = a[k+Nmr].real
 si = dm(i5, m4);

 ay1 = sr0, sr = ashift si(lo); // ay1 = a[k+Nmr].imag
 ar = sr0 + ay0, si = dm(i5, m5);

 ax0 = sr0, sr = ashift si(lo); // sr0 = a[k+3*Nmr].imag
 dm(i2, m2) = ar, ar = sr0 + ay1;
 dm(i2, m3) = ar, ar = ay0 - ax0; // a[k+Nmr].real - a[k+3*Nmr].real
 si = ar;
 dm(i5, m4) = ar, ar = ay1 - sr0;
 dm(i5, m5) = ar, sr = ashift ar(lo);

 ay1 = sr0, sr = ashift si(lo); // d[0].real, ay1 = d[0].imag
 si = dm(i3, m2); // c[0].real
 ay0 = sr0, sr = ashift si(lo); // d[0].real, ay0 = d[0].real
 ar = sr0 + ay1, si = dm(i3, m3);
 ax0 = sr0, sr = ashift si(lo); // c[0].imag
 dm(i3, m2) = ar, ar = sr0 - ay0;
 dm(i3, m3) = ar, ar = ax0 - ay1; // c[0].real - d[0].imag
 dm(i5, m4) = ar, ar = sr0 + ay0;

 si = dm(i2, m2); // b[0].real
 sr = ashift si(lo), dm(i5, m5) = ar;
 si = dm(i1, m2);

 ay0 = sr0, sr = ashift si(lo); // ay0 = b[0].real
 ar = sr0 + ay0, si = dm(i2, m3); // b[0].imag
 ax0 = sr0, sr = ashift si(lo); // ax0 = a[0].real
 si = dm(i1, m3); 
 ay1 = sr0, sr = ashift si(lo); // ay1 = b[0].imag

 dm(i1, m2) = ar, ar = sr0 + ay1;
 dm(i1, m3) = ar, ar = ax0 - ay0;

 dm(i2, m2) = ar, ar = sr0 - ay1;
 dm(i2, m3) = ar;
 m0 = 0x0008;
 m5 = 0x0008;
 modify(i1, m0);
 modify(i2, m0);
 modify(i3, m0);
 modify(i5, m5);

BFLYING_LAST: m5 = -1;
 i1 = i0;
 i2 = ^rfft_out;
 i3 = ^rfft_out + 64;

 cntr = 64;
 do cfft_memmove until ce;
 ax0 = dm(i0, m2);
 ax1 = dm(i0, m2);
 dm(i2, m2) = ax0;
 cfft_memmove: dm(i3, m2) = ax1;

 i5 = i1;
 i2 = 0x0068; // rfft_out
 i3 = 0x00e8; // rfft_out + 64
 m0 = 256;
 imask = 0; // HW Bugs, Solved via Atomic Operations
 ena bit_rev;
 cntr = 64;
 do BIT_REVERSE until ce;
 ax0 = dm(i2, m0);
 ax1 = dm(i3, m0);
 dm(i5, m4) = ax0;
 BIT_REVERSE: dm(i5, m4) = ax1;
 i0 = i1;
 dis bit_rev;
 imask = 3;

 modify(i4, m5);
 ar = dm(i4, m5);
 i5 = ar;
 ar = dm(i4, m5);
 m5 = ar;

_cfft_radix_2_2.end: rts;
 modify(i4, m4);
 ena m_mode;

$_cfft_64: // i0 = &a[0]
 m3 = -1;
 ena m_mode; // set integer mode for complex multiplications

#ifdef BITREV_FLAG
 i1 = i0;
 i2 = ^rfft_out;
 i3 = ^rfft_out + 64;

 cntr = 64;
 do cfft_mem_cpy until ce;
 ax0 = dm(i0, m2); // real part
 ax1 = dm(i0, m2); // imag part
 dm(i2, m2) = ax0;
 cfft_mem_cpy: dm(i3, m2) = ax1;

 i5 = i1;
 i2 = 0x0068; // 0x0900, &rfft_out
 i3 = 0x00e8; // 0x0940, &rfft_out[64]
 m0 = 256; // 2^(14-6) = 256;
 ena bit_rev; // bit reverse mode
 cntr = 64;
 do brev_loop until ce;
 ax0 = dm(i2, m0);
 ax1 = dm(i3, m0);
 dm(i5, m4) = ax0;
 brev_loop: dm(i5, m4) = ax1;

 dis bit_rev;
 i0 = i1;
#endif

#ifdef SCRAM_FLAG
 ar = 0; // ar = i = 0
 se = 0x0001;
 cntr = 64;
 do scramble_loop until ce;
 i1 = ^bit_rev_table;
 m0 = ar;
 modify(i1, m0); // i1 = &bit_rev_table[i]
 ay0 = dm(i1, m1); // ay0 = j
 af = ar - ay0, si = ay0; // af = i-j
 if ge jump scramble_loop;
 i2 = i0; // i2 = &a[0]
 i3 = i0; // i3 = &a[0]
 sr = lshift ar(lo); // sr0 = 2*i
 m0 = sr0;
 modify(i2, m0); // i2 = &a[i]
 sr = lshift si(lo), ax0 = dm(i2, m1); // ax0 = a[i].real, sr0 = 2*j
 m0 = sr0;
 modify(i3, m0); // i3 = &a[j];
 ay0 = dm(i3, m1); // ay0 = a[j].real
 dm(i3, m2) = ax0; // a[j].real = a'[i].real
 dm(i2, m2) = ay0; // a[i].real = a'[j].real
 ax0 = dm(i2, m1); // ax0 = a[i].imag
 ay0 = dm(i3, m1); // ay0 = a[j].imag
 dm(i3, m1) = ax0; // a[j].imag = a'[i].imag
 dm(i2, m1) = ay0; // a[i].imag = a'[j].imag
 scramble_loop: ar = ar + 1;
#endif

 cntr = 6; // for 64-point Radix-2 DFT
 si = 0x0002;
 do Stage_Loop until ce;
 ay0 = cntr;
 ar = 0x0006 - ay0;
 se = ar;
 sr = lshift si(lo); // sr0 = Nmr = 2 << m
 dm(cntr_Nmr) = sr0;
 ax0 = 0x0000;
 dm(cntr_group) = ax0; // j = 0

Group_Loop: // ax0 = dm(cntr_group); // ax0 = j
 dm(cntr_bfly) = ax0; // k = j

Bfly_Loop: si = dm(cntr_Nmr); // si = Nmr
 sr = ashift si by -1(lo); // sr0 = Nmr/2
 ar = dm(cntr_bfly); // ar = k
 si = sr0; // si = Nmr/2
 sr = lshift ar by 1(lo); // sr0 = 2*k
 i2 = i0; // i2 = &a[0]
 m0 = sr0; // m0 = 2*k
 modify(i2, m0); // i2 = &a[k]
 i3 = i2; // i3 = &a[k]
 //ax0 = dm(i2, m2); // ax0 = a[k].real
 //ax1 = dm(i2, m3); // ax1 = a[k].imag
 sr = lshift si by 1(lo); // sr0 = (Nmr/2) * 2
 m0 = sr0;
 modify(i3, m0); // i3 = &a[k+Nmr/2]
 my0 = dm(i3, m2); // my0 = a[k+Nmr/2].real
 //my1 = dm(i3, m3); // my1 = a[k+Nmr/2].imag
 i1 = ^TWD_FACT_128;
 si = dm(cntr_group); // si = j
 se = cntr; // ar = m
 sr = lshift si(lo), my1 = dm(i3, m3); // sr0 = 2^(6-m) * j
 sr = lshift sr0 by 1(lo); // sr0 *= 2, dual real and imag pairs
 m0 = sr0; // for TWD_FACT_128
 modify(i1, m0); // i1 = &TWD_FACT[2*j*2^(5-m)];
 mx0 = dm(i1, m2); // mx0 = TWD_FACT[2*j*2^(5-m)].real;
 mr = mx0 * my0(ss), mx1 = dm(i1, m1); // mx1 = TWD_FACT[2*j*2^(5-m)].imag;
 //mr = mr - mx1 * my1(ss), si = ax0; // mr1 = TWD * a[k+Nmr/2], si = a[k].real
 mr = mr - mx1 * my1(ss), si = dm(i2, m2);
 ay0 = mr1, mr = mx0 * my1(ss); // ay0 = real(TWD * a[k+Nmr/2])

 sr = ashift si by -1(lo);
 //mr = mr + mx1 * my0(ss), si = ax1; // mr1 = imag(TWD * a[k+Nmr/2]), si = a[k].imag
 mr = mr + mx1 * my0(ss), si = dm(i2, m3);
 //ax1 = sr0;
 //ar = ax0 + ay0, ay1 = mr1; // ar = a[k].real + real(TWD * a[k+Nmr/2])
 ar = sr0 + ay0, ax0 = sr0;
 sr = ashift si by -1(lo);

 dm(i2, m2) = ar, ar = sr0 + mr1; // ar = a[k].imag + imag(TWD * a[k+Nmr/2])
 dm(i2, m1) = ar, ar = ax0 - ay0;
 dm(i3, m2) = ar, ar = sr0 - mr1;

 ax1 = dm(cntr_bfly); // ax1 = k
 ay1 = dm(cntr_Nmr);

 dm(i3, m1) = ar, ar = ax1 + ay1;

 dm(cntr_bfly) = ar; // k+=Nmr
 af = ar - 64;
 if lt jump Bfly_Loop;

 ar = dm(cntr_group); // ar = j
 si = dm(cntr_Nmr);
 ar = ar + 1;
 //dm(cntr_group) = ar;
 sr = ashift si by -1(lo);
 //af = ar - sr0;
 af = ar - sr0, ax0 = ar;
 if lt jump Group_Loop;
 dm(cntr_group) = ar;
 ax0 = dm(cntr_group); // ax0 = j
 Stage_Loop: si = 0x0002;

_cfft_64.end: rts;
 ax0 = 0x0006;
 ax0 = 0x0006;

$_rfft_128: // i0 = &a[0]
 //call _cfft_64;
 call _cfft_radix_2_2;
 m1 = 0;
 m2 = 1;

 se = -1;
 cntr = 63;
 do rfft_loop until ce;
 ar = cntr; // ar = 64-i, i = 63:-1:1 ??
 sr = lshift ar by 1(lo); // sr0 = 2*ar
 i2 = i0; // i2 = &cfft_buffer[0]
 m0 = sr0; // m0 = 2*ar
 modify(i2, m0); // i2 = &cfft_buffer[(64-i)%64]
 ar = ar - 64;
 ar = -ar, ay0 = dm(i2, m2); // ar = i, ay0 = cfft_buffer[(64-i)%64].real
 ay1 = dm(i2, m3); // ay1 = cfft_buffer[(64-i)%64].imag
 sr = lshift ar by 1(lo); // sr0 = 2*i
 m0 = sr0; // m0 = ar*2
 i3 = i0; // i3 = &cfft_buffer[0]
 modify(i3, m0); // i3 = &cfft_buffer[i]

 ax0 = dm(i3, m2); // ax0 = cfft_buffer[i].real
 ar = ax0 + ay0, ax1 = dm(i3, m3); // ax1 = cfft_buffer[i].imag;
 sr = ashift ar(lo);
 ar = ax1 - ay1, mx0 = sr0; // mx0 = cfft_even[i].real
 sr = ashift ar(lo);
 ar = ax1 + ay1, mx1 = sr0; // mx1 = cfft_even[i].imag
 sr = ashift ar(lo);
 ar = ax0 - ay0, my0 = sr0; // my0 = cfft_odd[i].real
 ar = -ar;
 sr = ashift ar(lo);
 my1 = sr0; // my1 = cfft_odd[i].imag
 
 i1 = ^TWD_FACT_128;
 ar = cntr;
 ar = ar - 64; // ar = i
 ar = -ar, si = mx0;
 sr = ashift si(lo), si = mx1; // sr0 = even >> 1

 //sr = ashift si(lo), ax0 = sr0; // ax0 = cfft_even[i].real
 //ax0 = sr0; // ax0 = even.real >> 1
 ax0 = sr0, sr = ashift si(lo);

 ax1 = sr0; // ax1 = even.imag >> 1
 sr = lshift ar by 1(lo); // sr0 = 2*i
 m0 = sr0;
 modify(i1, m0); // i1 = &TWD_FACT_128
 mx0 = dm(i1, m2); // mx0 = TWD_FACT_128[i].real
 mr = mx0 * my0(ss), mx1 = dm(i1, m3); // mx1 = TWD_FACT_128[i].imag
 mr = mr - mx1 * my1(ss); // mr1 = real(TWD_FACT[i]*cfft_odd[i])
 
 //mr = mx0 * my1(ss), ay0 = mr1;
 //ay0 = mr1; // ay0 = complex_mult(cfft_buffer_odd[i], TWD_FACT_128[i])
 ay0 = mr1, mr = mx0 * my1(ss);
 
 mr = mr + mx1 * my0(ss); // mr1 = imag(TWD_FACT[i]*cfft_odd[i])
 i3 = ^rfft_out; // output_buffer
 modify(i3, m0);
 ar = ax0 + ay0, ay1 = mr1; // ar = cfft_buffer[i].real

 //ar = ax1 + ay1, dm(i3, m2) = ar; // ar = cfft_buffer[i].imag
 //dm(i3, m2) = ar;
 dm(i3, m2) = ar, ar = ax1 + ay1;
 
 rfft_loop: dm(i3, m3) = ar;
 
 i1 = i0; // fft_buffer
 i2 = ^rfft_out;
 ax0 = dm(i1, m2); // cfft_buffer[0].real
 ay0 = dm(i1, m3); // cfft_buffer[0].imag
 ar = ax0 - ay0;
 sr = ashift ar by -1(lo); // sr0 = cfft_buffer[0].imag
 ar = ax0 + ay0, si = sr0;
 sr = ashift ar by -1(lo);

_rfft_128.end: rts;
 dm(i2, m2) = sr0;
 dm(i2, m3) = si;

$_Sqrt_32: // ax[1:0] as remainder input
 ar = 0; // ar = q = 0
 mr0 = 0x8000; // unsigned 32768

 cntr = 16;
 do Sqrt_Loop until ce;
 sr0 = ar; // sr0 = q
 ar = cntr; // N
 ar = ar - 1; // N-=1
 se = ar;
 ar = sr0;
 sr = lshift ar by 1(lo); // sr[1:0] = 2*q(32 bits)
 af = pass ar, ay0 = mr0; // af = q
 ar = sr0 + ay0; // ar = temp[15:0]
 //si = ar; // si = temp[15:0]
 //ay0 = 0;
 si = ar, ar = sr1 + c; // ar = temp[31:16]
 sr = lshift si(lo);
 sr = sr or lshift ar(hi);
 ay0 = sr0; // sr = temp << N
 ar = ax0 - ay0, ay1 = sr1;
 //si = ar;
 si = ar, ar = ax1 - ay1 + c - 1;
 if lt jump Sqrt_Label;
 sr = lshift mr0 by -1(lo);
 sr = lshift mr0 by -1(lo);

 ax1 = ar; // ax[1:0] = remainder
 ar = pass af, ay0 = mr0; // ar = q[m-1]
 af = ar + ay0, ax0 = si; // af = q
Sqrt_Label: sr = lshift mr0 by -1(lo);
 Sqrt_Loop: ar = pass af, mr0 = sr0;

_Sqrt_32.end: rts;
 ar = pass af, mr0 = sr0;
 ar = pass af, mr0 = sr0;

$_cordic: i0 = ^vector; // assume m1 = 2, m2 = 1, m3 = -1
 dm(i0, m2) = 16384;
 dm(i0, m3) = 0; // ax[1:0] 32-bit input
 si = 32767;
 ay0 = 0;
 ay1 = 0;
 dis m_mode;
 //i1 = angle_table;

 cntr = 20;
 do cordic_loop until ce;
 mr0 = ax0;
 mr1 = ax1;
 sr = lshift mr0 by -31(lo);
 sr = sr or ashift mr1 by -31(hi);
 af = pass sr1, ar = si;
 mx1 = sr1; // sign bits
 if lt ar = -ar; // ar = factor
 sr0 = dm(i0, m2); // sr0 = vect[0]
 my0 = dm(i0, m3); // my0 = vect[1]
 mr = ar * my0(ss), my1 = sr0; // my1 = temp
 af = pass ar, ay0 = mr1; // af = factor
 ar = sr0 - ay0; // ar = new vect[0]
 //ar = pass af, dm(i0, m2) = ar;
 dm(i0, m2) = ar, ar = pass af;
 mr = ar * my1(ss), ay0 = my0;
 ar = mr1 + ay0;
 dm(i0, m3) = ar;
 //ay0 = dm(i1, m2);
 //ay1 = dm(i1, m2); // ay[1:0] = angle
 ar = mx1;
 af = pass ar;
 if eq jump Label_B;
 ay0 = dm(i1, m2);
 ay1 = dm(i1, m2); // ay[1:0] = angle
 ar = ax0 + ay0;
 //ar = ax1 + ay1 + c, ax0 = ar;
 jump Label_A;
 ax0 = ar, ar = ax1 + ay1 + c;
 ax1 = ar;

Label_B: ar = ax0 - ay0;
 //ar = ax1 - ay1 + c - 1, ax0 = ar;
 ax0 = ar, ar = ax1 - ay1 + c - 1;
 ax1 = ar;

Label_A: sr = ashift si by -1(lo); // poweroftwo
 cordic_loop: si = sr0;

 my0 = 19898;
 mx0 = dm(i0, m2);
 mr = mx0 * my0(ss), mx1 = dm(i0, m3);
 //mr = mx1 * my0(ss), dm(i0, m2) = mr1;

_cordic.end: rts;
 dm(i0, m2) = mr1, mr = mx1 * my0(ss);
 dm(i0, m3) = mr1;

$div_32_32: mx0 = 0; // q = mx0, r = mr[1:0], d = ay[1:0]
 si = 0x0001;
 i5 = i4;
 m5 = -1;
 dm(i4, m4) = mr0;
 dm(i4, m4) = mr1;

 cntr = 15;
 do div_32_32_loop until ce;
 ar = cntr;
 ar = ar - 1; // ar = N
 ar = -ar, mr0 = dm(i5, m4);
 se = ar;
 sr = lshift mr0(lo), mr1 = dm(i5, m5);
 sr = sr or ashift mr1(hi), mr0 = ay0;
 ar = sr0 - ay0, mr1 = ay1;
 af = sr1 - ay1 + c - 1;
 if lt jump div_32_32_loop;
 nop;
 nop;
 ar = cntr;
 ar = ar - 1;
 se = ar;
 sr = lshift mr0(lo), ax0 = dm(i5, m4);
 sr = sr or ashift mr1(hi), ax1 = dm(i5, m5); // d << N
 ay0 = sr0;
 ar = ax0 - ay0, ay1 = sr1;
 af = ax1 - ay1 + c - 1, dm(i5, m4) = ar;
 ar = pass af;
 dm(i5, m5) = ar;
 sr = lshift si(lo), ay0 = mx0;
 ar = sr0 + ay0, ay0 = mr0;
 mx0 = ar;
 div_32_32_loop: ay1 = mr1;
 i4 = i5;

div_32_32.end: rts;
 i4 = i5;
 i4 = i5;

$_init_DTMF_Decoder: m0 = 1;
 i0 = ^TWD_FACT_128;
 dm(i0, m0) = 32767;
 dm(i0, m0) = 0;
 dm(i0, m0) = 32727;
 dm(i0, m0) = -1607;
 dm(i0, m0) = 32609;
 dm(i0, m0) = -3211;
 dm(i0, m0) = 32412;
 dm(i0, m0) = -4808;
 dm(i0, m0) = 32137;
 dm(i0, m0) = -6392;
 dm(i0, m0) = 31785;
 dm(i0, m0) = -7961;
 dm(i0, m0) = 31356;
 dm(i0, m0) = -9512;
 dm(i0, m0) = 30851;
 dm(i0, m0) = -11039;
 dm(i0, m0) = 30272;
 dm(i0, m0) = -12539;
 dm(i0, m0) = 29621;
 dm(i0, m0) = -14010;
 dm(i0, m0) = 28897;
 dm(i0, m0) = -15446;
 dm(i0, m0) = 28105;
 dm(i0, m0) = -16846;
 dm(i0, m0) = 27244;
 dm(i0, m0) = -18204;
 dm(i0, m0) = 26318;
 dm(i0, m0) = -19519;
 dm(i0, m0) = 25329;
 dm(i0, m0) = -20787;
 dm(i0, m0) = 24278;
 dm(i0, m0) = -22005;
 dm(i0, m0) = 23169;
 dm(i0, m0) = -23170;
 dm(i0, m0) = 22004;
 dm(i0, m0) = -24279;
 dm(i0, m0) = 20787;
 dm(i0, m0) = -25330;
 dm(i0, m0) = 19519;
 dm(i0, m0) = -26319;
 dm(i0, m0) = 18204;
 dm(i0, m0) = -27245;
 dm(i0, m0) = 16845;
 dm(i0, m0) = -28106;
 dm(i0, m0) = 15446;
 dm(i0, m0) = -28898;
 dm(i0, m0) = 14009;
 dm(i0, m0) = -29621;
 dm(i0, m0) = 12539;
 dm(i0, m0) = -30273;
 dm(i0, m0) = 11038;
 dm(i0, m0) = -30852;
 dm(i0, m0) = 9511;
 dm(i0, m0) = -31357;
 dm(i0, m0) = 7961;
 dm(i0, m0) = -31785;
 dm(i0, m0) = 6392;
 dm(i0, m0) = -32138;
 dm(i0, m0) = 4807;
 dm(i0, m0) = -32413;
 dm(i0, m0) = 3211;
 dm(i0, m0) = -32610;
 dm(i0, m0) = 1607;
 dm(i0, m0) = -32728;
 dm(i0, m0) = 0;
 dm(i0, m0) = -32767;
 dm(i0, m0) = -1607;
 dm(i0, m0) = -32728;
 dm(i0, m0) = -3211;
 dm(i0, m0) = -32610;
 dm(i0, m0) = -4807;
 dm(i0, m0) = -32413;
 dm(i0, m0) = -6392;
 dm(i0, m0) = -32138;
 dm(i0, m0) = -7961;
 dm(i0, m0) = -31785;
 dm(i0, m0) = -9511;
 dm(i0, m0) = -31357;
 dm(i0, m0) = -11038;
 dm(i0, m0) = -30852;
 dm(i0, m0) = -12539;
 dm(i0, m0) = -30273;
 dm(i0, m0) = -14009;
 dm(i0, m0) = -29621;
 dm(i0, m0) = -15446;
 dm(i0, m0) = -28898;
 dm(i0, m0) = -16845;
 dm(i0, m0) = -28106;
 dm(i0, m0) = -18204;
 dm(i0, m0) = -27245;
 dm(i0, m0) = -19519;
 dm(i0, m0) = -26319;
 dm(i0, m0) = -20787;
 dm(i0, m0) = -25330;
 dm(i0, m0) = -22004;
 dm(i0, m0) = -24279;
 dm(i0, m0) = -23169;
 dm(i0, m0) = -23170;
 dm(i0, m0) = -24278;
 dm(i0, m0) = -22005;
 dm(i0, m0) = -25329;
 dm(i0, m0) = -20787;
 dm(i0, m0) = -26318;
 dm(i0, m0) = -19519;
 dm(i0, m0) = -27244;
 dm(i0, m0) = -18204;
 dm(i0, m0) = -28105;
 dm(i0, m0) = -16846;
 dm(i0, m0) = -28897;
 dm(i0, m0) = -15446;
 dm(i0, m0) = -29621;
 dm(i0, m0) = -14010;
 dm(i0, m0) = -30272;
 dm(i0, m0) = -12539;
 dm(i0, m0) = -30851;
 dm(i0, m0) = -11039;
 dm(i0, m0) = -31356;
 dm(i0, m0) = -9512;
 dm(i0, m0) = -31785;
 dm(i0, m0) = -7961;
 dm(i0, m0) = -32137;
 dm(i0, m0) = -6392;
 dm(i0, m0) = -32412;
 dm(i0, m0) = -4808;
 dm(i0, m0) = -32609;
 dm(i0, m0) = -3211;
 dm(i0, m0) = -32727;
 dm(i0, m0) = -1607;

 i1 = ^TWD_FACT;
 dm(i1, m0) = 0x7fff;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x7f61;
 dm(i1, m0) = 0xf375;
 dm(i1, m0) = 0x7d89;
 dm(i1, m0) = 0xe708;
 dm(i1, m0) = 0x7a7c;
 dm(i1, m0) = 0xdad9;
 dm(i1, m0) = 0x7640;
 dm(i1, m0) = 0xcf05;
 dm(i1, m0) = 0x70e1;
 dm(i1, m0) = 0xc3aa;
 dm(i1, m0) = 0x6a6c;
 dm(i1, m0) = 0xb8e4;
 dm(i1, m0) = 0x62f1;
 dm(i1, m0) = 0xaecd;
 dm(i1, m0) = 0x5a81;
 dm(i1, m0) = 0xa57f;
 dm(i1, m0) = 0x5133;
 dm(i1, m0) = 0x9d0f;
 dm(i1, m0) = 0x471c;
 dm(i1, m0) = 0x9594;
 dm(i1, m0) = 0x3c56;
 dm(i1, m0) = 0x8f1f;
 dm(i1, m0) = 0x30fb;
 dm(i1, m0) = 0x89c0;
 dm(i1, m0) = 0x2527;
 dm(i1, m0) = 0x8584;
 dm(i1, m0) = 0x18f8;
 dm(i1, m0) = 0x8277;
 dm(i1, m0) = 0xc8b;
 dm(i1, m0) = 0x809f;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x8002;
 dm(i1, m0) = 0xf375;
 dm(i1, m0) = 0x809f;
 dm(i1, m0) = 0xe708;
 dm(i1, m0) = 0x8277;
 dm(i1, m0) = 0xdad9;
 dm(i1, m0) = 0x8584;
 dm(i1, m0) = 0xcf05;
 dm(i1, m0) = 0x89c0;
 dm(i1, m0) = 0xc3aa;
 dm(i1, m0) = 0x8f1f;
 dm(i1, m0) = 0xb8e4;
 dm(i1, m0) = 0x9594;
 dm(i1, m0) = 0xaecd;
 dm(i1, m0) = 0x9d0f;
 dm(i1, m0) = 0xa57f;
 dm(i1, m0) = 0xa57f;
 dm(i1, m0) = 0x9d0f;
 dm(i1, m0) = 0xaecd;
 dm(i1, m0) = 0x9594;
 dm(i1, m0) = 0xb8e4;
 dm(i1, m0) = 0x8f1f;
 dm(i1, m0) = 0xc3aa;
 dm(i1, m0) = 0x89c0;
 dm(i1, m0) = 0xcf05;
 dm(i1, m0) = 0x8584;
 dm(i1, m0) = 0xdad9;
 dm(i1, m0) = 0x8277;
 dm(i1, m0) = 0xe708;
 dm(i1, m0) = 0x809f;
 dm(i1, m0) = 0xf375;
 dm(i1, m0) = 0x8002;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x809f;
 dm(i1, m0) = 0xc8b;
 dm(i1, m0) = 0x8277;
 dm(i1, m0) = 0x18f8;
 dm(i1, m0) = 0x8584;
 dm(i1, m0) = 0x2527;
 dm(i1, m0) = 0x89c0;
 dm(i1, m0) = 0x30fb;
 dm(i1, m0) = 0x8f1f;
 dm(i1, m0) = 0x3c56;
 dm(i1, m0) = 0x9594;
 dm(i1, m0) = 0x471c;
 dm(i1, m0) = 0x9d0f;
 dm(i1, m0) = 0x5133;
 dm(i1, m0) = 0xa57f;
 dm(i1, m0) = 0x5a81;
 dm(i1, m0) = 0xaecd;
 dm(i1, m0) = 0x62f1;
 dm(i1, m0) = 0xb8e4;
 dm(i1, m0) = 0x6a6c;
 dm(i1, m0) = 0xc3aa;
 dm(i1, m0) = 0x70e1;
 dm(i1, m0) = 0xcf05;
 dm(i1, m0) = 0x7640;
 dm(i1, m0) = 0xdad9;
 dm(i1, m0) = 0x7a7c;
 dm(i1, m0) = 0xe708;
 dm(i1, m0) = 0x7d89;
 dm(i1, m0) = 0xf375;
 dm(i1, m0) = 0x7f61;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x7ffe;
 dm(i1, m0) = 0xc8b;
 dm(i1, m0) = 0x7f61;
 dm(i1, m0) = 0x18f8;
 dm(i1, m0) = 0x7d89;
 dm(i1, m0) = 0x2527;
 dm(i1, m0) = 0x7a7c;
 dm(i1, m0) = 0x30fb;
 dm(i1, m0) = 0x7640;
 dm(i1, m0) = 0x3c56;
 dm(i1, m0) = 0x70e1;
 dm(i1, m0) = 0x471c;
 dm(i1, m0) = 0x6a6c;
 dm(i1, m0) = 0x5133;
 dm(i1, m0) = 0x62f1;
 dm(i1, m0) = 0x5a81;
 dm(i1, m0) = 0x5a81;
 dm(i1, m0) = 0x62f1;
 dm(i1, m0) = 0x5133;
 dm(i1, m0) = 0x6a6c;
 dm(i1, m0) = 0x471c;
 dm(i1, m0) = 0x70e1;
 dm(i1, m0) = 0x3c56;
 dm(i1, m0) = 0x7640;
 dm(i1, m0) = 0x30fb;
 dm(i1, m0) = 0x7a7c;
 dm(i1, m0) = 0x2527;
 dm(i1, m0) = 0x7d89;
 dm(i1, m0) = 0x18f8;
 dm(i1, m0) = 0x7f61;
 dm(i1, m0) = 0xc8b;

 i1 = ^angle_table;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x1f4;
 dm(i1, m0) = 0x2ad0;
 dm(i1, m0) = 0x127;
 dm(i1, m0) = 0xf551;
 dm(i1, m0) = 0x9b;
 dm(i1, m0) = 0x2ab7;
 dm(i1, m0) = 0x4f;
 dm(i1, m0) = 0xbcaf;
 dm(i1, m0) = 0x27;
 dm(i1, m0) = 0xe34d;
 dm(i1, m0) = 0x13;
 dm(i1, m0) = 0xf246;
 dm(i1, m0) = 0x9;
 dm(i1, m0) = 0xf937;
 dm(i1, m0) = 0x4;
 dm(i1, m0) = 0x7c9e;
 dm(i1, m0) = 0x2;
 dm(i1, m0) = 0x3e4f;
 dm(i1, m0) = 0x1;
 dm(i1, m0) = 0x9f28;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x4f94;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x27ca;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x13e5;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x9f2;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x4f9;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x27d;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x13e;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x9f;
 dm(i1, m0) = 0x0;
 dm(i1, m0) = 0x50;
 dm(i1, m0) = 0x0;

 i1 = ^dtmf_freq_esti_l;
 dm(i1, m0) = 0x0000;
 dm(i1, m0) = 0x00c8;

 i1 = ^dtmf_freq_esti_h;
 dm(i1, m0) = 0x0000;
 dm(i1, m0) = 0x00c8;

 i0 = ^analysis_buffer;
 cntr = 128;
 do clr_ana_buffer until ce; {reset overlap buffer}
 clr_ana_buffer: dm(i0, m0) = 0;

 i1 = ^dtmf_freq_buffer;
 i2 = ^dtmf_freqh_buffer;
 i3 = ^dtmf_sort_buffer;
 cntr = 8;
 do clr_dtmf_buffer until ce;
 dm(i1, m0) = 0;
 dm(i2, m0) = 0;
 clr_dtmf_buffer: dm(i3, m0) = 0;

 i1 = ^dtmf_power_buffer;
 cntr = 3;
 do clr_power_buffer until ce;
 clr_power_buffer: dm(i1, m0) = 0;

 i1 = ^ZCR_Buffer;
 dm(i1, m0) = 0;
 dm(i1, m0) = 0;
 dm(i1, m0) = 0;
 dm(i1, m0) = 0;

 i1 = ^temp_buffer;
 dm(i1, m0) = 0;
 dm(i1, m0) = 0;

_INIT_DTMF_Decoder.end: rts;
 dm(i1, m0) = 0;
 dm(i1, m0) = 0;

$_DTMF_Decoder:
 m1 = 0;
 m2 = 1;
 m3 = -1;
 m4 = 1;
 dis m_mode;
 i1 = ^analysis_buffer;
 i2 = ^analysis_buffer + 64;

 cntr = 64;
 do mcpy_loop until ce;
 ax0 = dm(i2, m2);
 mcpy_loop: dm(i1, m2) = ax0;

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
 do hann_mult until ce;
 my0 = dm(i1, m1);
 mr = sr0 * my0(ss), sr0 = dm(i0, m2);
 hann_mult: dm(i1, m2) = mr1;
 
 sb = -16;
 i0 = ^fft_buffer;
 cntr = 128;
 do dtmf_agc until ce;
 si = dm(i0, m2);
 dtmf_agc: sb = expadj si;
 
 se = sb;
 i0 = ^fft_buffer;
 cntr = 128;
 do dtmf_alc until ce;
 si = dm(i0, m1);
 sr = norm si(lo);
 dtmf_alc: dm(i0, m2) = sr0;

 i0 = ^dtmf_freq_esti_l;
 ax0 = dm(i0, m2);
 ax1 = dm(i0, m3);

 ay0 = 0x0000; // 65536000
 ay1 = 0x03e8;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 if lt jump Label_T;
 nop;
 nop;
 ay0 = 0x0000;
 ay1 = 0x0bb8; // 196608000
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 if ge jump Label_T;
 nop;
 nop;
 ay0 = 0x0000;
 ay1 = 0x07d0;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1, ax0 = ar;
 ar = pass af;
 call _cordic;
 ax1 = ar;
 i1 = ^angle_table;

 i0 = ^vector;
 ax0 = dm(i0, m2);
 ar = -ax0, ax1 = dm(i0, m3);
 af = -ax1, dm(i0, m2) = ar;
 ar = pass af;
 dm(i0, m3) = ar;
 jump Label_U;
 ar = pass af;
 ar = pass af;

Label_T: call _cordic;
 nop;
 i1 = ^angle_table;

Label_U: ena m_mode;
 i0 = ^R_Data;
 i1 = ^vector;
 mx0 = dm(i1, m2);
 mx1 = dm(i1, m3);
 dm(i0, m2) = 16384;
 dm(i0, m3) = mx0;
 i0 = ^I_Data;
 dm(i0, m2) = 8192;
 dm(i0, m3) = mx0;

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
 sr = lshift mr0 by -8(lo);
 sr = sr or ashift mr1 by -8(hi);
 dm(i1, m2) = sr0;
 dm(i1, m3) = sr1;
 
 i1 = ^sum_A;
 i2 = ^R_Data;
 i3 = ^I_Data;
 cntr = 126;
 do DTFT_Loop until ce;
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
 //ar = sr1 + ay1 + c, dm(i1, m2) = ar;
 dm(i1, m2) = ar, ar = sr1 + ay1 + c;
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
 //ar = sr1 + ay1 + c, dm(i1, m2) = ar;
 dm(i1, m2) = ar, ar = sr1 + ay1 + c;
 dm(i1, m3) = ar;
 DTFT_Loop: i1 = ^sum_A;

 ax1 = 32767;
 mr0 = dm(i1, m2); // sum_A.L
 mr1 = dm(i1, m3); // sum_A.H
 sr = lshift mr0 by -14(lo);
 sr = sr or ashift mr1 by -14(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = pass mr0, ay0 = sr0;
 af = sr1 - ay0, ay1 = sr1;
 if ne ar = ax1 xor ay1;
 mx0 = ar;
 my0 = ar;
 
 i1 = ^sum_B;
 mr0 = dm(i1, m2);
 mr1 = dm(i1, m3);
 sr = lshift mr0 by -13(lo);
 sr = sr or ashift mr1 by -13(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = pass mr0, ay0 = sr0;
 af = sr1 - ay0, ay1 = sr1;
 if ne ar = ax1 xor ay1;
 mr = mx0 * my0(ss), my1 = ar;
 mr = mr + ar * my1(ss);
 i1 = ^sum_P;
 dm(i1, m2) = mr0;
 dm(i1, m3) = mr1;

 i0 = ^dtmf_freq_esti_h;
 ax0 = dm(i0, m2);
 ax1 = dm(i0, m3);

 //i1 = _debug_buffer;
 //dm(i1, m2) = ax0;
 //dm(i1, m3) = ax1;

 ay0 = 0x0000; // 65536000
 ay1 = 0x03e8;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 if lt jump Label_TT;
 nop;
 nop;
 ay0 = 0x0000;
 ay1 = 0x0bb8; // 196608000
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 if ge jump Label_TT;
 nop;
 nop;
 ay0 = 0x0000;
 ay1 = 0x07d0;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1, ax0 = ar;
 ar = pass af;
 call _cordic;
 ax1 = ar;
 i1 = ^angle_table;
 
 i0 = ^vector;
 ax0 = dm(i0, m2);
 ar = -ax0, ax1 = dm(i0, m3);
 af = -ax1, dm(i0, m2) = ar;
 ar = pass af;
 dm(i0, m3) = ar;
 jump Label_UU;
 ar = pass af;
 ar = pass af;

Label_TT: call _cordic;
 nop;
 i1 = ^angle_table;

Label_UU: ena m_mode;
 i0 = ^R_Data;
 i1 = ^vector;
 mx0 = dm(i1, m2);
 mx1 = dm(i1, m3);
 dm(i0, m2) = 16384;
 dm(i0, m3) = mx0;
 i0 = ^I_Data;
 dm(i0, m2) = 8192;
 dm(i0, m3) = mx0;

 i0 = ^fft_buffer;
 i1 = ^sum_C;
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
 
 i1 = ^sum_D;
 mr = mx1 * my1(ss);
 sr = lshift mr0(lo);
 sr = sr or ashift mr1(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -8(lo);
 sr = sr or ashift mr1 by -8(hi);
 dm(i1, m2) = sr0;
 dm(i1, m3) = sr1;
 
 i1 = ^sum_C;
 i2 = ^R_Data;
 i3 = ^I_Data;
 cntr = 126;
 do DCT_Loop until ce;
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
 ay0 = dm(i1, m2); // sum_C.L
 ar = sr0 + ay0, ay1 = dm(i1, m3); // ay1 = sum_C.H
 //ar = sr1 + ay1 + c, dm(i1, m2) = ar;
 dm(i1, m2) = ar, ar = sr1 + ay1 + c;
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
 i1 = ^sum_D;
 ay0 = dm(i1, m2);
 ar = sr0 + ay0, ay1 = dm(i1, m3);
 //ar = sr1 + ay1 + c, dm(i1, m2) = ar;
 dm(i1, m2) = ar, ar = sr1 + ay1 + c;
 dm(i1, m3) = ar;
 DCT_Loop: i1 = ^sum_C;

 //i0 = _debug_buffer;
 ax1 = 32767;
 mr0 = dm(i1, m2); // sum_A.L
 mr1 = dm(i1, m3); // sum_A.H
 sr = lshift mr0 by -14(lo);
 sr = sr or ashift mr1 by -14(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = pass mr0, ay0 = sr0;
 af = sr1 - ay0, ay1 = sr1;
 if ne ar = ax1 xor ay1;
 mx0 = ar;
 my0 = ar;
 //dm(i0, m1) = ar;

 i1 = ^sum_D;
 mr0 = dm(i1, m2);
 mr1 = dm(i1, m3);
 sr = lshift mr0 by -13(lo);
 sr = sr or ashift mr1 by -13(hi);
 mr0 = sr0;
 mr1 = sr1;
 sr = lshift mr0 by -15(lo);
 sr = sr or ashift mr1 by -15(hi);
 ar = pass mr0, ay0 = sr0;
 af = sr1 - ay0, ay1 = sr1;
 if ne ar = ax1 xor ay1;
 //dm(i0, m1) = ar;
 mr = mx0 * my0(ss), my1 = ar;
 mr = mr + ar * my1(ss);
 i1 = ^sum_Q;
 dm(i1, m2) = mr0;
 dm(i1, m3) = mr1;

 sr = lshift mr0 by -1(lo);
 sr = sr or ashift mr1 by -1(hi);
 ay0 = sr0;
 ay1 = sr1;
 //dm(i0, m2) = mr0;
 //dm(i0, m3) = mr1;

 i1 = ^sum_P;
 si = dm(i1, m2);
 ar = dm(i1, m3);
 sr = lshift si by -1(lo);
 sr = sr or ashift ar by -1(hi);
 ar = sr0 + ay0;
 af = sr1 + ay1 + c, dm(i4, m4) = ar; // sum_L.L
 //ar = pass af, ay0 = ar;
 ay0 = ar, ar = pass af;
 dm(i4, m4) = ar; // sum_L.H

 //i0 = _debug_buffer;
 //dm(i0, m2) = ay0;
 //dm(i0, m3) = ar;

 se = sb;
 i0 = ^fft_buffer;
 si = dm(i0, m2);
 ay0 = 0;
 ay1 = 0;
 cntr = 128;
 do temp_loop until ce;
 sr = ashift si(lo), si = dm(i0, m2);
 my0 = sr0;
 mr = sr0 * my0(ss);
 sr = lshift mr0 by -7(lo);
 sr = sr or ashift mr1 by -7(hi);
 ar = sr0 + ay0;
 af = sr1 + ay1 + c, ay0 = ar;
 ar = pass af;
 temp_loop: ay1 = ar;

 si = ay0;
 ar = ay1;
 ax0 = ay0;
 ax1 = ay1;
 sr = lshift si by -8(lo);
 sr = sr or ashift ar by -8(hi);
 ay0 = sr0;
 ay1 = sr1;
 m5 = -2;
 modify(i4, m5);
 si = dm(i4, m4); // sum_L.L
 ar = dm(i4, m4); // sum_L.H
 modify(i4, m5);
 sr = lshift si by -5(lo);
 sr = sr or ashift ar by -5(hi);
 ar = sr0 - ay0, dm(i4, m4) = ax0;
 af = sr1 - ay1 + c - 1, dm(i4, m4) = ax1;
 ar = pass 0;
 if ge ar = pass 1;
 ay1 = ar, ar = abs sr0;
 ay0 = ar, ar = abs sr1;
 af = ar + ay0;
 ar = 1;
 if eq ar = pass 0;
 ar = ar and ay1; // confirm not zeros

 i1 = ^dtmf_power_buffer;
 i2 = ^dtmf_power_buffer + 1;
 ax0 = dm(i2, m2);
 dm(i1, m2) = ax0;
 ax0 = dm(i2, m2);
 dm(i1, m2) = ax0;
 dm(i1, m2) = ar;

 i1 = ^fft_buffer;
 i2 = ^fft_buffer + 1;
 ay0 = dm(i2, m2); // signal[i]
 ay1 = 0;
 cntr = 127;
 do dtmf_zero_cross until ce;
 af = pass ay0;
 ar = -1;
 if ge ar = pass 1;
 ax0 = dm(i1, m2);
 af = pass ax0, ay0 = ar;
 ar = -1;
 if ge ar = pass 1;
 ar = ar - ay0;
 ar = abs ar;
 ar = ar + ay1, ay0 = dm(i2, m2);
 dtmf_zero_cross: ay1 = ar;

 i2 = ^ZCR_Buffer;
 i3 = ^ZCR_Buffer + 1;
 cntr = 3;
 do zcr_memmove until ce;
 ax0 = dm(i3, m2);
 zcr_memmove: dm(i2, m2) = ax0;
 dm(i2, m2) = ay1;

 call _rfft_128;
 i0 = ^fft_buffer;
 i0 = ^fft_buffer;

 i1 = ^data_power + 2; // i1 = (Word32 *)&data_power[1]
 i2 = ^rfft_out + 2; // i2 = (Word16 *)&rfft_out[2]
 mx0 = dm(i2, m2); // real
 my0 = mx0;
 cntr = 63;
 do dtmf_power until ce;
 mr = mx0 * my0(ss), mx1 = dm(i2, m2); // imag
 my1 = mx1;
 mr = mr + mx1 * my1(ss), mx0 = dm(i2, m2);
 my0 = mx0;
 dm(i1, m2) = mr0;
 dtmf_power: dm(i1, m2) = mr1;
 
 i1 = ^data_power;
 i2 = ^rfft_out; // DC
 mx0 = dm(i2, m2);
 my0 = mx0;
 mr = mx0 * my0(ss);
 dm(i1, m2) = mr0;
 dm(i1, m3) = mr1;

 i1 = ^data_power + 128;
 mx0 = dm(i2, m3);
 my0 = mx0;
 mr = mx0 * my0(ss);
 dm(i1, m2) = mr0;
 dm(i1, m3) = mr1;

 //i1 = _debug_buffer;
 //i2 = data_power;
 //cntr = 65;
 //do out_loop until ce;
 //ax0 = dm(i2, m2);
 //ax1 = dm(i2, m2);
 //dm(i1, m2) = ax0;
 //out_loop: dm(i1, m2) = ax1;

 i2 = ^temp_buffer;
 i3 = ^temp_buffer + 1;
 cntr = 3;
 do temp_buffer_memmove until ce;
 ax0 = dm(i3, m2);
 temp_buffer_memmove: dm(i2, m2) = ax0;

 se = sb;
 i1 = ^data_power + 10; // &data_power[5]
 si = dm(i1, m2);
 ay0 = 0;
 ay1 = 0;
 cntr = 5;
 do sub_power until ce;
 sr = lshift si(lo), ar = dm(i1, m2);
 sr = sr or ashift ar(hi);
 ar = sr0 + ay0, si = dm(i1, m2);
 af = sr1 + ay1 + c, ay0 = ar;
 ar = pass af;
 sub_power: ay1 = ar;

 si = ay0;
 sr = lshift si(lo);
 sr = sr or ashift ar(hi);
 ay0 = sr0;
 ay1 = sr1;
 modify(i4, m5);
 mr0 = dm(i4, m4); // temp_signal.L
 call div_32_32;
 mr1 = dm(i4, m4); // temp_signal.H
 modify(i4, m5);

 dm(i2, m2) = mx0;

 i1 = ^data_power + 2; // data_power[1]
 i2 = i1; // idx
 ay0 = dm(i1, m2);
 ay1 = dm(i1, m2); // Max_value
 ax0 = dm(i1, m2); // ax0 = data_power[2].L
 cntr = 15;
 do dtmf_search_peak until ce;
 ar = ax0 - ay0, ax1 = dm(i1, m2);
 af = ax1 - ay1 + c - 1;
 if lt jump dtmf_search_peak; // gt may be judged eq
 nop;
 nop;
 ay0 = ax0;
 ay1 = ax1;
 i2 = i1;
 dtmf_search_peak: ax0 = dm(i1, m2);

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

 //i1 = _debug_buffer;
 //dm(i1, m2) = ar;
 //dm(i1, m3) = 0;

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

 //i1 = _debug_buffer;
 //dm(i1, m1) = sr0;

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

 //i1 = _debug_buffer;
 //dm(i1, m1) = ar;

 mx0 = dm(i5, m4);
 my0 = 125;
 mr = mx0 * my0(ss);
 sr = ashift mr0 by 14(lo);
 sr = sr or ashift mr1 by 14(hi);
 mr0 = sr0;
 mr1 = sr1;
 mr = mr + ar * my0(ss);

 i1 = ^dtmf_freq_buffer; // Word32 Freq_buffer[4];
 i2 = ^dtmf_freq_buffer + 2;
 cntr = 3;
 do dtmf_freql_cpy until ce;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m2);
 dm(i1, m2) = ax0;
 dtmf_freql_cpy: dm(i1, m2) = ax1;

 dm(i1, m2) = mr0;
 dm(i1, m3) = mr1;

 i1 = ^dtmf_freq_esti_l;
 ay0 = 0;
 ay1 = 0x00c8;
 ar = mr0 - ay0;
 af = mr1 - ay1 + c - 1;
 if ge jump Label_V;
 nop;
 nop;
 mr0 = 0;
 mr1 = 0x00c8;

Label_V: dm(i1, m2) = mr0;
 dm(i1, m3) = mr1;

 i1 = ^data_power + 36;
 i2 = i1;
 ay0 = dm(i1, m2);
 ay1 = dm(i1, m2);
 ax0 = dm(i1, m2); // ax[1:0] = data_power[i]
 cntr = 9;
 do dtmf_search_peak_h until ce;
 ar = ax0 - ay0, ax1 = dm(i1, m2);
 af = ax1 - ay1 + c - 1;
 if lt jump dtmf_search_peak_h;
 nop;
 nop;
 ay0 = ax0;
 ay1 = ax1;
 i2 = i1;
 dtmf_search_peak_h: ax0 = dm(i1, m2);

 ar = ^data_power + 36;
 ay0 = i2;
 af = ar - ay0;
 if eq jump Label_Q;
 nop;
 nop;

 modify(i2, m3);
 modify(i2, m3);

Label_Q: ar = i2;
 ay0 = ^data_power;
 ar = ar - ay0;
 sr = ashift ar by -1(lo); // ch_num
 m5 = -1;
 ar = pass sr0; // ar = ch_num
 modify(i4, m5);
 i5 = i4;
 dm(i4, m4) = ar;
 modify(i4, m5);

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
 my1 = ar; // sign bits
 ar = i2;
 ay0 = i1;
 if ge ar = pass ay0;
 i3 = ar;
 call _Sqrt_32;
 ax0 = dm(i3, m2);
 ax1 = dm(i3, m3);

 sr = lshift ar by 1(lo); // sr0 = 2*q
 mx0 = sr0; // 2*q
 mx1 = ar; // q
 m0 = mr1;
 i3 = ^data_power;
 modify(i3, m0);

 call _Sqrt_32;
 ax0 = dm(i3, m2);
 ax1 = dm(i3, m3);

 ax0 = mx0; // 2*q
 ay0 = ar; // q

 ar = ax0 - ay0, ax1 = mx1;
 sr = ashift ar by 14(lo);
 ar = ax1 + ay0;
 af = pass sr1, ay0 = sr0;

Label_R: divs af, ar;
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
 if ge ar = -ar;

 mx1 = dm(i5, m4);
 my1 = 125;
 mr = mx1 * my1(ss);
 sr = ashift mr0 by 14(lo);
 sr = sr or ashift mr1 by 14(hi);
 mr0 = sr0;
 mr1 = sr1;
 mr = mr + ar * my1(ss);
 
 i1 = ^dtmf_freqh_buffer;
 i2 = ^dtmf_freqh_buffer + 2;
 cntr = 3;
 do dtmf_freqh_cpy until ce;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m2);
 dm(i1, m2) = ax0;
 dtmf_freqh_cpy: dm(i1, m2) = ax1;

 dm(i1, m2) = mr0;
 dm(i1, m3) = mr1;
 i1 = ^dtmf_freq_esti_h;
 dm(i1, m2) = mr0;
 dm(i1, m3) = mr1;

 i1 = ^dtmf_freq_buffer;
 ay0 = dm(i1, m2);
 ay1 = dm(i1, m2); // ay[1:0] = Freq_buffer[0];
 i2 = i1;
 ax0 = dm(i2, m2);
 cntr = 3;
 do cmp_dtmf_loop until ce;
 ar = ax0 - ay0, ax1 = dm(i2, m2);
 af = ax1 - ay1 + c - 1;
 if lt jump cmp_dtmf_loop;
 nop;
 nop;
 ay0 = ax0;
 ay1 = ax1;
 cmp_dtmf_loop: ax0 = dm(i2, m2);

 sr0 = ay0;
 sr1 = ay1;

 i1 = ^dtmf_freq_buffer;
 ay0 = dm(i1, m2);
 ay1 = dm(i1, m2); // ay[1:0] = Freq_buffer[0];
 i2 = i1;
 ax0 = dm(i2, m2);
 cntr = 3;
 do cmp_min_dtmf_loop until ce;
 ar = ax0 - ay0, ax1 = dm(i2, m2);
 af = ax1 - ay1 + c - 1;
 if ge jump cmp_min_dtmf_loop;
 nop;
 nop;
 ay0 = ax0;
 ay1 = ax1;
 cmp_min_dtmf_loop: ax0 = dm(i2, m2);
 
 ar = sr0 - ay0;
 af = sr1 - ay1 + c - 1, ay0 = ar;
 ax0 = 0;
 ax1 = 0x000a; // 20Hz
 ar = ax0 - ay0;
 af = ax1 - af + c - 1;
 if lt jump Label_W;
 nop;
 nop;
 i1 = ^dtmf_freqh_buffer;
 ay0 = dm(i1, m2);
 ay1 = dm(i1, m2); // ay[1:0] = Freqh_buffer[0];
 i2 = i1;
 ax0 = dm(i2, m2);
 cntr = 3;
 do cmp_dtmfh_loop until ce;
 ar = ax0 - ay0, ax1 = dm(i2, m2);
 af = ax1 - ay1 + c - 1;
 if lt jump cmp_dtmfh_loop;
 nop;
 nop;
 ay0 = ax0;
 ay1 = ax1;
 cmp_dtmfh_loop: ax0 = dm(i2, m2);

 sr0 = ay0;
 sr1 = ay1;

 i1 = ^dtmf_freqh_buffer;
 ay0 = dm(i1, m2);
 ay1 = dm(i1, m2); // ay[1:0] = Freqh_buffer[0];
 i2 = i1;
 ax0 = dm(i2, m2);
 cntr = 3;
 do min_dtmfh_loop until ce;
 ar = ax0 - ay0, ax1 = dm(i2, m2);
 af = ax1 - ay1 + c - 1;
 if ge jump min_dtmfh_loop;
 nop;
 nop;
 ay0 = ax0;
 ay1 = ax1;
 min_dtmfh_loop: ax0 = dm(i2, m2);

 ar = sr0 - ay0;
 af = sr1 - ay1 + c - 1, ay0 = ar;
 ax0 = 0;
 ax1 = 0x000a; // 20Hz
 ar = ax0 - ay0;
 af = ax1 - af + c - 1;
 if lt jump Label_W;
 nop;
 nop;

 i1 = ^dtmf_power_buffer;
 ax0 = dm(i1, m2);
 af = pass ax0;
 if eq jump Label_W;
 nop;
 nop;
 ax0 = dm(i1, m2);
 af = pass ax0;
 if eq jump Label_W;
 nop;
 nop;
 ax0 = dm(i1, m2);
 af = pass ax0;
 if eq jump Label_W;
 nop;
 nop;

 i1 = ^ZCR_Buffer;
 ax0 = dm(i1, m2);
 ay0 = 24;
 af = ax0 - ay0, ax0 = dm(i1, m2); // zcr[0]
 if le jump Label_W;
 nop;
 nop;
 af = ax0 - ay0, ax0 = dm(i1, m2); // zcr[1]
 if le jump Label_W;
 nop;
 nop;
 af = ax0 - ay0, ax0 = dm(i1, m2); // zcr[2]
 if le jump Label_W;
 nop;
 nop;
 af = ax0 - ay0; // zcr[3]
 if le jump Label_W;
 nop;
 nop;

 i0 = ^dtmf_freq_buffer;
 i1 = ^dtmf_sort_buffer;
 cntr = 4;
 do dtmf_cpy_loop until ce;
 ax0 = dm(i0, m2);
 ax1 = dm(i0, m2);
 dm(i1, m2) = ax0;
 dtmf_cpy_loop: dm(i1, m2) = ax1;

 //i = 0;
 m0 = -2;
 i1 = ^dtmf_sort_buffer;
 i2 = ^dtmf_sort_buffer + 2;
 ax0 = dm(i1, m2); // a[j-1].L
 cntr = 3;
 do Label_X until ce;
 ax1 = dm(i1, m2); // a[j-1].H
 ay0 = dm(i2, m2); // a[j].L
 ar = ax0 - ay0, ay1 = dm(i2, m2); // a[j].H
 af = ax1 - ay1 + c - 1;
 if lt jump Label_X;
 nop;
 nop;
 modify(i1, m0);
 modify(i2, m0);
 dm(i1, m2) = ay0;
 dm(i1, m2) = ay1;
 dm(i2, m2) = ax0;
 dm(i2, m2) = ax1;
 Label_X: ax0 = dm(i1, m2);

 //i = 1;
 i1 = ^dtmf_sort_buffer;
 i2 = ^dtmf_sort_buffer + 2;
 ax0 = dm(i1, m2); // a[j-1]
 cntr = 2;
 do Label_XI until ce;
 ax1 = dm(i1, m2);
 ay0 = dm(i2, m2); // a[j]
 ar = ax0 - ay0, ay1 = dm(i2, m2);
 af = ax1 - ay1 + c - 1;
 if lt jump Label_XI;
 nop;
 nop;
 modify(i1, m0);
 modify(i2, m0);
 dm(i1, m2) = ay0;
 dm(i1, m2) = ay1;
 dm(i2, m2) = ax0;
 dm(i2, m2) = ax1;
 Label_XI: ax0 = dm(i1, m2);

 //i = 2;
 i1 = ^dtmf_sort_buffer;
 i2 = ^dtmf_sort_buffer + 2;
 ax0 = dm(i1, m2); // a[j-1]
 cntr = 1;
 do Label_XII until ce;
 ax1 = dm(i1, m2);
 ay0 = dm(i2, m2); // a[j]
 ar = ax0 - ay0, ay1 = dm(i2, m2);
 af = ax1 - ay1 + c - 1;
 if lt jump Label_XII;
 nop;
 nop;
 modify(i1, m0);
 modify(i2, m0);
 dm(i1, m2) = ay0;
 dm(i1, m2) = ay1;
 dm(i2, m2) = ax0;
 dm(i2, m2) = ax1;
 Label_XII: ax0 = dm(i1, m2);
 
 si = 0; // acc = 0
 i2 = ^dtmf_sort_buffer + 2;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m3); // median(freq_buffer)
 ay0 = 0x8000;
 ay1 = 0x015c;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1, mr0 = ar;
 ar = pass af;
 mr1 = ar;
 sr = lshift mr0 by -31(lo);
 sr = sr or lshift ar by -31(hi);
 ay0 = sr0;
 ar = mr0 - ay0, ay1 = sr1;
 af = mr1 - ay1 + c - 1, ay0 = ar;
 ar = pass af;
 ay1 = ar;
 sr = lshift mr0 by -31(lo);
 sr = sr or ashift mr1 by -31(hi);
 ar = sr0 xor ay0;
 af = sr1 xor ay1, ax0 = ar;
 ar = pass af;
 ax1 = ar;
 ay0 = 0x3a3e;
 ay1 = 0x0005;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 if ge jump Check_770;
 nop;
 nop;

 ar = si;
 //ar = ar xor 1;
 ar = 1 xor ar;
 si = ar;
 jump Check_1209;
 nop;
 nop;

Check_770: i2 = ^dtmf_sort_buffer + 2;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m3); // median(freq_buffer)
 ay0 = 0x0000;
 ay1 = 0x0181;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1, mr0 = ar;
 ar = pass af;
 mr1 = ar;
 sr = lshift mr0 by -31(lo);
 sr = sr or lshift ar by -31(hi);
 ay0 = sr0;
 ar = mr0 - ay0, ay1 = sr1;
 af = mr1 - ay1 + c - 1, ay0 = ar;
 ar = pass af;
 ay1 = ar;
 sr = lshift mr0 by -31(lo);
 sr = sr or ashift mr1 by -31(hi);
 ar = sr0 xor ay0;
 af = sr1 xor ay1, ax0 = ar;
 ar = pass af;
 ax1 = ar;
 ay0 = 0xc666;
 ay1 = 0x0005;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 if ge jump Check_852;
 nop;
 nop;

 ar = si;
 //ar = ar xor 2;
 ar = 2 xor ar;
 si = ar;
 jump Check_1209;
 nop;
 nop;

Check_852: i2 = ^dtmf_sort_buffer + 2;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m3); // median(freq_buffer)
 ay0 = 0x0000;
 ay1 = 0x01aa;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1, mr0 = ar;
 ar = pass af;
 mr1 = ar;
 sr = lshift mr0 by -31(lo);
 sr = sr or lshift ar by -31(hi);
 ay0 = sr0;
 ar = mr0 - ay0, ay1 = sr1;
 af = mr1 - ay1 + c - 1, ay0 = ar;
 ar = pass af;
 ay1 = ar;
 sr = lshift mr0 by -31(lo);
 sr = sr or ashift mr1 by -31(hi);
 ar = sr0 xor ay0;
 af = sr1 xor ay1, ax0 = ar;
 ar = pass af;
 ax1 = ar;
 ay0 = 0x63dc;
 ay1 = 0x0006;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 if ge jump Check_941;
 nop;
 nop;

 ar = si;
 ar = ar xor 4;
 si = ar;
 jump Check_1209;
 nop;
 nop;

Check_941: i2 = ^dtmf_sort_buffer + 2;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m3); // median(freq_buffer)
 ay0 = 0x8000;
 ay1 = 0x01d6;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1, mr0 = ar;
 ar = pass af;
 mr1 = ar;
 sr = lshift mr0 by -31(lo);
 sr = sr or lshift ar by -31(hi);
 ay0 = sr0;
 ar = mr0 - ay0, ay1 = sr1;
 af = mr1 - ay1 + c - 1, ay0 = ar;
 ar = pass af;
 ay1 = ar;
 sr = lshift mr0 by -31(lo);
 sr = sr or ashift mr1 by -31(hi);
 ar = sr0 xor ay0;
 af = sr1 xor ay1, ax0 = ar;
 ar = pass af;
 ax1 = ar;
 ay0 = 0x0eb8;
 ay1 = 0x0007;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 if ge jump Check_1209;
 nop;
 nop;
 ar = si;
 ar = ar xor 8;
 si = ar;

Check_1209: i0 = ^dtmf_freqh_buffer;
 i1 = ^dtmf_sort_buffer;
 cntr = 4;
 do dtmf_mcpy_loop until ce;
 ax0 = dm(i0, m2);
 ax1 = dm(i0, m2);
 dm(i1, m2) = ax0;
 dtmf_mcpy_loop: dm(i1, m2) = ax1;

 //i = 0;
 i1 = ^dtmf_sort_buffer;
 i2 = ^dtmf_sort_buffer + 2;
 ax0 = dm(i1, m2); // a[j-1].L
 cntr = 3;
 do Label_Y until ce;
 ax1 = dm(i1, m2); // a[j-1].H
 ay0 = dm(i2, m2); // a[j].L
 ar = ax0 - ay0, ay1 = dm(i2, m2); // a[j].H
 af = ax1 - ay1 + c - 1;
 if lt jump Label_Y;
 nop;
 nop;
 modify(i1, m0);
 modify(i2, m0);
 dm(i1, m2) = ay0;
 dm(i1, m2) = ay1;
 dm(i2, m2) = ax0;
 dm(i2, m2) = ax1;
 Label_Y: ax0 = dm(i1, m2);

 //i = 1;
 i1 = ^dtmf_sort_buffer;
 i2 = ^dtmf_sort_buffer + 2;
 ax0 = dm(i1, m2); // a[j-1]
 cntr = 2;
 do Label_YI until ce;
 ax1 = dm(i1, m2);
 ay0 = dm(i2, m2); // a[j]
 ar = ax0 - ay0, ay1 = dm(i2, m2);
 af = ax1 - ay1 + c - 1;
 if lt jump Label_YI;
 nop;
 nop;
 modify(i1, m0);
 modify(i2, m0);
 dm(i1, m2) = ay0;
 dm(i1, m2) = ay1;
 dm(i2, m2) = ax0;
 dm(i2, m2) = ax1;
 Label_YI: ax0 = dm(i1, m2);

 //i = 2;
 i1 = ^dtmf_sort_buffer;
 i2 = ^dtmf_sort_buffer + 2;
 ax0 = dm(i1, m2); // a[j-1]
 cntr = 1;
 do Label_YII until ce;
 ax1 = dm(i1, m2);
 ay0 = dm(i2, m2); // a[j]
 ar = ax0 - ay0, ay1 = dm(i2, m2);
 af = ax1 - ay1 + c - 1;
 if lt jump Label_YII;
 nop;
 nop;
 modify(i1, m0);
 modify(i2, m0);
 dm(i1, m2) = ay0;
 dm(i1, m2) = ay1;
 dm(i2, m2) = ax0;
 dm(i2, m2) = ax1;
 Label_YII: ax0 = dm(i1, m2);

 i2 = ^dtmf_sort_buffer + 2;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m3); // median(freqh_buffer)
 ay0 = 0x8000;
 ay1 = 0x025c;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1, mr0 = ar;
 ar = pass af;
 mr1 = ar;
 sr = lshift mr0 by -31(lo);
 sr = sr or lshift ar by -31(hi);
 ay0 = sr0;
 ar = mr0 - ay0, ay1 = sr1;
 af = mr1 - ay1 + c - 1, ay0 = ar;
 ar = pass af;
 ay1 = ar;
 sr = lshift mr0 by -31(lo);
 sr = sr or ashift mr1 by -31(hi);
 ar = sr0 xor ay0;
 af = sr1 xor ay1, ax0 = ar;
 ar = pass af;
 ax1 = ar;
 ay0 = 0x114a;
 ay1 = 0x0009;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 if ge jump Check_1336;
 nop;
 nop;

 ar = si;
 ar = ar xor 16;
 si = ar;
 jump Check_Default;
 nop;
 nop;

Check_1336: i2 = ^dtmf_sort_buffer + 2;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m3); // median(freqh_buffer)
 ay0 = 0x0000;
 ay1 = 0x029c;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1, mr0 = ar;
 ar = pass af;
 mr1 = ar;
 sr = lshift mr0 by -31(lo);
 sr = sr or lshift ar by -31(hi);
 ay0 = sr0;
 ar = mr0 - ay0, ay1 = sr1;
 af = mr1 - ay1 + c - 1, ay0 = ar;
 ar = pass af;
 ay1 = ar;
 sr = lshift mr0 by -31(lo);
 sr = sr or ashift mr1 by -31(hi);
 ar = sr0 xor ay0;
 af = sr1 xor ay1, ax0 = ar;
 ar = pass af;
 ax1 = ar;
 ay0 = 0x051e;
 ay1 = 0x000a;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 if ge jump Check_1477;
 nop;
 nop;

 ar = si;
 ar = ar xor 32;
 si = ar;
 jump Check_Default;
 nop;
 nop;

Check_1477: i2 = ^dtmf_sort_buffer + 2;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m3); // median(freqh_buffer)
 ay0 = 0x8000;
 ay1 = 0x02e2;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1, mr0 = ar;
 ar = pass af;
 mr1 = ar;
 sr = lshift mr0 by -31(lo);
 sr = sr or lshift ar by -31(hi);
 ay0 = sr0;
 ar = mr0 - ay0, ay1 = sr1;
 af = mr1 - ay1 + c - 1, ay0 = ar;
 ar = pass af;
 ay1 = ar;
 sr = lshift mr0 by -31(lo);
 sr = sr or ashift mr1 by -31(hi);
 ar = sr0 xor ay0;
 af = sr1 xor ay1, ax0 = ar;
 ar = pass af;
 ax1 = ar;
 ay0 = 0x13dc;
 ay1 = 0x000b;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 if ge jump Check_1633;
 nop;
 nop;

 ar = si;
 ar = ar xor 64;
 si = ar;
 jump Check_Default;
 nop;
 nop;

Check_1633: i2 = ^dtmf_sort_buffer + 2;
 ax0 = dm(i2, m2);
 ax1 = dm(i2, m3); // median(freqh_buffer)
 ay0 = 0x8000;
 ay1 = 0x0330;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1, mr0 = ar;
 ar = pass af;
 mr1 = ar;
 sr = lshift mr0 by -31(lo);
 sr = sr or lshift ar by -31(hi);
 ay0 = sr0;
 ar = mr0 - ay0, ay1 = sr1; // b-=(b < 0)
 af = mr1 - ay1 + c - 1, ay0 = ar;
 ar = pass af;
 ay1 = ar;
 sr = lshift mr0 by -31(lo);
 sr = sr or ashift mr1 by -31(hi);
 ar = sr0 xor ay0;
 af = sr1 xor ay1, ax0 = ar;
 ar = pass af;
 ax1 = ar;
 ay0 = 0x3f5a;
 ay1 = 0x000c;
 ar = ax0 - ay0;
 af = ax1 - ay1 + c - 1;
 if ge jump Check_Default;
 nop;
 nop;

 ar = si;
 ar = ar xor 128;
 si = ar;

Check_Default: //i1 = _debug_buffer; // write to output result register
 //dm(i1, m2) = si;
 //dm(i1, m3) = 0;
 //dm(GPR14) = si;
 ay0 = si;
 af = 17 - ay0; // 697+1209
 if ne jump case_33;
 ay1 = dm(CR15);
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 ar = 0x0020 or ar;
 dm(CR15) = ar;
 jump _DTMF_Decoder.end;
 ax0 = 1;
 dm(GPR12) = ax0;

case_33: af = 33 - ay0; // 697+1336
 if ne jump case_65;
 ay1 = dm(CR15);
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 ar = 0x0020 or ar;
 dm(CR15) = ar;
 jump _DTMF_Decoder.end;
 ax0 = 2;
 dm(GPR12) = ax0;

case_65: af = 65 - ay0; // 697+1477
 if ne jump case_129;
 ay1 = dm(CR15);
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 ar = 0x0020 or ar;
 dm(CR15) = ar;
 jump _DTMF_Decoder.end;
 ax0 = 3;
 dm(GPR12) = ax0;

case_129: af = 129 - ay0; // 697+1633
 if ne jump case_18;
 ay1 = dm(CR15);
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 ar = 0x0020 or ar;
 dm(CR15) = ar;
 jump _DTMF_Decoder.end;
 ax0 = 0x000d;
 dm(GPR12) = ax0;

case_18: af = 18 - ay0; // 770+1209
 if ne jump case_34;
 ay1 = dm(CR15);
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 ar = 0x0020 or ar;
 dm(CR15) = ar;
 jump _DTMF_Decoder.end;
 ax0 = 4;
 dm(GPR12) = ax0;

case_34: af = 34 - ay0; // 770+1336
 if ne jump case_66;
 ay1 = dm(CR15);
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 ar = 0x0020 or ar;
 dm(CR15) = ar;
 jump _DTMF_Decoder.end;
 ax0 = 5;
 dm(GPR12) = ax0;

case_66: af = 66 - ay0; // 770+1477
 if ne jump case_130;
 ay1 = dm(CR15);
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 ar = 0x0020 or ar;
 dm(CR15) = ar;
 jump _DTMF_Decoder.end;
 ax0 = 6;
 dm(GPR12) = ax0;

case_130: af = 130 - ay0; // 770+1633
 if ne jump case_20;
 ay1 = dm(CR15);
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 ar = 0x0020 or ar;
 dm(CR15) = ar;
 jump _DTMF_Decoder.end;
 ax0 = 0x000e;
 dm(GPR12) = ax0;

case_20: af = 20 - ay0; // 852+1209
 if ne jump case_36;
 ay1 = dm(CR15);
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 ar = 0x0020 or ar;
 dm(CR15) = ar;
 jump _DTMF_Decoder.end;
 ax0 = 7;
 dm(GPR12) = ax0;

case_36: af = 36 - ay0; // 852+1336
 if ne jump case_68;
 ax1 = 0xffdf;
 ay1 = dm(CR15);
 ar = ax1 and ay1;
 ar = 0x0020 or ar;
 dm(CR15) = ar;
 jump _DTMF_Decoder.end;
 ax0 = 8;
 dm(GPR12) = ax0;

case_68: af = 68 - ay0; // 852+1477
 if ne jump case_132;
 ay1 = dm(CR15);
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 ar = 0x0020 or ar;
 dm(CR15) = ar;
 jump _DTMF_Decoder.end;
 ax0 = 0x0009;
 dm(GPR12) = ax0;

case_132: af = 132 - ay0; // 852+1633
 if ne jump case_24;
 ay1 = dm(CR15);
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 ar = 0x0020 or ar;
 dm(CR15) = ar;
 jump _DTMF_Decoder.end;
 ax0 = 0x000f;
 dm(GPR12) = ax0;

case_24: af = 24 - ay0; // 941+1209
 if ne jump case_40;
 ay1 = dm(CR15);
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 ar = 0x0020 or ar;
 dm(CR15) = ar;
 jump _DTMF_Decoder.end;
 ax0 = 0x000b;
 dm(GPR12) = ax0;

case_40: af = 40 - ay0; // 941+1336
 if ne jump case_72;
 ay1 = dm(CR15);
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 ar = 0x0020 or ar;
 dm(CR15) = ar;
 jump _DTMF_Decoder.end;
 ax0 = 0x000a;
 dm(GPR12) = ax0;

case_72: af = 72 - ay0; // 941+1477
 if ne jump case_136;
 ay1 = dm(CR15);
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 ar = 0x0020 or ar;
 dm(CR15) = ar;
 jump _DTMF_Decoder.end;
 ax0 = 0x000c;
 dm(GPR12) = ax0;

case_136: af = 136 - ay0; // 941+1633
 if ne jump case_default;
 ay1 = dm(CR15);
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 ar = 0x0020 or ar;
 dm(CR15) = ar;
 jump _DTMF_Decoder.end;
 ax0 = 0;
 dm(GPR12) = ax0;

case_default: ay1 = dm(CR15);
 jump _DTMF_Decoder.end;
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 dm(CR15) = ar;

Label_W: // digit decode
 ay1 = dm(CR15);
 ax1 = 0xffdf;
 ar = ax1 and ay1;
 dm(CR15) = ar;

_DTMF_Decoder.end: rts;
.endmod;
