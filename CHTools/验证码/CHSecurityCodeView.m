//
//  CHSecurityCodeView.m
//  test
//
//  Created by CHMac on 15/12/23.
//  Copyright © 2015年 CHMac. All rights reserved.
//

#import "CHSecurityCodeView.h"
#import <CoreText/CoreText.h>

@implementation CHSecurityCodeView{
    NSString *securityCode;
}

-(void)refreshCompleteWith:(void (^)(NSString *))completeBlock{
    securityCode = [CHCodeTools getRandomSecurityCodeWithCount:4];
    [self setNeedsDisplay];
    completeBlock(securityCode);
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    if (!securityCode) {
        return;
    }
    
    // 步骤 1 获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // 步骤 2 翻转使coretext坐标与uikit坐标重合
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    
    // 步骤 3 设置绘图区域
    CGMutablePathRef path = CGPathCreateMutable();
    
    
    //增加背景图片
    UIImage *image = nil;
    if (self.bgImg) {
        image = self.bgImg;
    }else{
        image = [UIImage imageNamed:@"bg"];
    }
    
    
    // 步骤 4 设置文本内容
    NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:securityCode];
    for (NSInteger i = 0; i< [securityCode length]; i++) {
        [attString setAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:[CHCodeTools getRandomNumberWithMax:42 andMin:30]],NSKernAttributeName:@5,NSObliquenessAttributeName:@(M_PI_2),NSForegroundColorAttributeName:[UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1]} range:NSMakeRange(i, 1)];
    }
    
    //动态宽高
    CGRect rect0 = [attString boundingRectWithSize:CGSizeMake(1000, rect.size.height) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    //warning 高度小数问题会使验证码无法显示
    rect0 = CGRectMake(rect0.origin.x, rect0.origin.y, ceilf(rect0.size.width), ceilf(rect0.size.height));
    rect0 = CGRectMake(rect.size.width/2-rect0.size.width/2, rect.size.height/2-rect0.size.height/2, rect0.size.width, rect0.size.height);
    CGPathAddRect(path, NULL, rect0);
    CGContextDrawImage(context, rect0, image.CGImage);
    
    CTFramesetterRef framesetter =
    CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attString);
    CTFrameRef frame =
    CTFramesetterCreateFrame(framesetter,
                             CFRangeMake(0, [attString length]), path, NULL);
    
    // 步骤 5 渲染
    CTFrameDraw(frame, context);
    
    // 步骤 6 release
    CFRelease(frame);
    CFRelease(path);
    CFRelease(framesetter);
}


@end
