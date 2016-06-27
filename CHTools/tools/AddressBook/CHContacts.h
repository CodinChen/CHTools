//
//  CHContacts.h
//  CHAddressBook
//
//  Created by xunlian on 16/6/21.
//  Copyright © 2016年 xunlian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AddressBook/AddressBook.h>

@interface CHContacts : NSObject

@property (nonatomic , copy) NSString *ID;//删除时使用

@property (nonatomic ,copy) NSString *firstName;//名：
@property (nonatomic ,copy) NSString *lastName;//姓：
@property (nonatomic ,copy) NSString *fullName;//lastName + firstName 

@property (nonatomic ,strong) NSArray *phoneList;//手机号列表
/**
 *  手机号标签
 *  工作、住宅、iPhone、手机、主要、住宅传真、工作传真、传呼、其他
 */
@property (nonatomic ,copy) NSString *workNum;//工作
@property (nonatomic ,copy) NSString *homeNum;//住宅
@property (nonatomic ,copy) NSString *iPhoneNum;//iPhone
@property (nonatomic ,copy) NSString *mobileNum;//手机
@property (nonatomic ,copy) NSString *mainNum;//主要
@property (nonatomic ,copy) NSString *HomeFAXNum;//住宅传真
@property (nonatomic ,copy) NSString *workFAXNum;//工作传真
@property (nonatomic ,copy) NSString *pagerNum;//传呼
@property (nonatomic ,copy) NSString *otherNum;//其他


@property (nonatomic ,copy) NSString *email;
@property (nonatomic ,copy) NSString *organization;//公司
@property (nonatomic ,copy) NSString *department;
@property (nonatomic ,copy) NSString *creationDate;


//通过系统返回通讯录记录对象创建
+ (instancetype)initWithRecord:(ABRecordRef)record;

//保存至通讯录
- (void)saveToAddressBook:(ABAddressBookRef)addressBook;

- (void)removeFromAddressBook:(ABAddressBookRef)addressBook;


@end

/*
 -(void)viewDidLoad {
 [super viewDidLoad];
 //初始化地址簿引用实例
 CFErrorRef creationError;
 self.addressBook = ABAddressBookCreateWithOptions(NULL, &creationError);
 if(_addressBook==NULL){
 NSLog(@"AddressBook create Error:%@",creationError);
 return;
 }
 
 
 switch (ABAddressBookGetAuthorizationStatus()){
 case  kABAuthorizationStatusAuthorized:
 [self accessAddressBook];
 break;
 
 case  kABAuthorizationStatusNotDetermined :
 [self requestAccessAddressBook:_addressBook];
 break;
 
 case  kABAuthorizationStatusDenied:
 case  kABAuthorizationStatusRestricted:
 {
 NSLog(@"Denied!!");
 }
 }
 self.tableView.rowHeight = 60;
 self.tableView.tableFooterView = [UIView new];
 
 }
 
 
 
 -(void)requestAccessAddressBook:(ABAddressBookRef) addressBook{
 //申请地址簿访问权限
 ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
 dispatch_async(dispatch_get_main_queue(), ^{
 if(granted){
 NSLog(@"granted to access Address Book");
 //访问地址簿
 [self accessAddressBook];
 }
 else{
 NSLog(@"Access Address Book fail:%@",error);
 }
 });
 });
 }
 
 -(void)accessAddressBook{
 
 self.allSource=(__bridge NSArray *)(ABAddressBookCopyArrayOfAllPeople(self.addressBook));
 
 if([self.allSource count]>0){
 [self.tableView reloadData];
 
 NSMutableArray *mut = [NSMutableArray array];
 for (NSInteger i = 0; i<self.allSource.count; i++) {
 ABRecordRef record=(__bridge ABRecordRef)(self.allSource[i]);
 CHContacts *contact = [CHContacts initWithRecord:record];
 [mut addObject:contact];
 }
 
 self.allSource = [NSArray arrayWithArray:mut];
 }
 
 }
 */
