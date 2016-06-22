//
//  ViewController.m
//  ShallowAndDeepCopy
//
//  Created by chenyufeng on 6/22/16.
//  Copyright © 2016 chenyufengweb. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

#if 0
    // 字符串是直接赋值的，右侧如果是copy,那么就是浅拷贝；右侧如果是mutableCopy,那么就是深拷贝。
    NSString *string1 = @"helloworld";
    NSString *string2 = [string1 copy]; // 浅拷贝
    NSString *string3 = [string1 mutableCopy]; // 深拷贝
    NSMutableString *string4 = [string1 copy]; // 浅拷贝
    NSMutableString *string5 = [string1 mutableCopy]; // 浅拷贝

    NSLog(@"string1 = %d;string2 = %d",string1,string2);
    NSLog(@"string1 = %d;string3 = %d",string1,string3);
    NSLog(@"string1 = %d;string4 = %d",string1,string4);
    NSLog(@"string1 = %d;string5 = %d",string1,string5);
#endif

#if 0
    // 结果同上。右侧如果是copy,那么就是浅拷贝；右侧如果是mutableCopy,那么就是深拷贝。
    NSString *string1 = [NSString stringWithFormat:@"helloworld"];
    NSString *string2 = [string1 copy]; // 浅拷贝
    NSString *string3 = [string1 mutableCopy]; // 深拷贝
    NSMutableString *string4 = [string1 copy]; // 浅拷贝
    NSMutableString *string5 = [string1 mutableCopy]; // 浅拷贝

    NSLog(@"string1 = %d;string2 = %d",string1,string2);
    NSLog(@"string1 = %d;string3 = %d",string1,string3);
    NSLog(@"string1 = %d;string4 = %d",string1,string4);
    NSLog(@"string1 = %d;string5 = %d",string1,string5);
#endif

#if 0
    // 如果是一个MutableString，那么无论是copy，mutableCopy，都会创建一个新对象。
    NSMutableString *string1 = [NSMutableString stringWithString:@"helloworld"];
    NSString *string2 = [string1 copy]; // 浅拷贝
    NSString *string3 = [string1 mutableCopy]; // 深拷贝
    NSMutableString *string4 = [string1 copy]; // 浅拷贝
    NSMutableString *string5 = [string1 mutableCopy]; // 浅拷贝

    NSLog(@"string1 = %d;string2 = %d",string1,string2);
    NSLog(@"string1 = %d;string3 = %d",string1,string3);
    NSLog(@"string1 = %d;string4 = %d",string1,string4);
    NSLog(@"string1 = %d;string5 = %d",string1,string5);
#endif

#if 0
    // Person类必须实现copyWithZone和mutableCopyWithZone方法。
    Person *person = [[Person alloc] init];
    person.name = @"Jack";
    person.age = 23;

    Person *copyPerson = [person copy]; // 深拷贝
    Person *mutableCopyPerson = [person mutableCopy]; // 深拷贝
    NSLog(@"person = %d;copyPerson = %d",person,copyPerson);
    NSLog(@"person = %d;mutableCopyPerson = %d",person,mutableCopyPerson);
#endif

#if 1
    // 这里打印出的是"Jack",而不是"Jack and Mary".说明这里的person.name是重新创建了新的字符串
    // 注意这里的person.name的属性是copy，而不是strong。因为这里的otherName是可变的，所以创建新的字符串

    // 如果person.name设置为strong，那么就是浅拷贝
    NSMutableString *otherName = [[NSMutableString alloc] initWithString:@"Jack"];
    Person *person = [[Person alloc] init];
    person.name = otherName;
    person.age = 23;

    [otherName appendString:@" and Mary"];
    NSLog(@"person.name = %@",person.name);
#endif









}

@end







