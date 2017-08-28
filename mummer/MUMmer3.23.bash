#! /bin/bash -x

VERS=3.23

PKG=mummer-${VERS}
NAME=mummer

unrequire $PKG

. ~/shared/src/common.bash

# ------------------------------------------------------------------------

rm -rf $BUILD
tar -z -x -f MUMmer${VERS}.tar.gz -C $TMP || exit 1
mv $TMP/MUMmer${VERS} $BUILD
cd $BUILD

# ------------------------------------------------------------------------

mkdir -p $DEST/bin $DEST/lib
cp --archive $BUILD $DEST/lib/mummer
cd $DEST/lib/mummer

make check || exit 1
make all  || exit 1

cd $DEST/bin
ln -s ../lib/mummer/dnadiff .
ln -s ../lib/mummer/exact-tandems .
ln -s ../lib/mummer/mapview .
ln -s ../lib/mummer/mummerplot .
ln -s ../lib/mummer/nucmer .
ln -s ../lib/mummer/nucmer2xfig .
ln -s ../lib/mummer/promer .
ln -s ../lib/mummer/run-mummer1 .
ln -s ../lib/mummer/run-mummer3 .
ln -s ../lib/mummer/show-diff .
ln -s ../lib/mummer/show-snps .
ln -s ../lib/mummer/show-tiling .
ln -s ../lib/mummer/show-coords .
ln -s ../lib/mummer/repeat-match .
ln -s ../lib/mummer/show-aligns .
ln -s ../lib/mummer/aux_bin .
ln -s ../lib/mummer/delta-filter .
ln -s ../lib/mummer/gaps .
ln -s ../lib/mummer/mgaps .
ln -s ../lib/mummer/combineMUMs .
ln -s ../lib/mummer/annotate .
ln -s ../lib/mummer/mummer .

# ------------------------------------------------------------------------

require $PKG
