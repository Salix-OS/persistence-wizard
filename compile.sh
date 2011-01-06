#!/bin/sh
cd $(dirname $0)
for i in `ls po/*.po`;do
	echo "Compiling `echo $i|sed "s|po/||"`"
	msgfmt $i -o `echo $i |sed "s/.po//"`.mo
done
intltool-merge po/ -d -u src/persistence-wizard.desktop.in src/persistence-wizard.desktop
intltool-merge po/ -d -u src/persistence-wizard-kde.desktop.in src/persistence-wizard-kde.desktop
