#!/usr/bin/env bash

export LC_ALL=C
TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
BUILDDIR=${BUILDDIR:-$TOPDIR}

BINDIR=${BINDIR:-$BUILDDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

REFNETD=${REFNETD:-$BINDIR/refnetd}
REFNETCLI=${REFNETCLI:-$BINDIR/refnet-cli}
REFNETTX=${REFNETTX:-$BINDIR/refnet-tx}
WALLET_TOOL=${WALLET_TOOL:-$BINDIR/refnet-wallet}
REFNETQT=${REFNETQT:-$BINDIR/qt/refnet-qt}

[ ! -x $REFNETD ] && echo "$REFNETD not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
RFNVER=($($REFNETCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for refnetd if --version-string is not set,
# but has different outcomes for refnet-qt and refnet-cli.
echo "[COPYRIGHT]" > footer.h2m
$REFNETD --version | sed -n '1!p' >> footer.h2m

for cmd in $REFNETD $REFNETCLI $REFNETTX $WALLET_TOOL $REFNETQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${RFNVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${RFNVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
