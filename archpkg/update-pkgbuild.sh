#!/bin/sh

if [ -f ./arch-update-checker ]; then
	updpkgsums
else
	updpkgsums
	rm ./arch-update-checker
fi

makepkg -f