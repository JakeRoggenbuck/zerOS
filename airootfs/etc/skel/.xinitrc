#!/bin/sh
case $WM in
bspwm)
	exec bspwm
	;;
twm)
	exec twm
	;;
*)
	exec twm
	;;
esac
