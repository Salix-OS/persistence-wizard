#!/bin/sh

cd $(dirname $0)
./compile.sh
mkdir -p pkg
export DESTDIR=$PWD/pkg
./install.sh
VER=$(grep '^version=' src/persistence-wizard-cli | head -n 1 | sed "s/^version=['\"]\?\(.*\)['\"]\?$/\1/")
RLZ=$(cat release)
cd pkg
PKGNAME=persistence-wizard
#       |-----handy-ruler------------------------------------------------------|
cat <<EOF > install/slack-desc
$PKGNAME: Persistence Wizard
$PKGNAME:
$PKGNAME: It consists of two tools (one graphical, one CLI), to help create
$PKGNAME: a persistent file in order to use it for SaLT LiveCD.
$PKGNAME: This persistent file is used to save the changes made in the live
$PKGNAME: environment uppon reboot.
$PKGNAME:
$PKGNAME:
$PKGNAME:
$PKGNAME:
$PKGNAME:
EOF
makepkg -l y -c n ../$PKGNAME-$VER-noarch-$RLZ.txz
cd ..
md5sum $PKGNAME-$VER-noarch-$RLZ.txz > $PKGNAME-$VER-noarch-$RLZ.md5
echo -n 'coreutils,findutils,gawk,gettext,grep,procps,util-linux-ng,xfsprogs,zenity' > $PKGNAME-$VER-noarch-$RLZ.dep
rm -rf pkg
