#!/bin/sh
# mark flag
flag=1
# init string which will be printed
str=""
for((i=1,j=2;$flag!=0;i++,j++))
do
	# foreground color
	fgcolor=$(rainbarf|cut -d']' -f$i|cut -d'[' -f2|cut -d'=' -f2|cut -d',' -f1)
	# background color
	bgcolor=$(rainbarf|cut -d']' -f$i|cut -d'[' -f2|cut -d'=' -f3)
	# green fg
	if [[ $fgcolor == "green" ]]; then
		clr="^c#5af78e^"
		str=$str$clr
	# red fg
	elif [[ $fgcolor == "red" ]]; then
		clr="^c#ff5c57^"
		str=$str$clr
	# yellow fg
	elif [[ $fgcolor == "yellow" ]]; then
		clr="^c#f3f99d^"
		str=$str$clr
	# blue fg
	elif [[ $fgcolor == "blue" ]]; then
		clr="^c#57c7ff^"
		str=$str$clr
	elif [[ $fgcolor == "default" ]]; then
		clr="^c#f8f8f2^"
		str=$str$clr
	else
		str=$str
	fi

	if [[ $bgcolor == "green" ]]; then
		clr="^c#5af78e^"
		str=$str$clr
	# red bg
	elif [[ $bgcolor == "red" ]]; then
		clr="^c#ff5c57^"
		str=$str$clr
	# yellow bg
	elif [[ $bgcolor == "yellow" ]]; then
		clr="^c#f3f99d^"
		str=$str$clr
	# blue bg
	elif [[ $bgcolor == "blue" ]]; then
		clr="^c#57c7ff^"
		str=$str$clr
	elif [[ $bgcolor == "default" ]]; then
		clr="^c#282a36^"
		str=$str$clr
	else
		str=$str
	fi
	line=$(rainbarf|cut -d']' -f$j|cut -d'#' -f1)
	str=$str$line

	# end mark
	if [[ $fgcolor == "default" && $bgcolor == "default" ]]; then
		flag=0;
	fi
done
printf $str
