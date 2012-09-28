//
//  TraktorLibUtilityAppDelegate.m
//  TraktorLibUtility
//
//  Created by Andrew Hughes on 4/21/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#define ACTIVEDICT keysShort

NSDictionary *keysShort3rev;
NSDictionary *keysShortBeatport;
NSDictionary *keysShortUnicodeSymbols;
NSDictionary *keysShort;
NSDictionary *keysShortRev;
NSDictionary *keysShort2Rev;
NSMutableDictionary *keysAllRev;
NSDictionary * keysLong;
NSDictionary * keysLongRev;
NSDictionary * improperKeys;
NSDictionary * beatportToShort;

#define KEYCODE_REGEXP @"1?[0-9][AB]"
#define DOUBLE_KEYCODE_REGEXP @"1?[0-9][AB]/1?[0-9][AB]"

#import "TraktorLibUtilityAppDelegate.h"

@implementation TraktorLibUtilityAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification 
{
	
	
	keysShortUnicodeSymbols = [[NSDictionary dictionaryWithObjectsAndKeys:
			 [NSString stringWithUTF8String:"g\u266F"],	@"1A", 
			 @"B",	@"1B",
			 [NSString stringWithUTF8String:"e\u266D"],	@"2A",
			 @"G",	@"2B",
			 [NSString stringWithUTF8String:"b\u266D"],	@"3A",
			 [NSString stringWithUTF8String:"D\u266D"],	@"3B",
			 @"f",	@"4A",
			 [NSString stringWithUTF8String:"A\u266D"],	@"4B",
			 @"c",	@"5A",
			 [NSString stringWithUTF8String:"E\u266D"],	@"5B",
			 @"g",	@"6A",
			 [NSString stringWithUTF8String:"B\u266D"],	@"6B",
			 @"d",	@"7A",
			 @"F",	@"7B",
			 @"a",	@"8A",
			 @"C",	@"8B",
			 @"e",	@"9A",
			 @"G",	@"9B",
			 @"b",	@"10A",
			 @"D",	@"10B",
			 [NSString stringWithUTF8String:"f\u266F"],	@"11A",
			 @"A",	@"11B",
			 [NSString stringWithUTF8String:"c\u266F"],	@"12A",
			 @"E",	@"12B",
			 nil] retain];
	
	keysShort = [[NSDictionary dictionaryWithObjectsAndKeys:
			@"g#",	@"1A", 
			@"B",	@"1B",
			@"eb",	@"2A",
			@"Gb",	@"2B",
			@"bb",	@"3A",
			@"Db",	@"3B",
			@"f",	@"4A",
			@"Ab",	@"4B",
			@"c",	@"5A",
			@"Eb",	@"5B",
			@"g",	@"6A",
			@"Bb",	@"6B",
			@"d",	@"7A",
			@"F",	@"7B",
			@"a",	@"8A",
			@"C",	@"8B",
			@"e",	@"9A",
			@"G",	@"9B",
			@"b",	@"10A",
			@"D",	@"10B",
			@"f#",	@"11A",
			@"A",	@"11B",
			@"c#",	@"12A",
			@"E",	@"12B",
			nil] retain];
	
	keysShortBeatport = [[NSDictionary dictionaryWithObjectsAndKeys:
				 @"G#m",@"1A", 
				 @"B",	@"1B",
				 @"Ebm",@"2A",
				 @"Gb",	@"2B",
				 @"Bbm",@"3A",
				 @"Db",	@"3B",
				 @"Fm",	@"4A",
				 @"Ab",	@"4B",
				 @"Cm",	@"5A",
				 @"Eb",	@"5B",
				 @"Gm",	@"6A",
				 @"Bb",	@"6B",
				 @"Dm",	@"7A",
				 @"F",	@"7B",
				 @"Am",	@"8A",
				 @"C",	@"8B",
				 @"Em",	@"9A",
				 @"G",	@"9B",
				 @"Bm",	@"10A",
				 @"D",	@"10B",
				 @"F#m",@"11A",
				 @"A",	@"11B",
				 @"C#m",@"12A",
				 @"E",	@"12B",
				 nil] retain];

	keysLong = [[NSDictionary dictionaryWithObjectsAndKeys:
				 @"G# Min",	@"1A", 
				 @"B Maj",	@"1B",
				 @"Eb Min",	@"2A",
				 @"Gb Maj",	@"2B",
				 @"Bb Min",	@"3A",
				 @"Db Maj",	@"3B",
				 @"F Min",	@"4A",
				 @"Ab Maj",	@"4B",
				 @"C Min",	@"5A",
				 @"Eb Maj",	@"5B",
				 @"G Min",	@"6A",
				 @"Bb Maj",	@"6B",
				 @"D Min",	@"7A",
				 @"F Maj",	@"7B",
				 @"A Min",	@"8A",
				 @"C Maj",	@"8B",
				 @"E Min",	@"9A",
				 @"G Maj",	@"9B",
				 @"B Min",	@"10A",
				 @"D Maj",	@"10B",
				 @"F# Min",	@"11A",
				 @"A Maj",	@"11B",
				 @"C# Min",	@"12A",
				 @"E Maj",	@"12B",
				 nil] retain];

 	beatportToShort = [[NSDictionary dictionaryWithObjectsAndKeys:
                  @"g#",	@"G#m",
                  @"B",     @"B",	
                  @"eb",	@"Ebm",
                  @"Gb",	@"Gb",	
                  @"bb",	@"Bbm",
                  @"Db",	@"Db",	
                  @"f",     @"Fm",	
                  @"Ab",	@"Ab",	
                  @"c",     @"Cm",	
                  @"Eb",	@"Eb",	
                  @"g",     @"Gm",	
                  @"Bb",	@"Bb",	
                  @"d",     @"Dm",	
                  @"F",     @"F",	
                  @"a",     @"Am",	
                  @"C",     @"C",	
                  @"e",     @"Em",	
                  @"G",     @"G",	
                  @"b",     @"Bm",	
                  @"D",     @"D",	
                  @"f#",	@"F#m",
                  @"A",     @"A",	
                  @"c#",	@"C#m",
                  @"E",     @"E",	
                  nil] retain];

    improperKeys = [[NSDictionary dictionaryWithObjectsAndKeys:
                     @"Gb",  @"F#",
                     @"G#m", @"Abm",    
                     @"Ebm", @"D#m",	
                     @"Bbm", @"A#m",	
                     @"Db",  @"C#",     
                     @"Ab",  @"G#",     
                     @"Eb",  @"D#",     
                     @"Bb",  @"A#",     
                     @"F#m", @"Gbm",	
                     @"C#m", @"Dbm",	
                     nil] retain];
    
    keysLongRev = [[NSDictionary dictionaryWithObjects: [keysLong allKeys] forKeys:[keysLong allValues]] retain];
	keysShortRev = [[NSDictionary dictionaryWithObjects: [keysShort allKeys] forKeys: [keysShort allValues]] retain];
	keysShort2Rev = [[NSDictionary dictionaryWithObjects: [keysShortUnicodeSymbols allKeys] forKeys: [keysShortUnicodeSymbols allValues]] retain];
	keysShort3rev = [[NSDictionary dictionaryWithObjects: [keysShortBeatport allKeys] forKeys: [keysShortBeatport allValues]] retain];
  
    keysAllRev = [[NSMutableDictionary alloc] init];
    [keysAllRev addEntriesFromDictionary:keysLongRev];
    [keysAllRev addEntriesFromDictionary:keysShortRev];
    [keysAllRev addEntriesFromDictionary:keysShort2Rev];
    [keysAllRev addEntriesFromDictionary:keysShort3rev];

    [cutoffDatePicker setDateValue:[NSDate date]];
    
	traktorXMLDocument = nil;
	mixedInKeyDataArrays = nil;
	
	traktorLibraryPath = [[[NSUserDefaults standardUserDefaults] stringForKey:@"traktorLibraryPath"] retain];
	mixedInKeyDatabasePath = [[[NSUserDefaults standardUserDefaults] stringForKey:@"mixedInKeyDatabasePath"] retain];
	
	if (traktorLibraryPath!=nil) [traktorLibraryPathTextField setStringValue:traktorLibraryPath];
	if (mixedInKeyDatabasePath!=nil) [mixedInKeyDatabasePathTextField setStringValue:mixedInKeyDatabasePath];
	
	//NSLog([keysShort2 description]);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
	//if (traktorXMLDocument!=nil) [traktorXMLDocument release];
    [keysAllRev release];
    [mixedInKeyDict release];
}

