# IF and AND together
When you have multiple columns to check to get one status, check individual status first.

```
Excel file example:

Columns:  B           C           D         E         F                 G                   H                 I
Row1:     Test1       Test2       Test3     Test4     Status=Negative   Status=Vaccinated   Status=Positive   Status=Infected
Row2:     Negative    Negative    1         4         Negative          Fix                 Fix               Fix  
Row3:     Negative    Negative    0         3         Fix               Vaccinated          Fix               Fix
Row4:     Positive    Positive    2         7         Fix               Fix                 Positive          Fix
Row5:     Positive    Positive    0         3         Fix               Fix                 Fix               Infected
```

```
Under column F
=IF(AND(B3="Negative",C3="Negative",D3>0,E3<=5), "Negative", "Fix")

Under column G
=IF(AND(B3="Negative",C3="Negative",D3=0,E3<=5), "Vaccinated", "Fix")

Under column H
=IF(AND(B3="Positive",C3="Positive",D3>0,E3>5), "Positive", "Fix")

Under column I
=IF(AND(B3="Positive",C3="Positive",D3=0,E3<=5), "Infected","Fix")
```

Explanation i.e. column F: If B3 is equal to "Negative", and C3="Negative", and D3 is greater than 0, and E3 is less than or equal to 5, put "Negative" under column F. If conditions doesn't match, put "Fix" under column F 


# Nested IF
Reference: https://www.ablebits.com/office-addins-blog/nested-if-excel-multiple-conditions/

```
Excel file example:

Columns:  A           B           C         D         E           F 
Row1:     Test1       Test2       Test3     Test4     Status      Explanation
Row2:     Negative    Fix         Fix       Fix       Negative    Not infected
Row3:     Fix         Vaccinated  Fix       Fix       Vaccinated  Not infected + vaccinated
Row4:     Fix         Fix         Positive  Fix       Positive    Infected + sick
Row5:     Fix         Fix         Fix       Infected  Infected    Infected + not sick
```

FUNCTION to put into column E under "Status":
`=IF(A1="Negative","Negative", IF(B1="Vaccinated", "Vaccinated", IF(C1="Positive","Positive", IF(D1="Infected","Infected"))))`

Explanation: If A1 is equal to "Negative", put "Negative" in column E, or if B1="Vaccinated", put "Vaccinated" in column E etc. until all conditions have been tested.


FUNCTION to put into column F under "Explanation":
`=IF(E1="Negative","Not infected", IF(E1="Vaccinated", "Not infected + vaccinated", IF(E1="Positive","Infected + sick", IF(E1="Infected","Infected + not sick"))))`

Explanation: If E1 is equal to "Negative", put "Not infected" in column F, or if E1="Vaccinated", put "Not infected + vaccinated" in column F etc. until all conditions have been tested.


