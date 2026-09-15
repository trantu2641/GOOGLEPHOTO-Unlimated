TARGET := iphone:clang:16.5:15.0

ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Pixel1Photos

Pixel1Photos_FILES = Tweak.x
Pixel1Photos_CFLAGS = -fobjc-arc
Pixel1Photos_FRAMEWORKS = UIKit Foundation

Pixel1Photos_PRIVATE_FRAMEWORKS = Preferences

Pixel1Photos_CFLAGS += -DPX1_ROOTLESS

include $(THEOS_MAKE_PATH)/tweak.mk

BUNDLE_NAME = Pixel1PhotosPrefs

Pixel1PhotosPrefs_FILES = Preferences/RootListController.m
Pixel1PhotosPrefs_FRAMEWORKS = UIKit Foundation
Pixel1PhotosPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

after-install::
	install.exec "killall -9 Photos 2>/dev/null || true"