- (IBAction) chooseTraktorLibrary_ButtonAction:(id)sender
{
	int result;
    NSArray *fileTypes = [NSArray arrayWithObject:@"nml"];
    NSOpenPanel *oPanel = [NSOpenPanel openPanel];
	
    [oPanel setAllowsMultipleSelection:NO];
		
    result = [oPanel runModalForDirectory:NSHomeDirectory()
									 file:nil types:fileTypes];
    if (result == NSOKButton) {
        NSArray *filesToOpen = [oPanel filenames];
		traktorLibraryPath = [[filesToOpen objectAtIndex:0] retain];
		
		[traktorLibraryPathTextField setStringValue:traktorLibraryPath];
		
		[[NSUserDefaults standardUserDefaults] setValue:traktorLibraryPath forKey:@"traktorLibraryPath"];

	}

}

- (void) loadTraktorLibary
{
	NSURL * url = [[NSURL fileURLWithPath:traktorLibraryPath] retain];
	NSError *theError = nil;
	
	traktorXMLDocument = [[NSXMLDocument alloc] initWithContentsOfURL:url options:NSXMLNodePreserveAll error:&theError];
	
	if (traktorXMLDocument == nil || theError != nil) {
		NSAlert *theAlert = [NSAlert alertWithError:theError];
		[theAlert runModal];
	}
	
}

