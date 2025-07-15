#!/usr/bin/env bash

GREEN='\033[0;32m'
YELLOW='\033[1;93m'
RED='\033[1;91m'
NOCOLOR='\033[0m'

LANG_EN=("[copying arch-update-checker to /usr/local/bin]" "[arch-update-checker copied]" "Done." "Error: some dependencies are not installed" "Warning: without 'aurutils' package you won't be able to check updates from AUR")
LANG_RU=("[копирование arch-update-checker в /usr/local/bin]" "[arch-update-checker скопирован]" "Готово." "Ошибка: не установлены зависимости" "Предупреждение: для проверки обновлений в AUR требуется пакет 'aurutils'")
SCRIPT_LANG=("${LANG_EN[@]}")

if [[ "$(echo $LANG | grep --color=never ru_)" == "" ]]; then
	SCRIPT_LANG=("${LANG_EN[@]}")

else
	SCRIPT_LANG=("${LANG_RU[@]}")
fi

if ! [[ "$(pacman -Qi libnotify pacman-contrib wget 1>/dev/null; echo $?)" == "0" ]]; then
    echo -e "${RED}${SCRIPT_LANG[3]}${NOCOLOR}"; exit 1
fi

if ! [[ "$(pacman -Qi aurutils 1>/dev/null; echo $?)" == "0" ]]; then
    echo -e "${YELLOW}${SCRIPT_LANG[4]}${NOCOLOR}"
fi

copy_root(){
	echo ""

	echo -e "${SCRIPT_LANG[0]}"
	cp -f ./arch-update-checker /usr/local/bin/arch-update-checker && chmod +x /usr/local/bin/arch-update-checker && echo -e "${GREEN}${SCRIPT_LANG[1]}${NOCOLOR}"
	echo -e "${GREEN}${SCRIPT_LANG[2]}\n${NOCOLOR}"
}

copy(){
	echo ""
	echo -e "${SCRIPT_LANG[0]}"
	sudo cp -f ./arch-update-checker /usr/local/bin/arch-update-checker && sudo chmod +x /usr/local/bin/arch-update-checker && echo -e "${GREEN}${SCRIPT_LANG[1]}${NOCOLOR}"
	echo -e "${GREEN}${SCRIPT_LANG[2]}\n${NOCOLOR}"
}


if [[ ${UID} -eq 0 ]]; then
	copy_root
else
	copy
fi
