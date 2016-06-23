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


/**
 *  (1)copy是创建一个新对象，retain是创建一个指针，引用计数对象加1。copy属性表示两个对象内容相同，新的对象啊retain为1，与旧有对象的引用计数无关，旧有对象没有变化。copy减少对象对上下文的依赖。
    (2)retain属性表示两个对象地址相同（建立一个指针，指针拷贝），内容当然相同，这个对象的retain值+1。也就是说，retain是指针拷贝，copy是内容拷贝。
    (3)当然在iOS中并不是所有的对象都支持copy，mutableCopy,遵守NSCopying协议的类可以发送copy消息，遵守NSMutableCopying协议的类才可以发送mutableCopy消息。否则就会发生崩溃。

    (4)[array addObject:obj];
       这样，obj的引用计数会+1，使用remove则obj的引用计数会-1.
 
      id temp = [array objectAtIndex:0];
      [array removeObjectAtIndex:0];
      如果这个时候还要用temp,就会报错。因为temp已经被释放了。
 */
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
    NSMutableString *string5 = [string1 mutableCopy]; // 深拷贝

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
    NSMutableString *string5 = [string1 mutableCopy]; // 深拷贝

    NSLog(@"string1 = %d;string2 = %d",string1,string2);
    NSLog(@"string1 = %d;string3 = %d",string1,string3);
    NSLog(@"string1 = %d;string4 = %d",string1,string4);
    NSLog(@"string1 = %d;string5 = %d",string1,string5);
#endif

#if 1
    // 如果是一个MutableString，那么无论是copy，mutableCopy，都会创建一个新对象。
    NSMutableString *string1 = [NSMutableString stringWithString:@"helloworld"];
    NSString *string2 = [string1 copy]; // 深拷贝
    NSString *string3 = [string1 mutableCopy]; // 深拷贝
    NSMutableString *string4 = [string1 copy]; // 深拷贝
    NSMutableString *string5 = [string1 mutableCopy]; // 深拷贝

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

#if 0
    // 这里打印出的是"Jack",而不是"Jack and Mary".说明这里的person.name是重新创建了新的字符串
    // 注意这里的person.name的属性是copy，而不是strong。因为这里的otherName是可变的，所以创建新的字符串

    // 如果person.name设置为strong，那么就是浅拷贝。
    // 为什么使用strong就是浅拷贝呢？因为strong会持有原来的对象，使原来的对象的引用计数+1，其实就是指针拷贝。
    NSMutableString *otherName = [[NSMutableString alloc] initWithString:@"Jack"];
    Person *person = [[Person alloc] init];
    person.name = otherName;
    person.age = 23;

    [otherName appendString:@" and Mary"];
    NSLog(@"person.name = %@",person.name);
#endif












}

@end