- (IBAction) chooseMixedInKeyDatabase_ButtonAction:(id)sender
{
	int result;
    NSArray *fileTypes = [NSArray arrayWithObject:@"csv"];
    NSOpenPanel *oPanel = [NSOpenPanel openPanel];
	
    [oPanel setAllowsMultipleSelection:NO];
    result = [oPanel runModalForDirectory:NSHomeDirectory()
									 file:nil types:fileTypes];
    if (result == NSOKButton) {
        NSArray *filesToOpen = [oPanel filenames];
		
		mixedInKeyDatabasePath = [[filesToOpen objectAtIndex:0] retain];
		
		[mixedInKeyDatabasePathTextField setStringValue:mixedInKeyDatabasePath];
		
		[[NSUserDefaults standardUserDefaults] setValue:mixedInKeyDatabasePath forKey:@"mixedInKeyDatabasePath"];
	}
	
}

- (void) loadMixedInKeyData
{

	NSError *theError = nil;

	NSStringEncoding * enc = nil;

	NSString * string = [NSString stringWithContentsOfFile:mixedInKeyDatabasePath usedEncoding:enc error:&theError];
	
	if (string == nil || theError != nil) {
		NSAlert *theAlert = [NSAlert alertWithError:theError];
		[theAlert runModal];
	}
    
	mixedInKeyDataArrays = [[string csvRows] retain];

	NSLog(@"MixedInKey Data Loaded, num. rows = %d", (int)[mixedInKeyDataArrays count]);
	NSLog(@"%@",[mixedInKeyDataArrays description]);
    
    NSMutableArray * keys = [[[NSMutableArray alloc] init] autorelease];
    
    NSEnumerator * etr = [mixedInKeyDataArrays objectEnumerator];
    NSArray * next;
    
    while (next = [etr nextObject]) {
        [keys addObject:[mixedInKeyDataArrays objectAtIndex:FILE_NAME]];
    }
    
    mixedInKeyDict = [[NSMutableDictionary dictionaryWithObjects:mixedInKeyDataArrays forKeys:keys]retain];
    
}



