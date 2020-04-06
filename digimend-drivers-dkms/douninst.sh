# dkms remove --all digimend/9 wont work as config has been deleted
KERNEL=$(uname -r)

if [[ -d /lib/modules/$KERNEL/extra ]]; then
    echo "removing digimend modules from /lib/modules/$KERNEL/extra..."
    if [[ -e /lib/modules/$KERNEL/extra/hid-kye.ko ]]; then
      echo " removing hid-kye.ko"
      rm /lib/modules/$KERNEL/extra/hid-kye.ko
    fi
    if [[ -e /lib/modules/$KERNEL/extra/hid-polostar.ko ]]; then
      echo " removing hid-polostar.ko"
      rm /lib/modules/$KERNEL/extra/hid-polostar.ko
    fi
    if [[ -e /lib/modules/$KERNEL/extra/hid-uclogic.ko ]]; then
      echo " removing hid-uclogic.ko"
      rm /lib/modules/$KERNEL/extra/hid-uclogic.ko
    fi
    if [[ -e /lib/modules/$KERNEL/extra/hid-viewsonic.ko ]]; then
      echo " removing hid-viewsonic.ko"
      rm /lib/modules/$KERNEL/extra/hid-viewsonic.ko
    fi
    echo " removing /lib/modules/$KERNEL/extra.."
    rmdir /lib/modules/$KERNEL/extra
    depmod -a
elif [[ ! -d /lib/modules/$KERNEL/extra ]]; then
    echo "no kernel modules to remove"
else 
    echo "Something did not go well"
    echo "Please reinstall pkg; then run:"
    echo "'dpkms remove --all digimend/9' "
    echo " and then removepkg again"
    echo "see README"
fi


if [[ -d /var/lib/dkms/digimend ]]; then
      echo "removing digimend build-tree from /var/lib/dkms/..."
      rm -rf /var/lib/dkms/digimend/9
      DANGLY=$(find /var/lib/dkms/digimend -xtype l)
      if [[ -L $DANGLY ]] ; then
        echo " removing dead symlink"
        rm -f $DANGLY
      fi
      echo " removing /var/lib/dkms/digimend.."
      rmdir /var/lib/dkms/digimend
fi

