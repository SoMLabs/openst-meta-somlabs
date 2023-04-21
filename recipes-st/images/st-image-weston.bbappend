IMAGE_INSTALL += " \
    led-udev \
    gstreamer1.0 \
    gstreamer1.0-plugins-good \
"

CORE_IMAGE_EXTRA_INSTALL:remove = " packagegroup-st-demo"
IMAGE_ROOTFS_MAXSIZE = "850000"
