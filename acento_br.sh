#!/bin/bash
#
#	Coloca no texto passado como argumento
#	os acentos da lingua brasileira
#	de acordo com os combos escritos
#

##
# ACENTO	= COMBO UTILIZADO NO TEXTO
#
#	ã 	=	~a
#	â 	=	^a
#	à 	=	`a
#	á 	=	'a
#	ê 	=	^e
#	é 	=	'e
#	í 	=	'i 
#	õ 	=	~o
#	ô 	=	^o
#	ó 	=	'o
#	ú 	=	'u
#	ü 	=	`u
#	ç 	=	'c

FILE="$1"

if [ "${FILE}" == "" ]; then
	echo ""
	echo "You must provide the filename."
	echo "USAGE:"
	echo -e "\t${0} <filename>"
	echo ""
	exit 1
fi

if [ ! -f "${FILE}" ]; then
	echo "File does not exist."
	exit 1
fi

# Backing Up
cp -f "${FILE}" /tmp/"$(basename "${FILE}")".bkp

# As
perl -p -i -e "s/\'a/á/g" "${FILE}"
perl -p -i -e "s/\'A/Á/g" "${FILE}"
perl -p -i -e "s/\`a/à/g" "${FILE}"
perl -p -i -e "s/\`A/À/g" "${FILE}"
perl -p -i -e "s/~a/ã/g"  "${FILE}"
perl -p -i -e "s/\^a/â/g" "${FILE}"

# Es
perl -p -i -e "s/\^e/ê/g" "${FILE}"
perl -p -i -e "s/\'e/é/g" "${FILE}"
perl -p -i -e "s/\'E/É/g" "${FILE}"

# Is
perl -p -i -e "s/\'i/í/g" "${FILE}"
perl -p -i -e "s/\'I/Í/g" "${FILE}"

# Os
perl -p -i -e "s/\'o/ó/g" "${FILE}"
perl -p -i -e "s/\'O/Ó/g" "${FILE}"
perl -p -i -e "s/~o/õ/g"  "${FILE}"
perl -p -i -e "s/\^o/ô/g" "${FILE}"

# Us
perl -p -i -e "s/\'u/ú/g" "${FILE}"
perl -p -i -e "s/\'U/ú/g" "${FILE}"
perl -p -i -e "s/\`u/ü/g" "${FILE}"

# Cs
perl -p -i -e "s/\'c/ç/g" "${FILE}"