- (IBAction)go_ButtonAction:(id)sender {
    
    [self loadMixedInKeyData];
    
    NSError *theError=nil;

    // load traktor xml library file
    [self loadTraktorLibary];    
    
    // setup logging convenience string ref
	NSMutableString * logString = [[logTextView textStorage] mutableString];
    
    // get the cutoff date from the date picker
    NSDate * cutoffDate = [cutoffDatePicker dateValue];
    
    [logString appendFormat:@"Cutoff Date is: %@\n", [cutoffDate description]];
    
    // create and configure the date formatter
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd"]; 
    
    // xPath string to retrieve all the INFO nodes
    NSString * xPathString = [NSString stringWithFormat:@".//COLLECTION/ENTRY/INFO"];
    
    NSArray * tracksToProcessNodes;

    // retrieve the INFO nodes
    tracksToProcessNodes = [traktorXMLDocument nodesForXPath:xPathString error:&theError];

    // make sure there's no error during the XML read
    if (theError != nil) {
        NSAlert *theAlert = [NSAlert alertWithError:theError];
        [theAlert runModal];
    }

    NSEnumerator * etr = [tracksToProcessNodes objectEnumerator];
    NSXMLNode * next;
    NSXMLElement * location, * info, * comment, * keyLyrics, * key;
    NSString * fileName;
    NSString * importDateString;
    NSDate * importDate;
    NSArray * nodes;
    NSMutableArray * entryNodesToProcess = [[[NSMutableArray alloc] init] autorelease];
    
    while (next = [etr nextObject])
    {
        
        importDateString = [[next attributeForName:@"IMPORT_DATE"] stringValue];
        
        importDate = [dateFormatter dateFromString:importDateString];
        
        if (importDate == nil) {
            continue;         
        }
        
        //[logString appendFormat:@"--import date is: %@\n", [importDate description]];

        
        if ([importDate compare:cutoffDate] == NSOrderedDescending) 
        {
            [entryNodesToProcess addObject:[next parent]];
            
            nodes = [[next parent] nodesForXPath:@"./LOCATION" error:&theError];
                        
            if (theError != nil) {
                NSAlert *theAlert = [NSAlert alertWithError:theError];
                [theAlert runModal];
            }
       
            location = [nodes objectAtIndex:0];
          
            fileName = [[location attributeForName:@"FILE"] stringValue];
            
            //[logString appendFormat:@"%@ found, will be processed...\n", fileName];
            
       }
        
     }
    
    if ([entryNodesToProcess count] == 0) return;
    
    etr = [entryNodesToProcess objectEnumerator];
    
    NSString * camelotKeyString, * keyString;
    
    while (next = [etr nextObject]) 
    {
        
        nodes = [next nodesForXPath:@"./LOCATION" error:&theError];
        
        if (theError != nil) {
            NSAlert *theAlert = [NSAlert alertWithError:theError];
            [theAlert runModal];
        }
        
        location = [nodes objectAtIndex:0];
        
        fileName = [[location attributeForName:@"FILE"] stringValue];

        NSLog(@"Starting to process %@", fileName);
        [logString appendFormat:@"\nStarting to process %@\n", fileName];
        
        
        // we've retrieved the location node (of the entry node), so let's get the parent and then get the INFO node
		nodes = [next nodesForXPath:@"./INFO" error:&theError];
		
		// reality check
		if (theError != nil) {
			NSAlert *theAlert = [NSAlert alertWithError:theError];
			[theAlert runModal];
		}
        
        info = [nodes objectAtIndex:0];
                
        key = (NSXMLElement*)[info attributeForName:@"KEY"];
        
        keyString = [((NSXMLNode*)key) stringValue];
        
        if (key == nil || keyString == nil) {
         
            NSArray * mixedInKeyEntry = [mixedInKeyDict valueForKey:fileName];
            
            if (mixedInKeyEntry) {
                NSLog(@"---checking mixed in key database for key info.");
                [logString appendString:@"---checking mixed in key database for key info.\n"];
               
                keyString = [mixedInKeyEntry objectAtIndex:SONG_KEY];
            }
            else {
                NSLog(@"***no key found, skipping.");
                [logString appendString:@"---no key found, skipping.\n"];
                continue;                
            }
            
        }
        
        if ([improperKeys valueForKey:keyString] != nil)
        {
            keyString = [improperKeys valueForKey:keyString];
        }
        
        NSLog(@"---keyString = %@", keyString);
        [logString appendFormat:@"---keyString = %@\n", keyString];
       
        // convert beatport key strings to camelot key
        camelotKeyString = [keysAllRev valueForKey:keyString];
                
        if (!camelotKeyString) {
            NSLog(@"***can't map to camelot key code, skipping.");
            [logString appendString:@"***can't map to camelot key code, skipping.\n"];
            continue;           
        }
        
        NSLog(@"---camelotKeyString = %@", camelotKeyString);
        [logString appendFormat:@"---camelotKeyString = %@\n", camelotKeyString];
        
        // KEY_LYRICS
		
		keyLyrics = (NSXMLElement*)[info attributeForName:@"KEY_LYRICS"];
		
		if (keyLyrics != nil)
		{
			[info removeAttributeForName:@"KEY_LYRICS"];
		}
		
		[info addAttribute:[NSXMLNode attributeWithName:@"KEY_LYRICS" stringValue:camelotKeyString]];

        
        // FIX KEY
        
        @try 
        {
            keyString = GetKeyForCode(camelotKeyString);
        
        } 
        @catch (NSException * ex) 
        {
            NSLog(@"***Improper key code!");
            return;
        }
        
        NSAssert(keyString != NULL, @"keyString cannot be nil!");
        
        [info removeAttributeForName:@"KEY"];
        [info addAttribute:[NSXMLNode attributeWithName:@"KEY" stringValue:keyString]];

        [logString appendFormat:@"---final keyString = %@\n", keyString];
        NSLog(@"---final keyString = %@\n", keyString);
        
        // CLEAR COMMENT
        
		// should only be one INFO, so just get the first node
		info = (NSXMLElement*)[nodes objectAtIndex:0];
        
        comment = (NSXMLElement*)[info attributeForName:@"COMMENT"];
        
        [comment setStringValue:@""];
        
    
        [logString appendFormat:@"---PROCESSED(%@)\n", fileName];
        NSLog(@"---%@ processed...\n", fileName);
       
    }
    
    /*

    // Path to the backup file
	NSString * backupPath = [NSString stringWithFormat:@"%@.bak",traktorLibraryPath];
	
	// If the backup file already exists, move the previous version to the trash
	if ([[NSFileManager defaultManager] fileExistsAtPath:backupPath])
	{
		NSInteger * notUsed;
		[[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation 
													 source:[backupPath stringByDeletingLastPathComponent]  
												destination:@"" 
													  files:[NSArray arrayWithObject:[backupPath lastPathComponent]] 
														tag:notUsed];
	}
	
	// Make the new backup file
	[[NSFileManager defaultManager] moveItemAtPath:traktorLibraryPath toPath:backupPath error:&theError];
    
	if (theError != nil) {
		NSAlert *theAlert = [NSAlert alertWithError:theError];
		[theAlert runModal];
		return;
	}
	    
	[[traktorXMLDocument XMLData] writeToFile:traktorLibraryPath atomically:YES];
    */
    
    NSLog(@"Done");

}

