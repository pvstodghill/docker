#! /bin/bash

PKG=mauve_2.3.1
NAME=mauve
. ~/shared/src/common.bash

# ------------------------------------------------------------------------

rm -rf $BUILD
tar -z -x -f mauve_linux_2.3.1.tar.gz -C $TMP
cd $BUILD

# ------------------------------------------------------------------------

install -d $DEST/share/doc/$PKG
install COPYING  ChangeLog.html README  mauve_user_guide.pdf $DEST/share/doc/$PKG
install -d $DEST/bin
install mauveAligner  progressiveMauve $DEST/bin
install -d $DEST/lib/mauve/ext
install Mauve.jar $DEST/lib/mauve
install ext/*.jar $DEST/lib/mauve/ext

echo '#!/bin/bash' > $DEST/bin/Mauve
echo java '$JVM_FLAGS' -DmauveDir=$DEST/lib/mauve -jar $DEST/lib/mauve/Mauve.jar '"$@"' >> $DEST/bin/Mauve
chmod +x $DEST/bin/Mauve


# ------------------------------------------------------------------------

require $PKG
