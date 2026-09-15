#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>

static void PXLog(NSString *format, ...)
{
    va_list args;
    va_start(args, format);

    NSString *message =
        [[NSString alloc] initWithFormat:format arguments:args];

    va_end(args);

    NSLog(@"[Pixel1Photos] %@", message);
}

%ctor
{
    @autoreleasepool
    {
        PXLog(@"================================");
        PXLog(@"Pixel1Photos loaded");
        PXLog(@"Google Photos process injected");
        PXLog(@"================================");

        UIDevice *device = UIDevice.currentDevice;

        PXLog(@"model = %@", device.model);
        PXLog(@"localizedModel = %@", device.localizedModel);
        PXLog(@"systemName = %@", device.systemName);
        PXLog(@"systemVersion = %@", device.systemVersion);

        struct utsname info;

        if (uname(&info) == 0)
        {
            PXLog(@"machine = %s", info.machine);
            PXLog(@"sysname = %s", info.sysname);
            PXLog(@"release = %s", info.release);
        }
    }
}
