echo "Currently logged user and his logname :$(echo $(logname))"
echo "Your current shell : $(echo $SHELL)"
echo "Your current home : $(echo $HOME)"
echo "Your operating System : $(echo $(arch))"
echo "Your current path setting : $(echo $PATH)"
echo "Your current working directory : $(echo $PWD)"
echo "Show currently logged numberof users : "
who --count
