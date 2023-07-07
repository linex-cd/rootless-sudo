#!/bin/bash

#编译二进制
gcc src/rlsudo.c -o build/rlsudo

#配置服务
cat service/rlsudo.service > build/DEBIAN/rlsudo.service 
cat service/start_rlsudo.sh > build/DEBIAN/start_rlsudo.sh

chmod +x build/DEBIAN/start_rlsudo.sh

cat service/install.sh > build/DEBIAN/postinst
cat service/remove.sh > build/DEBIAN/prerm


chmod +x build/DEBIAN/postinst
chmod +x build/DEBIAN/prerm

#打包
INSDIR=/opt
cp build $INSDIR/
dpkg-deb --build $INSDIR/build
#rm -rf $INSDIR/build
#mv $INSDIR/rlsudo_1.0-1.deb ./