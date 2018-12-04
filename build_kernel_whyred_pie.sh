#!/bin/sh
export KERNELDIR=`readlink -f .`
. ~/WORKING_DIRECTORY/AGNi_stamp.sh
#. ~/WORKING_DIRECTORY/gcc-4.9-uber_aarch64.sh
#. ~/WORKING_DIRECTORY/gcc-6.x-uber_aarch64.sh
#. ~/WORKING_DIRECTORY/gcc-7.3.1_linaro_aarch64.sh
. ~/WORKING_DIRECTORY/gcc-8.x-uber_aarch64.sh

export ARCH=arm64
export SUBARCH=arm64
mkdir -p out

echo ""
echo " Cross-compiling AGNi purePIE kernel whyred..."
echo ""

cd $KERNELDIR/

if [ ! -f $KERNELDIR/out/.config ];
then
    make defconfig O=out ARCH=arm64 agni_whyred-pie_defconfig
fi

make -j3 O=out ARCH=arm64

rm -rf $KERNELDIR/BUILT_kenzo-pie
mkdir -p $KERNELDIR/BUILT_kenzo-pie

#find -name '*.ko' -exec mv -v {} $KERNELDIR/BUILT_kenzo-pie/system/lib/modules \;

#mv $KERNELDIR/out/arch/arm64/boot/Image.*-dtb $KERNELDIR/BUILT_kenzo-pie/
mv $KERNELDIR/out/arch/arm64/boot/Image.*-dtb $KERNELDIR/BUILT_kenzo-pie/

echo ""
echo "AGNi purePIE has been built for whyred !!!"

