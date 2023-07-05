#!/bin/bash

#编译二进制


#配置服务


chmod +x DEBIAN/postinst DEBIAN/prerm

#打包
dpkg-deb --build mysudo