- (IBAction) go_ButtonAction2:(id)sender
{
	[self loadTraktorLibary];
	
	[self loadMixedInKeyData];
	
	NSMutableString * logString = [[logTextView textStorage] mutableString];
	
	NSString * curFileName;
	NSArray * nodes;
	NSXMLElement * node;
	NSXMLNode * attribute=nil;
	NSError *theError=nil;
	NSString * xPathString;
    
    int numItemsToProcess = [mixedInKeyDataArrays count];

	// Iterate through all files in mixedInKeyDataArrays, skipping first one
	
    [progressIndicator setMaxValue:(double)[mixedInKeyDataArrays count]];
    [progressIndicator setDoubleValue:0.0];
    
    [logString appendFormat:@"Processing %d items.", numItemsToProcess];
    [[logTextView enclosingScrollView] display];

    
	int i;
	for(i=1;i<[mixedInKeyDataArrays count];i++)
	{
		
        [progressIndicator setDoubleValue:(double)i];
        [progressIndicator displayIfNeeded];
        
        
		// Current file name from the Mixed in Key database
		curFileName = [[mixedInKeyDataArrays objectAtIndex:i] objectAtIndex:FILE_NAME];
		
		curFileName = [curFileName stringByReplacingOccurrencesOfString:@"&" withString:@"&amp;"];
		
		// the xPath string to get the file entry from the XML Traktor library
		xPathString = [NSString stringWithFormat:@".//COLLECTION/ENTRY/LOCATION[@FILE=\"%@\"]", curFileName];
		
		//NSLog(curFileName);
		
		// Write the current file name to the log window
		[logString appendFormat:@"%@\n", curFileName]; 		
											 
		// get the XML nodes for the current file
		nodes = [traktorXMLDocument nodesForXPath:xPathString error:&theError];
		
		// if we don't find file in the Traktor library, log it and continue
		if ([nodes count] == 0 ) {
			
			//[logString appendString:@"\tFile not found in Traktor library.\n"];
			//[logString appendString:@"\n\n"];		

			continue;
		}
		
		// make sure there's no error during the XML read
		if (theError != nil) {
			NSAlert *theAlert = [NSAlert alertWithError:theError];
			[theAlert runModal];
		}
	
		// we've retrieved the location node (of the entry node), so let's get the parent and then get the INFO node
		nodes = [[[nodes objectAtIndex:0] parent] nodesForXPath:@"./INFO" error:&theError];
		
		// reality check
		if (theError != nil) {
			NSAlert *theAlert = [NSAlert alertWithError:theError];
			[theAlert runModal];
		}

		// should only be one INFO, so just get the first node
		node = (NSXMLElement*)[nodes objectAtIndex:0];
		
		
		// GENRE
		
		attribute = [node attributeForName:@"GENRE"];
		
		if (attribute != nil)
		{
			if ([[attribute stringValue] rangeOfString:@"Sample"].location != NSNotFound)
			{
				//[logString appendString:@"\tSample file, skipping.\n"];
				//[logString appendString:@"\n\n"];		
				
				continue;
			}
		}
		
		//NSString regexp = @"[1-12
		
		// GENERATE KEY STRINGS
		// - keyCodeString = Camelot Key system: 1A, 2B, 5A, etc...
		// - keyString = normal key abbreviations
		
		NSString * keyCodeString = [[mixedInKeyDataArrays objectAtIndex:i] objectAtIndex:SONG_KEY];
		
		NSString * keyString = GetKeyForCode(keyCodeString);

		
		/// KEY
		
		attribute = [node attributeForName:@"KEY"];
		
		if (attribute != nil)
		{
			[node removeAttributeForName:@"KEY"];
		}
				
		//[logString appendFormat:@"\t%@ - %@\n", keyCodeString, keyString]; 		
		
		
		[node addAttribute:[NSXMLNode attributeWithName:@"KEY" stringValue:keyString]];
		
		
		// CATALOG_NO
		
		attribute = [node attributeForName:@"CATALOG_NO"];

		if (attribute != nil)
		{
			[node removeAttributeForName:@"CATALOG_NO"];
		}
		
		//[node addAttribute:[NSXMLNode attributeWithName:@"CATALOG_NO" stringValue:temp]];

		
		// KEY_LYRICS
		
		attribute = [node attributeForName:@"KEY_LYRICS"];
		
		if (attribute != nil)
		{
			[node removeAttributeForName:@"KEY_LYRICS"];
		}
		
		[node addAttribute:[NSXMLNode attributeWithName:@"KEY_LYRICS" stringValue:keyCodeString]];
		
		
		// Get the parent node (of the INFO) to get the ENTRY, so we can add the key to the end of the title
		node = [node parent];

		attribute = [node attributeForName:@"TITLE"];
		
		NSString * title = [attribute stringValue];
		
		// if there is a title attribute and it does not already contain the key code
		if (attribute != nil && !ContainsKeyCode(title))
		{
			[node removeAttributeForName:@"TITLE"];
			[node addAttribute:[NSXMLNode attributeWithName:@"TITLE" stringValue:[NSString stringWithFormat:@"%@ - %@", title, keyCodeString]]];
		}
		
		//[logString appendFormat:@"Title changed from: %@\n", title];
		//[logString appendFormat:@"                to: %@ - %@\n", title, keyCodeString]; 
			
		// FINISH OFF THE LOG
		
		//[logString appendString:@"\n	\n"];		
		
		//[[logTextView enclosingScrollView] display];
		//NSRect rect = [logTextView frame];
		//[logTextView scrollPoint:NSMakePoint(rect.origin.x, rect.origin.y + rect.size.height)];
		
		/*
		attribute = [node attributeForName:@"COMMENT"];
		
		if (attribute != nil)
		{
			[node removeAttributeForName:@"COMMENT"];
		}
		
		[node addAttribute:[NSXMLNode attributeWithName:@"COMMENT" stringValue:CleanComment([attribute stringValue])]];

		*/
	}
	
	// Path to the backup file
	NSString * backupPath = [NSString stringWithFormat:@"%@.bak",traktorLibraryPath];
	
	// If the backup file already exists, move the previous version to the trash
	if ([[NSFileManager defaultManager] fileExistsAtPath:backupPath])
	{
		NSInteger * notUsed;
		[[NSWorkspace sharedWorkspace] performFileOperation:NSWorkspaceRecycleOperation 
													 source:[backupPath stringByDeletingLastPathComponent]  
												destination:@"" 
													  files:[NSArray arrayWithObject:[backupPath lastPathComponent]] 
														tag:notUsed];
	}
	
	// Make the new backup file
	[[NSFileManager defaultManager] moveItemAtPath:traktorLibraryPath toPath:backupPath error:&theError];

	if (theError != nil) {
		NSAlert *theAlert = [NSAlert alertWithError:theError];
		[theAlert runModal];
		return;
	}
	
    [progressIndicator setDoubleValue:0.0];

	[[traktorXMLDocument XMLData] writeToFile:traktorLibraryPath atomically:YES];
    
    NSLog(@"Done");
	
}

