//
//  CHContacts.m
//  CHAddressBook
//
//  Created by xunlian on 16/6/21.
//  Copyright © 2016年 xunlian. All rights reserved.
//

#import "CHContacts.h"

@interface CHContacts()

@end

@implementation CHContacts

+ (BOOL)isBlank:(NSString *)str{
    if (!str) {
        return YES;
    }
    if (![str isKindOfClass:[NSString class]]) {
        return YES;
    }
    if ([str isEqualToString:@"null"]||[str isEqualToString:@"NULL"]) {
        return YES;
    }
    return NO;
}

+ (NSString *)formatteMobile:(NSString *)mobile{
    if ([CHContacts isBlank:mobile]) {
        return nil;
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:mobile];
    if ([mutStr hasPrefix:@"86"] || [mutStr hasPrefix:@"+86"]) {
        
    }
    return mutStr;
}

+ (NSString *)stringFrom:(CFStringRef)ref{
    NSString *str = [NSString stringWithFormat:@"%@",ref];
    if ([str isEqualToString:@"null"] || [str isEqualToString:@"(null)"] || [str isEqualToString:@"NULL"] || ![str isKindOfClass:[NSString class]]) {
        return nil;
    }
    return str;
}

+ (instancetype)initWithRecord:(ABRecordRef)record{
    CHContacts *contact = [CHContacts new];
    
    contact.ID = [NSString stringWithFormat:@"%d",ABRecordGetRecordID(record)];
    
    contact.firstName = [CHContacts stringFrom:ABRecordCopyValue(record, kABPersonFirstNameProperty)];
    contact.lastName = [CHContacts stringFrom:ABRecordCopyValue(record, kABPersonLastNameProperty)];
    contact.fullName = contact.lastName;
    if (![CHContacts isBlank:contact.firstName]) {
        contact.fullName = [NSString stringWithFormat:@"%@ %@",contact.lastName,contact.firstName];
    }
    
    //手机号有多条
    ABMultiValueRef phoneNumbersRef = ABRecordCopyValue(record, kABPersonPhoneProperty);
    long count = ABMultiValueGetCount(phoneNumbersRef);
    NSMutableArray *mutArr = [NSMutableArray array];
    for(int i = 0;i < count;++i){
        NSString *phoneLabel = [CHContacts stringFrom:(ABMultiValueCopyLabelAtIndex(phoneNumbersRef, i))];
        NSString *phoneNumber = [CHContacts stringFrom:(ABMultiValueCopyValueAtIndex(phoneNumbersRef, i))];
        //工作、住宅、iPhone、手机、主要、住宅传真、工作传真、传呼、其他
        if ([phoneLabel isEqualToString:(__bridge NSString *)kABWorkLabel]) {
            contact.workNum = phoneNumber;
        }else if ([phoneLabel isEqualToString:(__bridge NSString *)kABHomeLabel]) {
            contact.homeNum = phoneNumber;
        }else if ([phoneLabel isEqualToString:(__bridge NSString *)kABPersonPhoneIPhoneLabel]) {
            contact.iPhoneNum = phoneNumber;
        }else if ([phoneLabel isEqualToString:(__bridge NSString *)kABPersonPhoneMobileLabel]) {
            contact.mobileNum = phoneNumber;
        }else if ([phoneLabel isEqualToString:(__bridge NSString *)kABPersonPhoneMainLabel]) {
            contact.mainNum = phoneNumber;
        }else if ([phoneLabel isEqualToString:(__bridge NSString *)kABPersonPhoneHomeFAXLabel]) {
            contact.HomeFAXNum = phoneNumber;
        }else if ([phoneLabel isEqualToString:(__bridge NSString *)kABPersonPhoneWorkFAXLabel]) {
            contact.workFAXNum = phoneNumber;
        }else if ([phoneLabel isEqualToString:(__bridge NSString *)kABPersonPhonePagerLabel]) {
            contact.pagerNum = phoneNumber;
        }else if ([phoneLabel isEqualToString:(__bridge NSString *)kABOtherLabel]) {
            contact.otherNum = phoneNumber;
        }
        
        if (phoneNumber) {
            [mutArr addObject:phoneNumber];
        }
    }
    contact.phoneList = [NSArray arrayWithArray:mutArr];
    
    
    contact.email = [CHContacts stringFrom:ABRecordCopyValue(record, kABPersonEmailProperty)];
    contact.organization = [CHContacts stringFrom:ABRecordCopyValue(record, kABPersonOrganizationProperty)];
    contact.department = [CHContacts stringFrom:ABRecordCopyValue(record, kABPersonDepartmentProperty)];
    contact.creationDate = [CHContacts stringFrom:ABRecordCopyValue(record, kABPersonCreationDateProperty)];
    
    return contact;
}


- (void)saveToAddressBook:(ABAddressBookRef)addressBook{
    //创建一条记录
    ABRecordRef recordRef = ABPersonCreate();
    //添加名
    ABRecordSetValue(recordRef,kABPersonFirstNameProperty,(__bridge CFTypeRef)(self.firstName),NULL);
    //添加姓
    ABRecordSetValue(recordRef,kABPersonLastNameProperty,(__bridge CFTypeRef)(self.lastName),NULL);
    //创建一个多值属性，因为手机号可以有多个
    ABMutableMultiValueRef multiValueRef = ABMultiValueCreateMutable(kABStringPropertyType);
    //向多值属性中添加工作电话
    ABMultiValueAddValueAndLabel(multiValueRef,(__bridge CFStringRef)(self.workNum),kABWorkLabel,NULL);
    //添加属性到指定记录，这里添加的是多值属性
    ABRecordSetValue(recordRef, kABPersonPhoneProperty, multiValueRef, NULL);
    //添加记录到通讯录
    ABAddressBookAddRecord(addressBook, recordRef, NULL);
    //保存通讯录，提交更改
    ABAddressBookSave(addressBook, NULL);
    //释放资源
    CFRelease(recordRef);
    CFRelease(multiValueRef);
}

- (void)removeFromAddressBook:(ABAddressBookRef)addressBook{
    
}

@end
