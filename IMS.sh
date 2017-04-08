#!/bin/bash

#Internet Metadata Searcher
#Author: José C. García Gamero.
#Date: 2017-03-15
#E-Mail: josecarlos@whatinformatica.com

sudo chmod +x ./options.sh

numero=$(zenity --title "Internet Metadata Searcher" --width=480 --height=320 --entry --entry-text="1,2,3..." --text="Seleccione el número de resultados que quiere obtener")
	var1=$(echo $?)

	if [ $var1 = 1 ]; then

		exit

	else url=$(zenity --title "Internet Metadata Searcher" --width=480 --height=320 --entry --entry-text="site.com" --text="Introduzca la URL")
		var2=$(echo $?)

		 if [ $var2 = 1 ]; then

		 exit

		 	else tipo=$(zenity --title "Internet Metadata Searcher" --width=480 --height=320 --entry --entry-text="pdf jpg doc" --text="Introduzca el tipo de fichero")
			var3=$(echo $?)

				if [ $var3 = 1 ]; then

		 		exit

		 			else #Búsqueda de resultados en google
					googler --np -n"$numero" site:"$url" filetype:"$tipo" > archivo.txt

					#Filtro uno
					grep -i "http://" archivo.txt > archivo1.txt

					#Filtro dos
					grep -i ".$tipo" archivo1.txt > fichero.txt

					#filtro tres
					cut -d "m" -f 2,3,4,5,6,7,8,9,10,12,13,14,15 fichero.txt > fichero2.txt

					#filtro cuatro
					cut -d "[" -f 1 fichero2.txt > fichero3.txt

					#filtro cinco
					sed -e 's/.$//' fichero3.txt > fichero4.txt

					#Direcciones de ficheros
					nombre=$(cat fichero4.txt)

					#Descarga de ficheros
					wget $nombre -P analist

					rm -r archivo.txt archivo1.txt fichero.txt fichero2.txt fichero3.txt fichero4.txt

					zenity --info \
					--text="Extrayendo metadatos"

					exiftool analist/* > metadatos.txt

					./options.sh

				
		fi
	fi
fi
exit 

