#!/usr/bin/env bash

BLUE='\033[0;34m'
GREEN='\033[0;32m'
NOCOLOR='\033[0m'

LANG_EN=("[copying arch-update-checker to /usr/local/bin]" "[arch-update-checker copied]" "Done.")
LANG_RU=("[копирование arch-update-checker в /usr/local/bin]" "[arch-update-checker скопирован]" "Готово.")
SCRIPT_LANG=("${LANG_EN[@]}")

if [[ "$(echo $LANG | grep --color=never ru_)" == "" ]]; then
	SCRIPT_LANG=("${LANG_EN[@]}")

else
	SCRIPT_LANG=("${LANG_RU[@]}")
fi

copy_root(){
	echo ""

	echo -e "${BLUE}${SCRIPT_LANG[0]}${NOCOLOR}"
	cp -f ./arch-update-checker /usr/local/bin/arch-update-checker && echo -e "${GREEN}${SCRIPT_LANG[1]}${NOCOLOR}"
	echo -e "${GREEN}${SCRIPT_LANG[2]}\n${NOCOLOR}"
}

copy(){
	echo ""
	echo -e "${BLUE}${SCRIPT_LANG[0]}${NOCOLOR}"
	sudo cp -f ./arch-update-checker /usr/local/bin/arch-update-checker && echo -e "${GREEN}${SCRIPT_LANG[1]}${NOCOLOR}"
	echo -e "${GREEN}${SCRIPT_LANG[2]}\n${NOCOLOR}"
}


if [[ ${UID} -eq 0 ]]; then
	copy_root
else
	copy
fi
