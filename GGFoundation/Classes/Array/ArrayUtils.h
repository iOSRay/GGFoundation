//
//  ArrayUtils.h
//
//  Version 1.3
//
//  Created by Nick Lockwood on 01/03/2012.
//  Copyright (c) 2011 Charcoal Design
//
//  Distributed under the permissive zlib License
//  Get the latest version from here:
//
//  https://github.com/nicklockwood/ArrayUtils
//
//  This software is provided 'as-is', without any express or implied
//  warranty.  In no event will the authors be held liable for any damages
//  arising from the use of this software.
//
//  Permission is granted to anyone to use this software for any purpose,
//  including commercial applications, and to alter it and redistribute it
//  freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//  claim that you wrote the original software. If you use this software
//  in a product, an acknowledgment in the product documentation would be
//  appreciated but is not required.
//
//  2. Altered source versions must be plainly marked as such, and must not be
//  misrepresented as being the original software.
//
//  3. This notice may not be removed or altered from any source distribution.
//

#import <Foundation/Foundation.h>

@interface NSArray (ArrayUtils)

- (NSArray *)arrayByRemovingObject:(id)object;
- (NSArray *)arrayByRemovingObjectAtIndex:(NSUInteger)index;
- (NSArray *)arrayByRemovingLastObject;
- (NSArray *)arrayByRemovingFirstObject;
- (NSArray *)arrayByInsertingObject:(id)object atIndex:(NSUInteger)index;
- (NSArray *)arrayByReplacingObjectAtIndex:(NSUInteger)index withObject:(id)object;
- (NSArray *)shuffledArray;
- (NSArray *)mappedArrayUsingBlock:(id (^)(id object))block;
- (NSArray *)reversedArray;
- (NSArray *)arrayByMergingObjectsFromArray:(NSArray *)array;
- (NSArray *)objectsInCommonWithArray:(NSArray *)array;
- (NSArray *)uniqueObjects;

@end

@interface NSMutableArray (ArrayUtils)

- (void)removeFirstObject;
- (void)shuffle;
- (void)reverse;
- (void)mergeObjectsFromArray:(NSArray *)array;
- (void)removeDuplicateObjects;

@end
