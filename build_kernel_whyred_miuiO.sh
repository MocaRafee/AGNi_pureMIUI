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
mkdir -p out

echo ""
echo " Cross-compiling AGNi pureMIUI kernel whyred..."
echo ""

cd $KERNELDIR/

if [ ! -f $KERNELDIR/out/.config ];
then
    make defconfig O=out ARCH=arm64 agni_whyred-miui_defconfig
fi

make -j3 O=out ARCH=arm64

rm -rf $KERNELDIR/BUILT_whyred-miui
mkdir -p $KERNELDIR/BUILT_whyred-miui

#find -name '*.ko' -exec mv -v {} $KERNELDIR/BUILT_whyred-miui/system/lib/modules \;

#mv $KERNELDIR/out/arch/arm64/boot/Image.*-dtb $KERNELDIR/BUILT_whyred-miui/
mv $KERNELDIR/out/arch/arm64/boot/Image.*-dtb $KERNELDIR/BUILT_whyred-miui/zImage

echo ""
echo "AGNi pureMIUI has been built for whyred !!!"

