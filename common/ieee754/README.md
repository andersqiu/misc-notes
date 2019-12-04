# Introduction
IEEE-754 format floating-point number binary representation

## IEEE Floating-Point Representation
```
V = (-1)^s x M x 2^E
```
* **S** stands for the sign. The number is negative (s = 1) or positive (s = 0).
* **M** stands for the significand. It's either between 1 and 2 - e or between 0 and 1 - e.
* **E** stands for the exponent. It weights the value by a power of 2.

### Single precision
```
 31  30       23 22                            0
| s |    exp    |            frac               |
```

### Double precision
```
 63  62               52 51                                                                            0
| s |        exp        |                                frac                                           |
```

### Normalized Values
* Condition: The bit pattern of exp is neither all zeros (numeric value 0) nor all ones(numeric value 255 for single precision, 2047 for double).
* The represented number is in Biased form.
* E = e - Bias, where e is the unsigned number having bit representation of exp segment and Bias is a bias value to 2^(k - 1) - 1 (127 for single precision and 1023 for double). This yields exponent ranges from -126 to + 127 for single precision and -1022 to +1023 for double precision.
* The faction field frac is interpreed as f(0 <= f < 1) The significand is defined as M = 1 + f.

### Denormalized Values
* Condition: The exp field is all zeros.
* The represented number is in denormalized form.
* E = 1 - Bias, which is -126 for single precision and -1022 for double precision.
* The significand M is M = f.
* The denormalized values contain +0.0 and -0.0

### Special Values
* Condtion: the exp field is all ones.
* +inf and -inf: the frac field is all zeros
* NaN: the frac field is nonzero.

### Single precision value table
| Description | Hex | Binary | IEEE-754 | Form | e | E | 2^E | f | M | 2^E x M | Value | Hex literals |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| +Zero | 0x0000 0000 | 0000 0000 0000 0000 0000 0000 0000 0000 | 0,000 0000 0,000 0000 0000 0000 0000 0000 | denormalized | 0 | 1 - 127 | pow(2, -126) | 0/pow(2, 23) | 0/pow(2, 23) | 0/pow(2, -149) | +0.0 | 0x0p+0 |
| -Zero | 0x8000 0000 | 1000 0000 0000 0000 0000 0000 0000 0000 | 1,000 0000 0,000 0000 0000 0000 0000 0000 | denormalized | 0 | 1 - 127 | pow(2, -126) | 0/pow(2, 23) | 0/pow(2, 23) | 0/pow(2, -149) | -0.0 | -0xp+0 |
| Smallest positive denormalized | 0x0000 0001 | 0000 0000 0000 0000 0000 0000 0000 0001 | 0,000 0000 0,000 0000 0000 0000 0000 0001 | denormalized | 0 | 1 - 127 | pow(2, -126) | 1/pow(2, 23) | 1/pow(2, 23) | 1/pow(2, 149) | pow(2, -149) | 0x1.0-149 |
| | 0x0000 0002 | 0000 0000 0000 0000 0000 0000 0000 0010 | 0,000 0000 0,000 0000 0000 0000 0000 0010 | denormalized | 0 | 1 - 127 | pow(2, -126) | 2/pow(2, 23) | 2/pow(2, 23) | 2/pow(2, 149) | pow(2, -148) | 0x1.0p-148 |
| | 0x0000 0003 | 0000 0000 0000 0000 0000 0000 0000 0011 | 0,000 0000 0,000 0000 0000 0000 0000 0011 | denormalized | 0 | 1 - 127 | pow(2, -126) | 3/pow(2, 23) | 3/pow(2, 23) | 3/pow(2, 149) | 3/pow(2, 149) | 0x1.8p-148 |
| Largest denormalized | 0x007f ffff | 0000 0000 0111 1111 1111 1111 1111 1111 | 0,000 0000 0,111 1111 1111 1111 1111 1111 | denormalized | 0 | 1 - 127 | pow(2, -126) | pow(2, -126) | 1 - 1/pow(2, 23) | pow(2, -126) - pow(2, -149) | pow(2, -126) -pow(2, -149) | 0x1.fffffcp-127 |
| Smallest positive normalized | 0x0080 0000 | 0000 0000 1000 0000 0000 0000 0000 0000 | 0,000 0000 1,000 0000 0000 0000 0000 0000 | normalized | 1 | 1 - 127 | pow(2, -126) | 0/pow(2, 23) | 1 | pow(2, -126) | pow(2, -126) | 0x1p-126 |
| | 0x0080 0001 | 0000 0000 1000 0000 0000 0000 0000 0001 | 0,000 0000 1,000 0000 0000 0000 0000 0001 | normalized | 1 | 1 - 127 | pow(2, -126) | 1/pow(2, 23) |  1 + 1/pow(2, 23) | pow(2, -126) + pow(2, -149) | pow(2, -126) + pow(2, -149) | 0x1.000002p-126 |
| One | 0x3f80 0000 | 0011 1111 1000 0000 0000 0000 0000 0000 | 0,011 1111 1,000 0000 0000 0000 0000 0000 | normalized | 127 | 127 - 127 | 1 | 0/pow(2, 23) | 1 + 0/pow(2, 23) | 1 | 1.0 | 0x1p+0 |
| Two | 0x4000 0000 | 0100 0000 0000 0000 0000 0000 0000 0000 | 0,100 0000 0,000 0000 0000 0000 0000 0000 | normalized | 128 | 128 - 127 | 2 | 0/pow(2, 23) | 1 + 0/pow(2, 23) | 2 | 2.0 | 0x1p+1 |
| Largest normalized | 0x7f7f ffff | 0111 1111 0111 1111 1111 1111 1111 1111 | 0,111 1111 0,111 1111 1111 1111 1111 1111 | normalized | 254 | 254 - 127 | pow(2, 127) | 1 - 1/pow(2, 23) | 1 + 1 - 1/pow(2, 23) | pow(2, 128) - pow(2, 104) | pow(2, 128) - pow(2, 104) | 0x1.fffffep+127 |
| +Infinity | 0x7f80 0000 | 0111 1111 1000 0000 0000 0000 0000 0000 | 0,111 1111 1,000 0000 0000 0000 0000 0000 | specialized | | | | | | | +inf | +inf |
| -Infinity | 0xff80 0000 | 1111 1111 1000 0000 0000 0000 0000 0000 | 1,111 1111 1,000 0000 0000 0000 0000 0000 | specialized | | | | | | | -inf | -inf |
| Not a number | 0x7fc0 0000 | 0111 1111 1100 0000 0000 0000 0000 0000 | 0,111 1111 1,100 0000 0000 0000 0000 0000 | specialized | | | | | | | NaN | NaN |


