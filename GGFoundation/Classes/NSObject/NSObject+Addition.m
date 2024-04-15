//
//  NSObject+Addition.m
//  Beansmile
//
//  Created by John on 16/5/21.
//

#import "NSObject+Addition.h"

@implementation NSObject (Addition)

- (id)removeNullValue{
    if ([self isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *tmp = [NSMutableDictionary dictionaryWithDictionary:self];
        [[[tmp allKeys] mutableCopy] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            id value = [tmp valueForKey:obj];
            if ([value isEqual:[NSNull null]]) {
                [tmp removeObjectForKey:obj];
            }else if ([value isKindOfClass:[NSDictionary class]] || [value isKindOfClass:[NSArray class]]){
                id child = [value removeNullValue];
                [tmp setValue:child forKey:obj];
            }
        }];
        return tmp;
    }else if ([self isKindOfClass:[NSArray class]]){
        NSMutableArray *tmp = [NSMutableArray arrayWithArray:self];
        [[tmp mutableCopy] enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            id newObj = [obj removeNullValue];
            if ([obj removeNullValue]) {
                NSInteger newIndex = [tmp indexOfObject:obj];
                if (newObj!=NSNotFound) {
                    [tmp replaceObjectAtIndex:newIndex withObject:newObj];
                }
            }else{
                [tmp removeObjectAtIndex:idx];
            }
        }];
        return tmp;
    }else if ([self isKindOfClass:[NSNull class]]){
        return nil;
    }
    return self;
}

@end
