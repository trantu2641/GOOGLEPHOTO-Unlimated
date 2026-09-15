#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <sys/sysctl.h>
#import <sys/utsname.h>
#import <objc/runtime.h>

#pragma mark - Configuration

static BOOL PX1Enabled = YES;

static NSString * const PX1Model = @"Pixel";
static NSString * const PX1Device = @"sailfish";
static NSString * const PX1Product = @"sailfish";
static NSString * const PX1Brand = @"google";
static NSString * const PX1Manufacturer = @"Google";

#pragma mark - Logging

static void PX1Log(NSString *format, ...)
{
    va_list args;
    va_start(args, format);

    NSString *message =
        [[NSString alloc] initWithFormat:format arguments:args];

    va_end(args);

    NSLog(@"[Pixel1Photos] %@", message);
}

#pragma mark - UIDevice

%hook UIDevice

- (NSString *)model
{
    if (!PX1Enabled)
        return %orig;

    PX1Log(@"UIDevice model -> %@", PX1Model);

    return PX1Model;
}

- (NSString *)localizedModel
{
    if (!PX1Enabled)
        return %orig;

    return PX1Model;
}

%end

#pragma mark - Process information

%hook NSProcessInfo

- (NSDictionary *)environment
{
    NSDictionary *original = %orig;

    if (!PX1Enabled)
        return original;

    NSMutableDictionary *env =
        [original mutableCopy];

    /*
     * Research-only metadata.
     *
     * We intentionally do not overwrite arbitrary
     * environment variables yet.
     */

    PX1Log(@"NSProcessInfo environment queried");

    return env;
}

%end

#pragma mark - Startup

%ctor
{
    @autoreleasepool
    {
        PX1Log(@"================================");
        PX1Log(@"Pixel1Photos RootHide loaded");
        PX1Log(@"Target: Google Photos");
        PX1Log(@"Profile: Google Pixel 1");
        PX1Log(@"Device: %@", PX1Device);
        PX1Log(@"Product: %@", PX1Product);
        PX1Log(@"================================");
    }
}
