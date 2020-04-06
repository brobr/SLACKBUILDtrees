# dkms remove --all digimend/9 wont work as config has been deleted
KERNEL=$(uname -r)
if [[ -d /lib/modules/$KERNEL/extra ]]; then
    if [[ -f /lib/modules/$KERNEL/extra/hid-kye.ko ]]; then
      rm /lib/modules/$KERNEL/extra/hid-kye.ko
    fi
    if [[ -f /lib/modules/$KERNEL/extra/hid-polostar.ko ]]; then
      rm /lib/modules/$KERNEL/extra/hid-polostar.ko
    fi
    if [[ -f /lib/modules/$KERNEL/extra/hid-uclogic.ko ]]; then
      rm /lib/modules/$KERNEL/extra/hid-uclogic.ko
    fi
    if [[ -f /lib/modules/$KERNEL/extra/hid-viewsonic.ko ]]; then
      rm /lib/modules/$KERNEL/extra/hid-viewsonic.ko
    fi
    rmdir /lib/modules/$KERNEL/extra
    depmod -a
else 
    echo "Did you run 'dpkms remove --all digimend/9' before removepkg?"
    echo "If not, please reinstall pkg; ..."
    echo "do 'dpkms remove --all digimend/9' "
    echo " and then 'removepkg "
    echo "see README"
fi

if [[ -d /var/lib/dkms/digimend ]]; then
      rm -rf /var/lib/dkms/digimend/9
      if [[ -L /var/lib/dkms/digimend/kernel*-x86_64 ]]; then
        rm -f /var/lib/dkms/digimend/kernel*-x86_64
      fi
      rmdir /var/lib/dkms/digimend
fi

