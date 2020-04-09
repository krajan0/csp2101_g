#!/bin/bash

#guessAge=-1
generate_random_age(){
 #min =20 , max =70 , RANDOM%41 will give 0 to 40
 #add 30 to get the number between 20 to 70
 (( answer = RANDOM % 41 + 30 ))
}

#prompt user to guess age within the range
echo -e "Welcome! Guess the Person's age between 20 and 70\n"

#generate a random age
generate_random_age

#loop until answer is correct
while (( guessAge != answer )); do  
  read -p "$(tput setaf 7)Enter your guessed age:" guessAge
  if (( guessAge > answer )); then
    echo "$(tput setaf 1)Sorry, your guess is too high, please try again"
  elif (( guessAge < answer )); then
    echo "$(tput setaf 3)Sorry, your guess is too low, please try again"
  fi
done
echo -e "$(tput setaf 2)Congratulations! You have guessed the correct age! :-)\n"