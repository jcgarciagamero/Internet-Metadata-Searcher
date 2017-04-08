#!/bin/bash

#Internet Metadata Searcher
#Author: José C. García Gamero.
#Date: 2017-03-15
#E-Mail: josecarlos@ims4c.com

eleccion=$(zenity --width=480 --height=320 --list --title "Metadatos extraidos con éxito" --column Descripción "Todos los metadatos" "Usuarios" "Software" "Directorios")
					respuesta=$(echo $?)

						if [ $respuesta = 1 ]; then

							exit

						elif [ "$eleccion" = "Todos los metadatos" ]; then
						zenity --title="Todos los metadatos encontrados" --text-info --filename="metadatos.txt"

						elif [ "$eleccion" = "Usuarios" ]; then
						grep -i "Author" metadatos.txt > usuarios.txt
						zenity --title="Usuarios encontrados" --text-info --filename="usuarios.txt"

						elif [ "$eleccion" = "Software" ]; then
						grep -i "Producer" metadatos.txt > software.txt
						zenity --title="Software" --text-info --filename="software.txt"

						elif [ "$eleccion" = "Directorios" ]; then
						grep -i "Manifest Reference File Path" metadatos.txt > directorios.txt 
						zenity --title="Directorios" --text-info --filename="directorios.txt"

						fi
				
				zenity --question \
				--text="¿Desde realizar algo más?"

				if [ $respuesta = 1 ]; then

				exit
				else 

					eleccion=$(zenity --width=480 --height=320 --list --title "Escoja una opción" --column Descripción "Nueva busqueda" "Todos los metadatos" "Usuarios" "Software" "Directorios")
					respuesta=$(echo $?)

						if [ $respuesta = 1 ]; then

							exit

						elif [ "$eleccion" = "Nueva busqueda" ]; then
						./IMS.sh

						elif [ "$eleccion" = "Todos los metadatos" ]; then
						zenity --title="Todos los metadatos encontrados" --text-info --filename="metadatos.txt"

						elif [ "$eleccion" = "Usuarios" ]; then
						grep -i "Author" metadatos.txt > usuarios.txt
						zenity --title="Usuarios encontrados" --text-info --filename="usuarios.txt"

						elif [ "$eleccion" = "Software" ]; then
						grep -i "Producer" metadatos.txt > software.txt
						zenity --title="Software" --text-info --filename="software.txt"

						elif [ "$eleccion" = "Directorios" ]; then
						grep -i "Manifest Reference File Path" metadatos.txt > directorios.txt 
						zenity --title="Directorios" --text-info --filename="directorios.txt"

						fi
				fi
				zenity --question \
				--text="¿Desde realizar algo más?"
				respuesta=$(echo $?)
				
				if [ $respuesta = 1 ]; then

				exit

				else ./options.sh

				fi 

exit
