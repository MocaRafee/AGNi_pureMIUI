#!/bin/sh
export KERNELDIR=`readlink -f .`
if [ -f ~/WORKING_DIRECTORY/AGNi_stamp.sh ];
	then
	. ~/WORKING_DIRECTORY/AGNi_stamp.sh
fi
if [ -f ~/WORKING_DIRECTORY/gcc-8.x-uber_aarch64.sh ];
	then
	. ~/WORKING_DIRECTORY/gcc-8.x-uber_aarch64.sh
fi

export ARCH=arm64
export SUBARCH=arm64
mkdir -p /media/psndna88/ANDROID/COMPILED_OUT

echo ""
echo " Cross-compiling AGNi pureMIUI kernel tulip..."
echo ""

cd $KERNELDIR/

if [ ! -f /media/psndna88/ANDROID/COMPILED_OUT/.config ];
then
    make defconfig O=/media/psndna88/ANDROID/COMPILED_OUT ARCH=arm64 agni_tulip-miui_defconfig
fi

make -j3 O=/media/psndna88/ANDROID/COMPILED_OUT ARCH=arm64

rm -rf $KERNELDIR/BUILT_tulip-miui
mkdir -p $KERNELDIR/BUILT_tulip-miui

#find -name '*.ko' -exec mv -v {} $KERNELDIR/BUILT_tulip-miui/system/lib/modules \;

mv /media/psndna88/ANDROID/COMPILED_OUT/arch/arm64/boot/Image.*-dtb $KERNELDIR/BUILT_tulip-miui/zImage

echo ""
echo "AGNi pureMIUI has been built for tulip !!!"

