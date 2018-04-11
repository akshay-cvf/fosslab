#!/bin/bash
pdftotext -layout s1results.pdf s1results.txt
pdftotext -layout s2results.pdf s2results.txt

tr -d '\040\011\012\015\014\054'< s1results.txt> s1.txt
tr -d '\040\011\012\015\014\054'< s2results.txt> s2.txt
 
sed -i 's/MDL16CS/\nMDL16CS/g' s1.txt
sed -i "s/ELECTRONICS/\nELECTRONICS/g" s1.txt
sed -i 's/MDL16CS/\nMDL16CS/g' s2.txt
sed -i "s/ELECTRONICS/\nELECTRONICS/g" s2.txt

grep MDL16CS s1.txt > s1grades.txt
grep MDL16CS s2.txt > s2grades.txt

sed -i "s/MA101(/ /g" s1grades.txt
sed -i "s/PH100(/ /g" s1grades.txt
sed -i "s/BE110(/ /g" s1grades.txt
sed -i "s/BE10105(/ /g" s1grades.txt
sed -i "s/BE103(/ /g" s1grades.txt
sed -i "s/EE100(/ /g" s1grades.txt
sed -i "s/PH110(/ /g" s1grades.txt
sed -i "s/EE110(/ /g" s1grades.txt
sed -i "s/CS110(/ /g" s1grades.txt
sed -i "s/)/ /g" s1grades.txt

sed -i "s/EC100(/ /g" s2grades.txt
sed -i "s/CY100(/ /g" s2grades.txt
sed -i "s/BE100(/ /g" s2grades.txt
sed -i "s/CY110(/ /g" s2grades.txt
sed -i "s/EC110(/ /g" s2grades.txt
sed -i "s/MA102(/ /g" s2grades.txt
sed -i "s/BE102(/ /g" s2grades.txt
sed -i "s/CS100(/ /g" s2grades.txt
sed -i "s/CS120(/ /g" s2grades.txt
sed -i "s/)/ /g" s2grades.txt

sed -i "s/O/10/g" s1grades.txt
sed -i "s/A+/9/g" s1grades.txt
sed -i "s/A/8.5/g" s1grades.txt
sed -i "s/B+/8/g" s1grades.txt
sed -i "s/B/7/g" s1grades.txt
sed -i "s/C/6/g" s1grades.txt
sed -i "s/P/5/g" s1grades.txt
sed -i "s/F/0/g" s1grades.txt

sed -i "s/O/10/g" s2grades.txt
sed -i "s/A+/9/g" s2grades.txt
sed -i "s/A/8.5/g" s2grades.txt
sed -i "s/B+/8/g" s2grades.txt
sed -i "s/B/7/g" s2grades.txt
sed -i "s/C/6/g" s2grades.txt
sed -i "s/P/5/g" s2grades.txt
sed -i "s/F/0/g" s2grades.txt

sed -i "s/166/16C/g" s1grades.txt
sed -i "s/166/16C/g" s2grades.txt

grep -v "ELE6TR10NI6S" s1grades.txt > s1.txt
grep -v "ELE6TR10NI6S" s1grades.txt > s2.txt

>s1gpa.txt
>s2gpa.txt

mapfile < s1grades.txt

for i in `seq 0 122`
do
  temp=(${MAPFILE[$i]})
  sum=$(printf "%.1f" "$(echo "((${temp[1]} *4) + (${temp[2]} * 4) + (${temp[3]} * 3) + (${temp[4]} * 3) + (${temp[5]} *3) + (${temp[6]} *3) + (${temp[7]}) + ${temp[8]} + ${temp[9]})/23"|bc -l)")
  echo "$sum" >> s1gpa.txt
done

paste s1grades.txt s1gpa.txt> s1sgpa.txt

sed -i 's/T6E16CS006/\nT6E16CS006/g' s2grades.txt

grep -v "T6E16CS" s2grades.txt> s2cs.txt

mapfile < s2cs.txt

for i in `seq 0 122`
do
  tmp=(${MAPFILE[$i]})
  sum=$(printf "%.1f" "$(echo "((${tmp[1]} *4) + (${tmp[2]} * 4) + (${tmp[3]} * 3) + (${tmp[4]} * 1) + (${tmp[5]} *1) + (${tmp[6]} *4) + (${tmp[7]} *3) + (${tmp[8]} *3) + ${tmp[9]})/24"|bc -l)")
  echo "$sum" >> s2gpa.txt
done

paste s2cs.txt s2gpa.txt> s2sgpa.txt

paste s2sgpa.txt s1sgpa.txt | awk '{printf "%s  %.1f\n",$1,($11 *24 + $22 *23)/47}'> cgpa.txt

join -1 6 -2 1 cs4b.txt cgpa.txt > cs4bcgpa.txt

#rm s1grades.txt s2grades.txt s2grades.txt s2cs.txt s2sgpa.txt s2results.txt s2gpa.txt s1sgpa.txt s1results.txt s1gpa.txt cgpa.txt
