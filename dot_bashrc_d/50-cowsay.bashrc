#enables a wise cow at the start of every bash session if cowsay is installed
which cowsay &>/dev/null
if [ $? -eq 0 ]; then
  COW=$(echo $(cowsay -l)) 
  COW=${COW##C*:}
  numberOfCows=$(grep -o " " <<< "$COW" | wc -l)
  numberOfCows=$(($numberOfCows - 1))
  random=$RANDOM
  let "random %= $numberOfCows"
  COW=$(echo $COW | cut -d ' ' -f $random)
  fortune | cowsay -f $COW
fi
