# Day 01

Sonar Sweep

## Part One

How many measurements are larger than the previous measurement?

Measurements report:

```
199
200
208
210
200
207
240
269
260
263
```

## Part two

Three-measurement sliding window

```
199  A
200  A B
208  A B C
210    B C D
200  E   C D
207  E F   D
240  E F G
269    F G H
260      G H
263        H
```

> Your goal now is to count the number of times the sum of measurements in this
> sliding window increases from the previous sum.