BOOL ContainsKeyCode(NSString * string)
{
	NSArray * keyCodes = [keysShort allKeys];
	
	NSEnumerator * etr = [keyCodes objectEnumerator];
	NSString * nextKey;
	
	NSRange result;
	
	while(nextKey = [etr nextObject])
	{
		result = [string rangeOfString:nextKey];
		
		if (result.location != NSNotFound)
		{
			return TRUE;
		}
		
	}
	
	return FALSE;
	
}

NSString * CleanComment(NSString * comment)
{
	NSMutableArray * parts = [[[comment componentsSeparatedByString:@" - "] mutableCopy] autorelease];

	if ([parts count] == 1)
	{
		return CleanComment_helper(comment);
	}
	else
	{
		return [parts lastObject];
	}
	
}

NSString * CleanComment_helper(NSString * uncleanedString)
{
	NSMutableString * string = [[uncleanedString mutableCopy] autorelease];
	
	NSEnumerator * etr = [[keysShort allKeys] reverseObjectEnumerator];
	
	NSString * nextKeyCode;
	
	NSRange result;
	
	NSLog(@"uncleanedComment = \'%@\'", uncleanedString);
	
	while (nextKeyCode = [etr nextObject])
	{
		result = [string rangeOfString:nextKeyCode];
		
		if (result.location != NSNotFound)
		{
			string = [[[string stringByReplacingCharactersInRange:result withString:@""] mutableCopy] autorelease];
			
			if ([string length] == 0)
			{
				NSLog(@"cleanedComment = \'%@\'", string);
				return string;
			}
			
			NSLog(@"string = \'%@\', result.location = %d", string, result.location);
			
			if (result.location < [string length] && [string characterAtIndex:result.location] == '/')
				string = [[[string stringByReplacingCharactersInRange:NSMakeRange(result.location, 1) withString:@""] mutableCopy] autorelease];
		}
	}
	
	NSLog(@"cleanedComment = \'%@\'", string);
	
	return string;
}

