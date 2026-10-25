#CONFIGURATION
defconfig_path=arch/arm64/configs/vendor/fog_defconfig # Must be edited
defconfig=vendor/fog_defconfig # Must be edited




#Nomount driver
echo "CONFIG_NOMOUNT=y" >> $defconfig_path
curl https://raw.githubusercontent.com/maxsteeel/nomount/refs/heads/dev/kernel/setup.sh | bash -

make O=out ARCH=arm64 $defconfig; printf "n\n2\n\n\n\nY\n" | make -j$(nproc --all) CC=clang O=out ARCH=arm64 LLVM=1 LLVM_IAS=1 LD=ld.lld AS=llvm-as AR=llvm-ar NM=llvm-nm OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf STRIP=llvm-strip
