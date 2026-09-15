THEOS ?= /home/runner/theos

SDK := $(THEOS)/sdks/iPhoneOS16.5.sdk
CLANG := $(THEOS)/toolchain/linux/iphone/bin/clang
LDID := $(THEOS)/toolchain/linux/iphone/bin/ldid

ARCH := arm64
MIN_IOS := 15.0

CFLAGS := \
	-target arm64-apple-ios$(MIN_IOS) \
	-isysroot $(SDK) \
	-fobjc-arc \
	-fblocks \
	-O2 \
	-Wall \
	-Wextra

LDFLAGS := \
	-target arm64-apple-ios$(MIN_IOS) \
	-isysroot $(SDK) \
	-dynamiclib \
	-framework Foundation \
	-framework UIKit

OUT := Pixel1Photos.dylib

.PHONY: all clean

all: $(OUT)

$(OUT): Tweak.x
	$(CLANG) $(CFLAGS) \
	$(LDFLAGS) \
	Tweak.x \
	-o $(OUT)

clean:
	rm -f $(OUT)
	rm -rf .theos
