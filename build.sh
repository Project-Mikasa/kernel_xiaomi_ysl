rm -rf ~/tool
git clone https://github.com/Hatsune71/toolchain-4.9 --depth=1 ~/tool
export ARCH=arm64
export CROSS_COMPILE=~/tool/bin/aarch64-linux-android-
mkdir output
make -C $(pwd) O=output ysl_defconfig
make -j$(nproc --all) -C $(pwd) O=output
git clone https://github.com/Hatsune71/AnyKernel3.git --depth=1 zip
cp -r output/arch/arm64/boot/Image.gz-dtb zip/
cd zip
mv Image.gz-dtb zImage 
zip -r Mikasa-Reborn.zip *
