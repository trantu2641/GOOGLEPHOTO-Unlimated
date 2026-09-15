#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>

@interface RootListController : PSListController
@end

@implementation RootListController

- (instancetype)init
{
    self = [super init];

    if (self)
    {
        self.title = @"Pixel1Photos";
    }

    return self;
}

- (NSArray *)specifiers
{
    if (!_specifiers)
    {
        _specifiers =
            [self loadSpecifiersFromPlistName:@"Root"
                                       target:self];
    }

    return _specifiers;
}

@end
