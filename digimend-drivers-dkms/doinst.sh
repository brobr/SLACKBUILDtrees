config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

config usr/share/X11/xorg.conf.d/50-digimend.conf.new
config etc/X11/xorg.conf.d/50-digimend.conf.new

#https://websetnet.net/build-kernel-module-dkms-linux/
dkms add -m digimend -v 9
dkms build -m digimend/9
dkms install -m digimend/9
modprobe -r hid-kye hid-uclogic hid-polostar hid-viewsonic
