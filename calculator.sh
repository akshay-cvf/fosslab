clear
s,x,m,d
i="y"

echo " Enter one no."
read n1
echo "Enter second no."
read n2
while [ $i = "y" ]
do
echo "1.Addition"
echo "2.Subtraction"
echo "3.Multiplication"
echo "4.Division"
echo "Enter your choice"
read ch
case $ch in
    1)s=`expr $n1 + $n2`
     echo "Sum ="$s;;
    2)x=`expr $n1 - $n2`
     echo "Sub = "$x;;
    3)m=`expr $n1 \* $n2`
     echo "Mul = "$m;;
    4)d=`expr $n1 / $n2`
     echo "Div = "$d;;
    *)echo "Invalid choice";;
esac
echo "Do u want to continue ?"
read i
if [ $i != "y" ]
then
    exit
fi
done   
