//
//  SGMapKitDemoAppDelegate.m
//  SGMapKit
//
//  Copyright (c) 2009-2010, SimpleGeo
//  All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without 
//  modification, are permitted provided that the following conditions are met:
//
//  Redistributions of source code must retain the above copyright notice, 
//  this list of conditions and the following disclaimer. Redistributions 
//  in binary form must reproduce the above copyright notice, this list of
//  conditions and the following disclaimer in the documentation and/or 
//  other materials provided with the distribution.
//  
//  Neither the name of the SimpleGeo nor the names of its contributors may
//  be used to endorse or promote products derived from this software 
//  without specific prior written permission.
//   
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
//  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
//  IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
//  ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS 
//  BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
//  CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE 
//  GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
//  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, 
//  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//  Created by Derek Smith.
//

#import "SGMapKitDemoAppDelegate.h"
#import "SGMainViewController.h"

@implementation SGMapKitDemoAppDelegate
@synthesize window;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions 
{   
    NSBundle* mainBundle = [NSBundle mainBundle];
    NSString* path = [mainBundle pathForResource:@"Token" ofType:@"plist"];
    NSDictionary* token = [NSDictionary dictionaryWithContentsOfFile:path];
    NSString* layer = [[NSDictionary dictionaryWithContentsOfFile:path] objectForKey:@"layer"];            
    
    SGLocationService* locationService = [SGLocationService sharedLocationService];
    SGOAuth* oAuth = [[SGOAuth alloc] initWithKey:[token objectForKey:@"key"] secret:[token objectForKey:@"secret"]];        
    locationService.HTTPAuthorizer = oAuth;
    
    SGMainViewController* mvc = [[[SGMainViewController alloc] initWithLayer:layer] autorelease];
    UINavigationController* nvc = [[UINavigationController alloc] initWithRootViewController:mvc];
    [window addSubview:nvc.view];
    [window makeKeyAndVisible];

	return YES;
}

- (void) dealloc
{	
 	[window release];
	[super dealloc];
}


@end

