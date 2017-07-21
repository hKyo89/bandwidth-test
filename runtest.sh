#!/bin/sh

BASEDIR=$(dirname "$0")
TMP=$BASEDIR/tmp

rm -rf $TMP
mkdir $TMP

echo "Bandwidth Test"
echo "=============="
echo ""

echo ""
echo "***** 1/3 'git clone' test ************************"
echo ""

GIT=`which git`
time git clone https://github.com/hkyo89/bandwidth-test-github $TMP/github

echo ""
echo "***** 2/3 'yarn add' test *************************"
echo ""

git clone https://github.com/hkyo89/bandwidth-test-yarn $TMP/yarn
cd $TMP/yarn
YARN=`which yarn`
$YARN cache clean
time $YARN
cd $BASEDIR

echo ""
echo "***** 3/3 'curl' test *****************************"
echo ""

time curl https://releases.hashicorp.com/vagrant/1.9.7/vagrant_1.9.7_x86_64.dmg -o $TMP/vagrant.dmg

rm -rf $TMP
echo ""
echo "done"
echo ""