NSString * FormatCode(NSString * code)
{
	// split the key code by the "/" separator
	NSMutableArray * codes = [[[code componentsSeparatedByString:@"/"] mutableCopy] autorelease];

	if ([codes count] == 1)
	{
		if ([[codes objectAtIndex:0] length] == 2) [codes replaceObjectAtIndex:0 withObject:[NSString stringWithFormat:@"%@", [codes objectAtIndex:0]]];
		return [codes objectAtIndex:0];
	}
	else if ([codes count] == 2)
	{
		return code;
	}
	else {
		return code;
	}

	//return [codes componentsJoinedByString:@"/"];

}	

NSString * GetKeyForCode(NSString * code)
{
	// split the key code by the "/" separator
	NSArray * codes = [code componentsSeparatedByString:@"/"];
	
	// if there is only one key, just translate that and return it
	if ([codes count] == 1)
	{
		return FormatKey(GetKeyForCode_helper(code), 1);
	}
	// an array to hold the translated keys
	NSMutableArray * keys = [[[NSMutableArray alloc] init] autorelease];
	
	// enumerate through the keys and translate them
	NSEnumerator * etr = [codes objectEnumerator];
	NSString * next;
	while (next = [etr nextObject])
	{
		[keys addObject:FormatKey(GetKeyForCode_helper(next),2)];
	}

	// re-join the keys and return them
	return [keys componentsJoinedByString:@"/"];
}

