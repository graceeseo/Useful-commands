# Nested If 
Reference: https://www.ablebits.com/office-addins-blog/nested-if-excel-multiple-conditions/

```
Excel file example:

<b> 
Columns:  A           B           C         D         E           F* <b>
Row1:     Test1       Test2       Test3     Test4     Status      Explanation
Row2:     Negative    Fix         Fix       Fix       Negative    Not infected
Row3:     Fix         Vaccinated  Fix       Fix       Vaccinated  Not infected + vaccinated
Row4:     Fix         Fix         Positive  Fix       Positive    Infected + sick
Row5:     Fix         Fix         Fix       Infected  Infected    Infected + not sick
```

FUNCTION to put into column E under "Status":
=IF(A1="Negative","Not infected", IF(C1="Negative","Vaccinated", IF(D1="Sick","Infected", IF(E1="Cold","Not good"))))



