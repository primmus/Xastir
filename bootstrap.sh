#!/bin/sh
#
#
# Copyright (C) 2000-2012  The Xastir Group
#
#
# This simple routine will run autostuff in the appropriate
# order to generate the needed configure/makefiles
#

echo "    7) Removing autom4te.cache directory..."
rm -rf autom4te.cache

echo "    6) Running aclocal..."
aclocal

echo "    5) Running autoheader..."
autoheader

echo "    4) Running autoconf..."
autoconf

# Cygwin needs these parameters to be separate.
echo "    3) Running automake..."
automake -a -c

# Generate derived language files
echo -n "    1) Generating derived language files"
(cd config; ../scripts/langPigLatin.pl -split <language-English.sys >language-PigLatin.sys) 
echo -n "."
(cd config; ../scripts/langElmerFudd.pl -split <language-English.sys >language-ElmerFudd.sys) 
echo -n "."
(cd config; ../scripts/langMuppetsChef.pl -split <language-English.sys >language-MuppetsChef.sys) 
echo -n "."
(cd config; ../scripts/langOldeEnglish.pl -split <language-English.sys >language-OldeEnglish.sys) 
echo -n "."
(cd config; ../scripts/langPirateEnglish.pl -split <language-English.sys >language-PirateEnglish.sys) 
echo "."

echo "Bootstrap complete."