### Double precision value table
| Description | Hex | Binary | IEEE-754 | Form | e | E | 2^E | f | M | 2^E x M | Value | Hex literals |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| +Zero | 0x0000 0000 0000 0000 | 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000| 0,000 0000 0000, 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 | denormalized | 0 | 1 - 1023 | pow(2, -1022) | 0/pow(2, 52) | 0/pow(2, 52) | 0/pow(2, -1074) | +0.0 | 0x0p+0 |
| -Zero | 0x8000 0000 0000 0000 | 1000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000| 1,000 0000 0000, 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 | denormalized | 0 | 1 - 1023 | pow(2, -1022) | 0/pow(2, 52) | 0/pow(2, 23) | 0/pow(2, -1074) | -0.0 | -0xp+0 |
| Smallest positive denormalized | 0x0000 0000 0000 0001 | 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0001 | 0,000 0000 0000, 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0001 | denormalized | 0 | 1 - 1023 | pow(2, -1022) | 1/pow(2, 52) | 1/pow(2, 52) | 1/pow(2, 1074) | pow(2, -1074) | 0x0.0000000000001p-1022 |
| | 0x0000 0000 0000 0002 | 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0010 | 0,000 0000 0000, 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0010 | denormalized | 0 | 1 - 1023 | pow(2, -1022) | 2/pow(2, 52) | 2/pow(2, 52) | 2/pow(2, 1074) | pow(2, -1073) | 0x0.0000000000002p-1022 |
| | 0x0000 0000 0000 0003 | 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0011 | 0,000 0000 0000, 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0011 | denormalized | 0 | 1 - 1023 | pow(2, -1022) | 3/pow(2, 52) | 3/pow(2, 52) | 3/pow(2, 1074) | 3/pow(2, 1074) | 0x0.0000000000003p-1022 |
| Largest denormalized | 0x000f ffff ffff ffff | 0000 0000 0000 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 | 0,000 0000 0000, 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 | denormalized | 0 | 1 - 1023 | pow(2, -1022) | pow(2, -1022) | 1 - 1/pow(2, 52) | pow(2, -1022) - pow(2, -1074) | pow(2, -1022) -pow(2, -1074) | 0x0.fffffffffffffp-127 |
| Smallest positive normalized | 0x0010 0000 0000 0000 | 0000 0000 0001 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 | 0,000 0000 0001, 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 | normalized | 1 | 1 - 1023 | pow(2, -1022) | 0/pow(2, 52) | 1 | pow(2, -1022) | pow(2, -1022) | 0x1p-1022 |
| | 0x0010 0000 0000 0001 | 0000 0000 0001 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0001 | 0,000 0000 0001, 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0001 | normalized | 1 | 1 - 1023 | pow(2, -1022) | 1/pow(2, 52) |  1 + 1/pow(2, 52) | pow(2, -1022) + pow(2, -1074) | pow(2, -1022) + pow(2, -1074) | 0x1.0000000000001p-1022 |
| One | 0x3ff0 0000 0000 0000 | 0011 1111 1111 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 | 0,011 1111 1111, 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 | normalized | 1023 | 1023 - 1023 | 1 | 0/pow(2, 52) | 1 + 0/pow(2, 52) | 1 | 1.0 | 0x1p+0 |
| Two | 0x4000 0000 0000 0000 | 0100 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 | 0,100 0000 0000, 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 | normalized | 1024 | 1024 - 1023 | 2 | 0/pow(2, 52) | 1 + 0/pow(2, 52) | 2 | 2.0 | 0x1p+1 |
| Largest normalized | 0x7fef ffff ffff ffff | 0111 1111 1110 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 | 0,111 1111 1110, 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 1111 | normalized | 2046 | 2046 - 1023 | pow(2, 1023) | 1 - 1/pow(2, 52) | 1 + 1 - 1/pow(2, 52) | pow(2, 1024) - pow(2, 971) | pow(2, 1024) - pow(2, 971) | 0x1.fffffffffffffp+1023 |
| +Infinity | 0x7ff0 0000 0000 0000 | 0111 1111 1111 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 | 0,111 1111 1111, 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 | specialized | | | | | | | +inf | +inf |
| -Infinity | 0xfff0 0000 0000 0000 | 1111 1111 1111 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 | 1,111 1111 1111, 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 | specialized | | | | | | | -inf | -inf |
| Not a number | 0x7ff8 0000 | 0111 1111 1111 1000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 | 0,111 1111 1111, 1000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 0000 | specialized | | | | | | | NaN | NaN |