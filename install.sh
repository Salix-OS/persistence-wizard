#!/bin/sh

VER=$(grep '^version=' src/persistence-wizard-cli | head -n 1 | sed "s/^version=['\"]\?\(.*\)['\"]\?$/\1/")

cd $(dirname $0)
PKGNAME=persistence-wizard
install -d -m 755 $DESTDIR/usr/doc/$PKGNAME-$VER
install -d -m 755 $DESTDIR/install
install -d -m 755 $DESTDIR/usr/sbin
install -d -m 755 $DESTDIR/usr/share/applications
install -d -m 755 $DESTDIR/usr/share/icons/hicolor/128x128/apps
install -d -m 755 $DESTDIR/usr/share/icons/hicolor/scalable/apps

install -m 755 src/$PKGNAME-cli $DESTDIR/usr/sbin/$PKGNAME-cli
install -m 755 src/$PKGNAME $DESTDIR/usr/sbin/$PKGNAME
install -m 644 src/$PKGNAME.desktop $DESTDIR/usr/share/applications/
install -m 644 src/$PKGNAME-kde.desktop $DESTDIR/usr/share/applications/
install -m 644 icons/$PKGNAME-128.png $DESTDIR/usr/share/icons/hicolor/128x128/apps/$PKGNAME.png
install -m 644 icons/$PKGNAME.svg $DESTDIR/usr/share/icons/hicolor/scalable/apps/

for i in `ls po/*.mo|sed "s|po/\(.*\).mo|\1|"`; do
	install -d -m 755 $DESTDIR/usr/share/locale/${i}/LC_MESSAGES
	install -m 644 po/${i}.mo $DESTDIR/usr/share/locale/${i}/LC_MESSAGES/$PKGNAME.mo
done

for i in `ls docs`; do
	install -m 644 docs/${i} $DESTDIR/usr/doc/$PKGNAME-$VER/
done
