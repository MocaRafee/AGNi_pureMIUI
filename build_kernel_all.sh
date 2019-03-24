#!/bin/sh
export KERNELDIR=`readlink -f .`
cd $KERNELDIR;
COUT="/mnt/ANDROID/COMPILED_OUT"

rm -rf BUILT_*
rm $COUT/.config $COUT/.config.old

echo "-----------------------------------------------------------------------"
echo " "
echo "          BATCH MODE: Building AGNi whyred MIUI-O variant..."
./build_kernel_whyred_miuiO.sh || exit 1
rm $COUT/.config $COUT/.config.old
echo " "
echo "          BATCH MODE: Built AGNi whyred MIUI-O variant!!!"
echo "-----------------------------------------------------------------------"
echo " "

echo "-----------------------------------------------------------------------"
echo " "
echo "          BATCH MODE: Building AGNi whyred MIUI-O f2fs variant..."
./build_kernel_whyred_miuiO-f2fs.sh || exit 1
rm $COUT/.config $COUT/.config.old
echo " "
echo "          BATCH MODE: Built AGNi whyred MIUI-O f2fs variant!!!"
echo "-----------------------------------------------------------------------"
echo " "

echo "-----------------------------------------------------------------------"
echo " "
echo "          BATCH MODE: Building AGNi whyred Pie variant..."
./build_kernel_whyred_pie.sh || exit 1
rm $COUT/.config $COUT/.config.old
echo " "
echo "          BATCH MODE: Built AGNi whyred Pie variant!!!"
echo "-----------------------------------------------------------------------"
echo " "

echo " "
echo "-----------------------------------------------------------------------"
echo " "
echo "          BATCH MODE: Building AGNi MIUI-O tulip variant..."
./build_kernel_tulip_miuiO.sh || exit 1
rm $COUT/.config $COUT/.config.old
echo " "
echo "          BATCH MODE: Built AGNi MIUI-O tulip variant!!!"
echo "-----------------------------------------------------------------------"
echo " "

echo " "
echo "-----------------------------------------------------------------------"
echo " "
echo "          BATCH MODE: Building AGNi MIUI-P tulip variant..."
./build_kernel_tulip_miuiP.sh || exit 1
rm $COUT/.config $COUT/.config.old
echo " "
echo "          BATCH MODE: Built AGNi MIUI-P tulip variant!!!"
echo "-----------------------------------------------------------------------"
echo " "

echo "-----------------------------------------------------------------------"
echo " "
echo "          BATCH MODE: Building AGNi tulip PIE variant..."
./build_kernel_tulip_pie.sh || exit 1
rm $COUT/.config $COUT/.config.old
echo " "
echo "          BATCH MODE: Built AGNi tulip PIE variant!!!"
echo "-----------------------------------------------------------------------"
echo " "

echo "          BATCH MODE: Built ALL variants !!!"

