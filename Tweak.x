#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>

static void PX1Log(NSString *format, ...)
{
    va_list args;
    va_start(args, format);

    NSString *msg =
        [[NSString alloc] initWithFormat:format arguments:args];

    va_end(args);

    NSLog(@"[Pixel1Photos] %@", msg);
}

%hook UIDevice

- (NSString *)model
{
    NSString *value = %orig;

    PX1Log(@"UIDevice.model = %@", value);

    return value;
}

- (NSString *)localizedModel
{
    NSString *value = %orig;

    PX1Log(@"UIDevice.localizedModel = %@", value);

    return value;
}

- (NSString *)systemName
{
    NSString *value = %orig;

    PX1Log(@"UIDevice.systemName = %@", value);

    return value;
}

- (NSString *)systemVersion
{
    NSString *value = %orig;

    PX1Log(@"UIDevice.systemVersion = %@", value);

    return value;
}

%end


%ctor
{
    @autoreleasepool
    {
        PX1Log(@"==============================");
        PX1Log(@"Pixel1Photos loaded");
        PX1Log(@"==============================");

        UIDevice *device =
            [UIDevice currentDevice];

        PX1Log(@"Model: %@", device.model);
        PX1Log(@"System: %@", device.systemName);
        PX1Log(@"Version: %@", device.systemVersion);

        struct utsname info;

        if (uname(&info) == 0)
        {
            PX1Log(@"machine: %s", info.machine);
            PX1Log(@"sysname: %s", info.sysname);
            PX1Log(@"release: %s", info.release);
        }
    }
}
