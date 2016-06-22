//
//  Person.m
//  ShallowAndDeepCopy
//
//  Created by chenyufeng on 6/22/16.
//  Copyright © 2016 chenyufengweb. All rights reserved.
//

#import "Person.h"

@interface Person()<NSCopying, NSMutableCopying>

@end

@implementation Person

// 对应copy方法
- (id)copyWithZone:(NSZone *)zone
{
    Person *person = [[Person allocWithZone:zone] init];
    person.name = self.name; // 这里的self就是被copy的对象
    person.age = self.age;
    return person;
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    Person *person = [[Person allocWithZone:zone] init];
    person.name = self.name;
    person.age = self.age;
    return person;
}


@end
