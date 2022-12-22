inherit populate_sdk_qt5

IMAGE_INSTALL += " \
    led-udev \
    qtbase-dev \
    qtbase-mkspecs \
    qtbase-tools \
    qtdeclarative-qmlplugins \
    qtquickcontrols2-qmlplugins \
    qtwayland \
    gstreamer1.0 \
    gstreamer1.0-plugins-good \
"

CORE_IMAGE_EXTRA_INSTALL:remove = " packagegroup-st-demo"
IMAGE_ROOTFS_MAXSIZE = "850000"
