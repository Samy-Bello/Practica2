#!/bin/bash

#Funciones

RecomanacioRapida () {
echo "------------------"
echo "Recomanacio rapida"
echo "------------------"
echo ""
elemento=`sort -R netflix.csv | head -n1`
echo `echo $elemento | cut -f 1,5 -d, --output-delimiter=", "`
echo `echo $elemento | cut -f 2 -d,`
echo `echo $elemento | cut -f 3 -d,`
echo " "


}

LlistarPerAny () {

echo "Introdueix l'any: "

read yearSearch

echo " "
grep $yearSearch netflix.csv | sort | uniq | cut -f1,2 -d, --output-delimiter=', ' > elemento.txt
cat elemento.txt
echo " "
echo " " 
}

LlistarPerValor () {



awk -F, ' ($6 >= '$rating')  &&  ($6 <= 100)  &&  $rating != "title" { print $6,", ",$rating,", ",$5 }' netflix.csv | sort -n | uniq > elemento.txt

awk '($rating >= 50) && ($rating < 65) { $rating=""; print "[ * ]",$0 }' elemento.txt
awk '($rating >= 65) && ($rating < 75) { $rating=""; print "[ * * ]",$0 }' elemento.txt
awk '($rating >= 75) && ($rating < 85) { $rating=""; print "[ * * * ]",$0 }' elemento.txt
awk '($rating >= 85) && ($rating < 95) { $rating=""; print "[ * * * * ]",$0 }' elemento.txt
awk '($rating >= 95) && ($rating < 100) { $rating=""; print "[ * * * * * ]",$0 }' elemento.txt
}


#Menu

echo "1- Recomanacio rapida"
echo "2- Listar per any"
echo "3- Listar per rating"
echo "4- Sortir"

read menuOption


while [ $menuOption -ne 4 ];  do
  case $menuOption in
     1)

        RecomanacioRapida

	sleep 3
	clear
	echo "1- Recomendacion rapida"
	echo "2- Listar per any"
	echo "3- Listar por rating"
	echo "4- Salir"
	read menuOption
     ;;
     2)
         LlistarPerAny

	sleep 3
	clear
	echo "1- Recomanacio rapida"
	echo "2- Listar per any"
	echo "3- Listar per rating"
	echo "4- Sortir"
	read menuOption


     ;;
     3)
         
	echo "Introdueix el rating: "
	read rating
	echo " "
         LlistarPerValor

	sleep 3
	clear
	echo "1- Recomanacio rapida"
	echo "2- Listar per any"
	echo "3- Listar per rating"
	echo "4- Sortir"
	read menuOption


     ;;
   
     4)
	clear
	
     ;;
     *)
	echo "Error, opció no valida"
	echo $menuOption
	sleep 3
	clear
	echo "1: Recomenació ràpida"
	echo "2: Llistar per any"
	echo "3: Sortir"
	read menuOption

     ;;
  esac

done
