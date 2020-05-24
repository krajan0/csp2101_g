#Karrthik Rajan
#Student Number: 10452682

#!/bin/bash
echo "Dimensions of Rectangle textfile successfully obtained!"


#Multiple argument lines created for readability
#Deleted header of textfile using "sed"
#<Name>,<Height>,<Width>,<Area>,<Colour> of rectangle arranged to: Name: <Name> Height: <Height> Width: <Width> Area: <Area> Colour: <Colour> by using "sed"
sed -e '1d'\
    -e 's/ /,/g'\
    -e 's/Rec/Name: Rec/g'\
    -e 's/,/ Height: /'\
    -e 's/,/ Width: /'\
    -e 's/,/ Area: /'\
    -e 's/,/ Colour: /' rectangle.txt > rectangle_f.txt