NSString * FormatKey(NSString * key, int numKeys)
{
	if (numKeys == 2) return key;
	else {
		if ([key length] == 1) return [NSString stringWithFormat:@"%@", key];
		else return key;
	}

}

NSString * GetKeyForCode_helper(NSString * code)
{
	
	NSString * result;
	result = [keysShortUnicodeSymbols objectForKey:code];
	
	if (result == nil) [NSException raise:@"No key for key code!" format:@"code = %@", code];
	
	return result;
}


/*

NSString * GetKeyForCode(NSString * code)
{
	// split the key code by the "/" separator
	NSArray * codes = [code componentsSeparatedByString:@"/"];
	
	// if there is only one key, just translate that and return it
	if ([codes count] == 1) return GetKeyForCode_helper(code);
	
	// an array to hold the translated keys
	NSMutableArray * keys = [[[NSMutableArray alloc] init] autorelease];
	
	// enumerate through the keys and translate them
	NSEnumerator * etr = [codes objectEnumerator];
	NSString * next;
	while (next = [etr nextObject])
	{
		[keys addObject:GetKeyForCode_helper(next)];
	}
	
	// re-join the keys and return them
	return [keys componentsJoinedByString:@" / "];
}

NSString * GetKeyForCode_helper(NSString * code)
{
	
	if ([code isEqualTo:@"1A"])
	{
		return @"G# Minor";
	}
	else if ([code isEqualTo:@"1B"]	)
	{
		return @"B Major";
	}
	else if ([code isEqualTo: @"2A"])
	{
		return @"F# Major";
	}
	else if ([code isEqualTo: @"2B"])
	{
		return @"D# Minor";
	}
	else if ([code isEqualTo:@"3A"])
	{
		return @"Bb Minor";
	}
	else if ([code isEqualTo:@"3B"])
	{
		return @"Db Major";
	}
	else if ([code isEqualTo:@"4A"])
	{
		return @"F Minor";
	}
	else if ([code isEqualTo:@"4B"])
	{
		return @"Ab Major";
	}
	else if ([code isEqualTo:@"5A"])
	{
		return @"C Minor";
	}
	else if ([code isEqualTo:@"5B"])
	{
		return @"Eb Major";
	}
	else if ([code isEqualTo:@"6A"])
	{
		return @"G Minor";
	}
	else if ([code isEqualTo:@"6B"])
	{
		return @"Bb Major";
	}
	else if ([code isEqualTo:@"7A"])
	{
		return @"D Minor";
	}
	else if ([code isEqualTo:@"7B"])
	{
		return @"F Major";
	}
	else if ([code isEqualTo:@"8A"])
	{
		return @"A Minor";
	}
	else if ([code isEqualTo:@"8B"])
	{
		return @"C Major";
	}
	else if ([code isEqualTo:@"9A"])
	{
		return @"E Minor";
	}
	else if ([code isEqualTo:@"9B"])
	{
		return @"G Major";
	}
	else if ([code isEqualTo:@"10A"])
	{
		return @"B Minor";
	}
	else if ([code isEqualTo:@"10B"])
	{
		return @"D Major";
	}
	else if ([code isEqualTo:@"11A"])
	{
		return @"F# Minor";
	}
	else if ([code isEqualTo:@"11B"])
	{
		return @"A Major";
	}
	else if ([code isEqualTo:@"12A"])
	{
		return @"C# Minor";
	}
	else if ([code isEqualTo:@"12B"])
	{
		return @"E Major";
	}
	else 
	{
		NSLog(@"This shouldn't happen! Key code not found!");
		return nil;
	}
	
	
}
*/

@end
