//
//  TraktorLibUtilityAppDelegate.h
//  TraktorLibUtility
//
//  Created by Andrew Hughes on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSStringParsingCategory.h"

#define LIBRARY_NAME 0
#define FILE_NAME 1
#define SONG_KEY 2
#define SONG_BPM 3

@interface TraktorLibUtilityAppDelegate : NSObject <NSApplicationDelegate,NSTableViewDataSource> {
    NSWindow *window;

	IBOutlet NSTextField *traktorLibraryPathTextField;
	IBOutlet NSTextField *mixedInKeyDatabasePathTextField;
    IBOutlet NSProgressIndicator *progressIndicator;
	
    IBOutlet NSDatePicker * cutoffDatePicker;
    
	IBOutlet NSTextView * logTextView;
    
    IBOutlet NSTableView * trackTable;
	
	NSString *traktorLibraryPath;
	NSString *mixedInKeyDatabasePath;
	
	NSXMLDocument * traktorXMLDocument;
	NSArray * mixedInKeyDataArrays;
    NSDictionary * mixedInKeyDict;
    
    NSMutableArray * filteredEntryNodes;
    NSMutableArray * entryNodes;
    
    NSDateFormatter * dateFormatter;

}

@property (assign) IBOutlet NSWindow *window;

- (IBAction) chooseTraktorLibrary_ButtonAction:(id)sender;
- (IBAction) chooseMixedInKeyDatabase_ButtonAction:(id)sender;
- (IBAction) go_ButtonAction:(id)sender;
- (IBAction) loadMixedInKeyData:(id)sender;
- (IBAction) loadTraktorLibary:(id)sender;
- (IBAction) filterByDate:(id)sender;
- (IBAction)verifyKeysMatch:(id)sender;
-(IBAction)findImproperKeys:(id)sender;
-(IBAction)fixImproperKeys:(id)sender;
- (IBAction)addKeyCodesToTitles:(id)sender;
- (IBAction)showAll:(id)sender ;
-(IBAction)saveToTraktorLibrary:(id)sender;

- (void) loadTraktorLibary;
- (void) loadMixedInKeyData;

//- (NSString*) getKeyForCode:(NSString *)code;
//- (NSString*) getKeyForCode_helper:(NSString*)code;

BOOL ContainsKeyCode(NSString * string);
NSString * GetKeyForCode(NSString * code);
NSString * GetKeyForCode_helper(NSString * code);
NSString * FormatCode(NSString * code);
NSString * FormatKey(NSString * key, int numKeys);
NSString * CleanComment(NSString * comment);
NSString * CleanComment_helper(NSString * uncleanedString);


@end
